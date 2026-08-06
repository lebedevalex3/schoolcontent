#!/usr/bin/env bash
set -euo pipefail

# Publishes ready-to-use media to Yandex Disk via WebDAV, preserving paths
# relative to the repository root. It never deletes files from the Disk.

readonly REPOSITORY_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
readonly DEFAULT_NETRC="$REPOSITORY_ROOT/.secrets/yandex-disk.netrc"
readonly NETRC_FILE="${YANDEX_DISK_NETRC:-$DEFAULT_NETRC}"
readonly REMOTE_ROOT="${YANDEX_DISK_REMOTE_ROOT:-School Content}"
readonly WEBDAV_URL="https://webdav.yandex.ru"
readonly DEFAULT_MANIFEST="$REPOSITORY_ROOT/.secrets/yandex-disk-manifest.tsv"
readonly MANIFEST_FILE="${YANDEX_DISK_MANIFEST:-$DEFAULT_MANIFEST}"
created_remote_directories=$'\n'
force_publish=0
adopt_existing=0
uploaded_count=0
skipped_count=0

usage() {
  cat <<'EOF'
Usage: scripts/publish-yandex-disk.sh [--force | --adopt-existing] [path ...]

Uploads PDF, PowerPoint, video and audio files to Yandex Disk. With no path,
publishes all such files from the repository. Every file keeps its repository
relative path under YANDEX_DISK_REMOTE_ROOT (default: School Content).
Unchanged files are skipped using a local SHA-256 manifest.

Required:
  .secrets/yandex-disk.netrc    WebDAV application credentials

Optional environment variables:
  YANDEX_DISK_NETRC             Path to a netrc file with credentials
  YANDEX_DISK_REMOTE_ROOT       Root folder on the Disk
  YANDEX_DISK_MANIFEST          Path to the local upload manifest

Options:
  --force                        Upload all matching files, ignoring the manifest
  --adopt-existing               Record current hashes without uploading files
EOF
}

[[ "${1:-}" != "--help" && "${1:-}" != "-h" ]] || { usage; exit 0; }
case "${1:-}" in
  --force) force_publish=1; shift ;;
  --adopt-existing) adopt_existing=1; shift ;;
esac
[[ -f "$NETRC_FILE" ]] || {
  echo "Missing credentials: $NETRC_FILE" >&2
  echo "Copy config/yandex-disk.netrc.example there and create a WebDAV app password." >&2
  exit 1
}
command -v curl >/dev/null || { echo "curl is required." >&2; exit 1; }
command -v python3 >/dev/null || { echo "python3 is required." >&2; exit 1; }
command -v shasum >/dev/null || { echo "shasum is required." >&2; exit 1; }
mkdir -p "$(dirname "$MANIFEST_FILE")"
touch "$MANIFEST_FILE"

url_encode() {
  python3 -c 'import sys, urllib.parse; print(urllib.parse.quote(sys.argv[1], safe="/"))' "$1"
}

ensure_remote_directory() {
  local directory="$1"
  local accumulated=""
  local part
  IFS='/' read -r -a parts <<< "$directory"
  for part in "${parts[@]}"; do
    [[ -n "$part" ]] || continue
    accumulated="${accumulated:+$accumulated/}$part"
    if [[ "$created_remote_directories" == *$'\n'"$accumulated"$'\n'* ]]; then
      continue
    fi
    curl --silent --show-error --fail --netrc-file "$NETRC_FILE" \
      -X MKCOL "$WEBDAV_URL/$(url_encode "$accumulated")" >/dev/null 2>&1 || true
    created_remote_directories+="$accumulated"$'\n'
  done
}

file_hash() {
  shasum -a 256 "$1" | awk '{print $1}'
}

manifest_hash_for() {
  local remote_path="$1"
  awk -F $'\t' -v path="$remote_path" '$1 == path { hash = $2 } END { print hash }' "$MANIFEST_FILE"
}

record_uploaded_file() {
  local remote_path="$1"
  local hash="$2"
  local temporary_manifest
  temporary_manifest="$(mktemp "$MANIFEST_FILE.tmp.XXXXXX")"

  awk -F $'\t' -v path="$remote_path" '$1 != path { print }' "$MANIFEST_FILE" > "$temporary_manifest"
  printf '%s\t%s\n' "$remote_path" "$hash" >> "$temporary_manifest"
  mv "$temporary_manifest" "$MANIFEST_FILE"
}

publish_file() {
  local file="$1"
  local relative="${file#"$REPOSITORY_ROOT/"}"
  local remote_path="$REMOTE_ROOT/$relative"
  local remote_directory="${remote_path%/*}"
  local hash
  hash="$(file_hash "$file")"

  if (( force_publish == 0 )) && [[ "$(manifest_hash_for "$remote_path")" == "$hash" ]]; then
    printf 'Unchanged, skipped: %s\n' "$relative"
    ((skipped_count += 1))
    return
  fi

  if (( adopt_existing == 1 )); then
    record_uploaded_file "$remote_path" "$hash"
    printf 'Recorded without upload: %s\n' "$relative"
    ((skipped_count += 1))
    return
  fi

  ensure_remote_directory "$remote_directory"
  curl --silent --show-error --fail --netrc-file "$NETRC_FILE" \
    --upload-file "$file" "$WEBDAV_URL/$(url_encode "$remote_path")"
  record_uploaded_file "$remote_path" "$hash"
  printf 'Uploaded: %s\n' "$relative"
  ((uploaded_count += 1))
}

declare -a source_paths
if (( $# == 0 )); then
  source_paths=("$REPOSITORY_ROOT")
else
  source_paths=()
  for path in "$@"; do
    absolute_path="$(cd "$(dirname "$path")" && pwd)/$(basename "$path")"
    [[ "$absolute_path" == "$REPOSITORY_ROOT"/* ]] || {
      echo "Path must be inside the repository: $path" >&2
      exit 1
    }
    source_paths+=("$absolute_path")
  done
fi

declare -a files=()
while IFS= read -r -d '' file; do
  files+=("$file")
done < <(find "${source_paths[@]}" -type f \( \
  -iname '*.pdf' -o -iname '*.ppt' -o -iname '*.pptx' \
  -o -iname '*.mp4' -o -iname '*.mov' -o -iname '*.avi' \
  -o -iname '*.mkv' -o -iname '*.webm' -o -iname '*.m4v' \
  -o -iname '*.mp3' -o -iname '*.wav' \
\) -not -path '*/.git/*' -print0)

(( ${#files[@]} > 0 )) || { echo "No publishable files found."; exit 0; }
printf 'Publishing %d file(s) to Yandex Disk: %s\n' "${#files[@]}" "$REMOTE_ROOT"
for file in "${files[@]}"; do
  publish_file "$file"
done
printf 'Done: uploaded %d, skipped unchanged %d.\n' "$uploaded_count" "$skipped_count"

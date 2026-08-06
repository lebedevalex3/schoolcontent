#!/usr/bin/env bash

# Validates repository hygiene and, with --build, reproducibility of the
# maintained EGE LaTeX collections.
set -euo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
build=0

case "${1:-}" in
  "") ;;
  --build) build=1 ;;
  -h|--help)
    echo "Usage: scripts/validate.sh [--build]"
    exit 0
    ;;
  *)
    echo "Unknown option: $1" >&2
    exit 2
    ;;
esac

cd "$repository_root"

git diff --check
git diff --cached --check

tracked_ignored_files="$(git ls-files -ci --exclude-standard)"
if [[ -n "$tracked_ignored_files" ]]; then
  echo "Tracked files match .gitignore and must be removed from the index:" >&2
  printf '%s\n' "$tracked_ignored_files" >&2
  exit 1
fi

while IFS= read -r -d '' script; do
  bash -n "$script"
done < <(find . -type f -name '*.sh' -not -path './.git/*' -print0)

if (( build == 1 )); then
  bash EGE/build-planimetry-lessons.sh
  bash EGE/collections/2022/build-stereo-2022-ya36-n03.sh
fi

echo "Validation passed."

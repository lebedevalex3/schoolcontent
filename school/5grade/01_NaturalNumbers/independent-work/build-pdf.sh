#!/usr/bin/env bash
set -euo pipefail

WORK_DIR="$(cd "$(dirname "$0")" && pwd)"
REPOSITORY_ROOT="$(cd "$WORK_DIR/../../../.." && pwd)"
OUTPUT_DIR="$REPOSITORY_ROOT/school/5grade/01_NaturalNumbers/output/pdf"
TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TEMP_DIR"' EXIT

if [[ -d /Library/TeX/texbin ]]; then
  export PATH="/Library/TeX/texbin:$PATH"
fi

if ! command -v xelatex >/dev/null 2>&1; then
  printf 'Error: xelatex is not installed or is not available in PATH.\n' >&2
  exit 1
fi

node "$WORK_DIR/generate-latex.mjs" "$TEMP_DIR"
mkdir -p "$OUTPUT_DIR"

for level in A B; do
  xelatex -output-directory="$TEMP_DIR" -interaction=nonstopmode -halt-on-error \
    "$TEMP_DIR/self-study-$level.tex" >/dev/null
  cp "$TEMP_DIR/self-study-$level.pdf" \
    "$OUTPUT_DIR/NaturalNumbers-self-study-$level.pdf"
done

printf 'Готово: %s\n' "$OUTPUT_DIR/NaturalNumbers-self-study-A.pdf"
printf 'Готово: %s\n' "$OUTPUT_DIR/NaturalNumbers-self-study-B.pdf"

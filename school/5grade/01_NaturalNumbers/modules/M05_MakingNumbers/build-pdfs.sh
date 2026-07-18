#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LATEX_DIR="$SCRIPT_DIR/Latex"
OUTPUT_DIR="$SCRIPT_DIR/outputs"
MODULE_CODE="${SCRIPT_DIR##*/}"
MODULE_CODE="${MODULE_CODE%%_*}"

if ! command -v xelatex >/dev/null 2>&1; then
  printf 'Error: xelatex is not installed or is not available in PATH.\n' >&2
  exit 1
fi

if [ ! -d "$LATEX_DIR" ]; then
  printf 'Error: LaTeX directory not found: %s\n' "$LATEX_DIR" >&2
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

main_files=("$LATEX_DIR"/main-*.tex)
if [ ! -e "${main_files[0]}" ]; then
  printf 'Error: no main-*.tex files found in %s\n' "$LATEX_DIR" >&2
  exit 1
fi

for main_path in "${main_files[@]}"; do
  main_file="${main_path##*/}"
  variant="${main_file#main-}"
  variant="${variant%.tex}"
  source_pdf="$LATEX_DIR/${main_file%.tex}.pdf"
  output_pdf="$OUTPUT_DIR/$MODULE_CODE-$variant.pdf"

  (
    cd "$LATEX_DIR"
    xelatex -interaction=nonstopmode -halt-on-error "$main_file" >/dev/null
  )

  cp "$source_pdf" "$output_pdf"
  printf 'Built %s\n' "$output_pdf"
done

printf 'All %s PDFs are in %s\n' "$MODULE_CODE" "$OUTPUT_DIR"


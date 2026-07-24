#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LATEX_DIR="$SCRIPT_DIR/Latex"
SOURCE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)/output/pdf"
OUTPUT_DIR="$SCRIPT_DIR/output/pdf"
BUILD_DIR="${TMPDIR:-/tmp}/pdfs/natural-numbers-student-workbook"

if ! command -v xelatex >/dev/null 2>&1; then
  printf 'Error: xelatex is not installed or is not available in PATH.\n' >&2
  exit 1
fi

required_pdfs=()
for mode in color bw; do
  for module in M01 M02 M03 M04 M05 M06 M07; do
    required_pdfs+=("$SOURCE_DIR/$module-student-$mode.pdf")
  done
done

for pdf_path in "${required_pdfs[@]}"; do
  if [ ! -f "$pdf_path" ]; then
    printf 'Error: source PDF not found: %s\n' "$pdf_path" >&2
    printf 'Run ../modules/build-all.sh before building the workbook.\n' >&2
    exit 1
  fi
done

mkdir -p "$OUTPUT_DIR"
mkdir -p "$BUILD_DIR"

for mode in color bw; do
  main_file="main-$mode.tex"
  source_pdf="$BUILD_DIR/main-$mode.pdf"
  output_pdf="$OUTPUT_DIR/NaturalNumbers-5grade-student-workbook-$mode.pdf"

  (
    cd "$LATEX_DIR"
    xelatex -interaction=nonstopmode -halt-on-error \
      -output-directory="$BUILD_DIR" "$main_file" >/dev/null
    xelatex -interaction=nonstopmode -halt-on-error \
      -output-directory="$BUILD_DIR" "$main_file" >/dev/null
  )

  cp "$source_pdf" "$output_pdf"
  printf 'Built %s\n' "$output_pdf"
done

printf 'Both student workbooks were built successfully.\n'

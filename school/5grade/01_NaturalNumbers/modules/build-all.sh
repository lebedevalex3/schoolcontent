#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SECTION_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
OUTPUT_DIR="$SECTION_DIR/output/pdf"

mkdir -p "$OUTPUT_DIR"

modules=(
  "M01_DigitsAndPlaceValue"
  "M02_ZeroAndExpandedForm"
  "M03_NumberClasses"
  "M04_ReadAndWriteNumbers"
  "M05_MakingNumbers"
  "M06_ExtremeNumbers"
  "M07_ConditionsAndEnumeration"
)

variants=(
  "student"
  "teacher"
  "correction"
  "extension"
)

for module in "${modules[@]}"; do
  latex_dir="$SCRIPT_DIR/$module/Latex"
  module_code="${module%%_*}"

  for variant in "${variants[@]}"; do
    main_file="main-$variant-color.tex"
    pdf_file="main-$variant-color.pdf"
    output_file="$OUTPUT_DIR/$module_code-$variant-color.pdf"

    (
      cd "$latex_dir"
      xelatex -interaction=nonstopmode -halt-on-error "$main_file" >/dev/null
    )

    cp "$latex_dir/$pdf_file" "$output_file"
    printf 'Built %s\n' "$output_file"
  done
done

printf 'All module PDFs built successfully.\n'

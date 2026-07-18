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

for module in "${modules[@]}"; do
  module_dir="$SCRIPT_DIR/$module"
  module_code="${module%%_*}"

  "$module_dir/build-pdfs.sh"

  module_pdfs=("$module_dir/outputs/$module_code"-*.pdf)
  for pdf_path in "${module_pdfs[@]}"; do
    output_file="$OUTPUT_DIR/${pdf_path##*/}"
    cp "$pdf_path" "$output_file"
    printf 'Collected %s\n' "$output_file"
  done
done

printf 'All color and black-and-white module PDFs built successfully.\n'

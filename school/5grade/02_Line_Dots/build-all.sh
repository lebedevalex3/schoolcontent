#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MODULES_DIR="$SCRIPT_DIR/modules"
OUTPUT_DIR="$SCRIPT_DIR/output/pdf"

modules=(
  "M01_BasicGeometryObjects"
  "M02_SegmentMeasurement"
  "M03_LengthUnits"
  "M04_PointsOnSegment"
  "M05_BrokenLineAndPolygon"
  "M06_PolygonNamesAndDiagonals"
  "M07_EqualIntervals"
)

mkdir -p "$OUTPUT_DIR"

for module in "${modules[@]}"; do
  module_dir="$MODULES_DIR/$module"
  module_code="${module%%_*}"

  "$module_dir/build-pdfs.sh"

  module_pdfs=("$module_dir/outputs/$module_code"-*.pdf)
  if [ "${#module_pdfs[@]}" -ne 12 ]; then
    printf 'Error: expected 12 PDFs for %s, found %s.\n' \
      "$module_code" "${#module_pdfs[@]}" >&2
    exit 1
  fi

  for pdf_path in "${module_pdfs[@]}"; do
    output_file="$OUTPUT_DIR/${pdf_path##*/}"
    cp "$pdf_path" "$output_file"
    printf 'Collected %s\n' "$output_file"
  done
done

printf 'All 84 color and black-and-white PDFs built successfully.\n'

#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

command -v pdflatex >/dev/null 2>&1 || {
  echo "Ошибка: pdflatex не найден. Установите MacTeX или TeX Live." >&2
  exit 1
}

command -v xelatex >/dev/null 2>&1 || {
  echo "Ошибка: xelatex не найден. Установите MacTeX или TeX Live." >&2
  exit 1
}

build_sheet() {
  local lesson_dir="$1"
  local latex_dir="$SCRIPT_DIR/courses/planimetry-task1/$lesson_dir/latex"
  local output_dir="$SCRIPT_DIR/courses/planimetry-task1/$lesson_dir/outputs"

  mkdir -p "$output_dir"
  (
    cd "$latex_dir"
    pdflatex -interaction=nonstopmode -halt-on-error -output-directory="$output_dir" main-student.tex
    pdflatex -interaction=nonstopmode -halt-on-error -output-directory="$output_dir" main-teacher.tex
  )
}

build_presentation() {
  local lesson_dir="$1"
  local latex_dir="$SCRIPT_DIR/presentations/planimetry-task1/$lesson_dir/latex"
  local output_dir="$SCRIPT_DIR/presentations/planimetry-task1/$lesson_dir/outputs"

  mkdir -p "$output_dir"
  (
    cd "$latex_dir"
    xelatex -interaction=nonstopmode -halt-on-error -output-directory="$output_dir" main.tex
    xelatex -interaction=nonstopmode -halt-on-error -output-directory="$output_dir" main.tex
  )
}

SHEET_LESSONS=(
  "lesson01-areas-midlines-projections"
  "lesson02-quadrilaterals-equalities"
  "lesson03-triangles-additional-lines"
  "lesson04-circle-arcs-tangents-secants"
)

PRESENTATION_LESSONS=(
  "lesson01-areas-midlines-projections"
  "lesson02-quadrilaterals-equalities"
)

for lesson in "${SHEET_LESSONS[@]}"; do
  echo "Собираю рабочие листы: $lesson"
  build_sheet "$lesson"
done

for lesson in "${PRESENTATION_LESSONS[@]}"; do
  echo "Собираю презентацию: $lesson"
  build_presentation "$lesson"
done

echo "Готово. PDF-файлы находятся в каталогах outputs соответствующих уроков."

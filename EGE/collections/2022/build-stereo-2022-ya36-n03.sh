#!/usr/bin/env bash

set -euo pipefail

ege_dir="$(cd "$(dirname "$0")/../.." && pwd)"
variants=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 35 36)

build_variant() {
  local variant="$1"
  local padded
  local task_dir

  printf -v padded '%02d' "$variant"
  task_dir="$ege_dir/tasks/stereometry/TASK-EGE-STEREO-2022-YA36-V${padded}-N03"
  mkdir -p "$task_dir/outputs"

  (
    cd "$task_dir"
    pdflatex -interaction=nonstopmode -halt-on-error -jobname=main \
      -output-directory=outputs latex/main.tex
  )
}

for variant in "${variants[@]}"; do
  build_variant "$variant"
done

echo "Готово: собраны варианты 1–33, 35 и 36. Вариант 34 ожидает исходник."

#!/usr/bin/env bash
set -euo pipefail

ege_dir="$(cd "$(dirname "$0")/../.." && pwd)"
source_dir="$ege_dir/sources/2022/Yashchenko36/task01"
preamble="$source_dir/preamble.tex"

build_fragment() {
  local variant="$1"
  local source_file="$2"
  local variant_padded
  printf -v variant_padded '%02d' "$variant"
  local task_dir="$ege_dir/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V${variant_padded}-N01"
  local temp_dir

  temp_dir="$(mktemp -d)"
  trap 'rm -rf "$temp_dir"' RETURN
  mkdir -p "$task_dir/outputs"

  {
    cat "$preamble"
    printf '\n\\begin{document}\n'
    awk -v variant="$variant" '
      $0 == "% ВАРИАНТ " variant { inside = 1; next }
      inside && $0 ~ /^% ВАРИАНТ / { exit }
      inside && $0 != "\\end{document}" { print }
    ' "$source_file"
    printf '\n\\end{document}\n'
  } > "$temp_dir/main.tex"

  (
    cd "$task_dir"
    pdflatex -interaction=nonstopmode -halt-on-error -jobname=main \
      -output-directory=outputs "$temp_dir/main.tex"
  )
}

for variant in 5 6 7 8; do
  build_fragment "$variant" "$source_dir/variants-05-08.tex"
done

for variant in 9 10 11 12; do
  build_fragment "$variant" "$source_dir/variants-09-12.tex"
done

for variant in 13 14 15 16 17 18; do
  build_fragment "$variant" "$source_dir/variants-13-18.tex"
done

for variant in 19 20 21 22 23 24; do
  build_fragment "$variant" "$source_dir/variants-19-24.tex"
done

for variant in 25 26 27 28 29 30; do
  build_fragment "$variant" "$source_dir/variants-25-30.tex"
done

#!/usr/bin/env bash

set -euo pipefail

ege_dir="$(cd "$(dirname "$0")/../.." && pwd)"
source_dir="$ege_dir/sources/2022/Yashchenko36/task03"
source_file="$source_dir/raw-submission.tex"
preamble="$source_dir/preamble.tex"

variants=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 35 36)

extract_early_condition() {
  local variant="$1"
  awk -v variant="$variant" '
    /^\\documentclass/ {
      document++
      if (document == variant) {
        print condition
        exit
      }
      condition = ""
      in_document = 1
      next
    }
    /^\\end\{document\}/ { in_document = 0; next }
    !in_document { condition = condition $0 "\n" }
  ' "$source_file" |
    sed -E '/^Ответ: /d; s/\\sqrt\{([^}]*)\}/\\(\\sqrt{\1}\\)/g; s/([0-9])\^\\circ/\\(\1^\\circ\\)/g' |
    perl -pe 's/([A-Z](?:[A-Z]|_[0-9])*)/index($1, "_") >= 0 ? "\\($1\\)" : $1/ge'
}

extract_early_figure() {
  local variant="$1"
  awk -v variant="$variant" '
    /^\\documentclass/ { document++ }
    document == variant && /^\\begin\{document\}/ { capture = 1; next }
    document == variant && /^\\end\{document\}/ { exit }
    document == variant && capture { print }
  ' "$source_file"
}

extract_late_task() {
  local variant="$1"
  awk -v variant="$variant" '
    $0 == "\\section*{Вариант " variant "}" { capture = 1; next }
    capture && /^\\section\*\{Вариант / { exit }
    capture { print }
  ' "$source_file"
}

build_variant() {
  local variant="$1"
  local padded
  local task_dir
  local temporary_dir

  printf -v padded '%02d' "$variant"
  task_dir="$ege_dir/tasks/stereometry/TASK-EGE-STEREO-2022-YA36-V${padded}-N03"
  temporary_dir="$(mktemp -d)"
  trap 'rm -rf "$temporary_dir"' RETURN
  mkdir -p "$task_dir/outputs"

  {
    cat "$preamble"
    printf '\n\\begin{document}\n\\section*{Вариант %d}\n\n' "$variant"
    if (( variant <= 16 )); then
      extract_early_condition "$variant"
      printf '\n\\begin{center}\n'
      extract_early_figure "$variant"
      printf '\\end{center}\n'
    else
      extract_late_task "$variant"
    fi
    printf '\n\\end{document}\n'
  } > "$temporary_dir/main.tex"

  (
    cd "$task_dir"
    pdflatex -interaction=nonstopmode -halt-on-error -jobname=main \
      -output-directory=outputs "$temporary_dir/main.tex"
  )
}

for variant in "${variants[@]}"; do
  build_variant "$variant"
done

echo "Готово: собраны варианты 1–33, 35 и 36. Вариант 34 ожидает исходник."

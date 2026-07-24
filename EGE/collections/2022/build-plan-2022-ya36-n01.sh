#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "$0")/../.." && pwd)"
task_ids=(
  TASK-EGE-PLAN-2022-YA36-V01-N01
  TASK-EGE-PLAN-2022-YA36-V02-N01
  TASK-EGE-PLAN-2022-YA36-V03-N01
  TASK-EGE-PLAN-2022-YA36-V04-N01
)

for task_id in "${task_ids[@]}"; do
  task_dir="$root_dir/tasks/planimetry/$task_id"
  mkdir -p "$task_dir/outputs"
  (
    cd "$task_dir"
    pdflatex -interaction=nonstopmode -halt-on-error -output-directory=outputs latex/main.tex
  )
done

#!/usr/bin/env bash
set -euo pipefail

ege_dir="$(cd "$(dirname "$0")/../.." && pwd)"
source_dir="$ege_dir/sources/2022/Yashchenko36/task01"
preamble="$source_dir/preamble.tex"

build_fragment() {
  local variant="$1"
  local source_file="$2"
  local figure_call="$3"
  local variant_padded
  printf -v variant_padded '%02d' "$variant"
  local task_dir="$ege_dir/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V${variant_padded}-N01"
  local temp_dir

  temp_dir="$(mktemp -d)"
  trap 'rm -rf "$temp_dir"' RETURN
  mkdir -p "$task_dir/outputs"

  {
    cat "$preamble"
    printf '\n\\input{latex/figure.tex}\n'
    printf '\n\\begin{document}\n'
    awk -v variant="$variant" -v figure_call="$figure_call" '
      $0 == "% ВАРИАНТ " variant { inside = 1; next }
      inside && $0 ~ /^% ВАРИАНТ / { exit }
      !inside || $0 == "\\end{document}" { next }
      $0 == "\\begin{center}" {
        print
        print "\\" figure_call
        skip_figure = 1
        next
      }
      skip_figure && $0 == "\\end{center}" {
        print
        skip_figure = 0
        next
      }
      !skip_figure { print }
    ' "$source_file"
    printf '\n\\end{document}\n'
  } > "$temp_dir/main.tex"

  (
    cd "$task_dir"
    pdflatex -interaction=nonstopmode -halt-on-error -jobname=main \
      -output-directory=outputs "$temp_dir/main.tex"
  )
}

build_fragment 5  "$source_dir/variants-05-08.tex"  'figParallelogramBisector'
build_fragment 6  "$source_dir/variants-05-08.tex"  'figParallelogramTwoBisectors'
build_fragment 7  "$source_dir/variants-05-08.tex"  'figRightAltitudeMedian{50}'
build_fragment 8  "$source_dir/variants-05-08.tex"  'figRightBisectorMedian'
build_fragment 9  "$source_dir/variants-09-12.tex"  'figRhombusCircle{10}'
build_fragment 10 "$source_dir/variants-09-12.tex"  'figRhombusInradius'
build_fragment 11 "$source_dir/variants-09-12.tex"  'figIncenterBisectors{46}'
build_fragment 12 "$source_dir/variants-09-12.tex"  'figIsoscelesSine{6}{8}'
build_fragment 13 "$source_dir/variants-13-18.tex" 'figTangentialPerimeter'
build_fragment 14 "$source_dir/variants-13-18.tex" 'figTangentPair{39}'
build_fragment 15 "$source_dir/variants-13-18.tex" 'figCyclicChord{106}{69}'
build_fragment 16 "$source_dir/variants-13-18.tex" 'figCyclicOpposite{127}'
build_fragment 17 "$source_dir/variants-13-18.tex" 'figExternalSecants{106}{48}'
build_fragment 18 "$source_dir/variants-13-18.tex" 'figCircumcircleSide{2\\sqrt3}{120}'
build_fragment 19 "$source_dir/variants-19-24.tex" 'figRightTriangle'
build_fragment 20 "$source_dir/variants-19-24.tex" 'figMidlineTriangle'
build_fragment 21 "$source_dir/variants-19-24.tex" 'figRightTangentialTrapezoid{37}'
build_fragment 22 "$source_dir/variants-19-24.tex" 'figTangentialQuad{8}{5}{27}'
build_fragment 23 "$source_dir/variants-19-24.tex" 'figParallelogramMidpoints'
build_fragment 24 "$source_dir/variants-19-24.tex" 'figCyclicTwoAngles'
build_fragment 25 "$source_dir/variants-25-30.tex" 'figRightAltitudeBisector'
build_fragment 26 "$source_dir/variants-25-30.tex" 'figRightBisectorMedian'
build_fragment 27 "$source_dir/variants-25-30.tex" 'figTrapezoidDiagonal'
build_fragment 28 "$source_dir/variants-25-30.tex" 'figTrapezoidParallel{41}{83}'
build_fragment 29 "$source_dir/variants-25-30.tex" 'figTriangleAltitudes'
build_fragment 30 "$source_dir/variants-25-30.tex" 'figIsoscelesTrapezoid'
build_fragment 31 "$source_dir/variants-31-34.tex" 'figCyclicChord'
build_fragment 32 "$source_dir/variants-31-34.tex" 'figTriangleAltitudes'
build_fragment 33 "$source_dir/variants-31-34.tex" 'figTangentSecant'
build_fragment 34 "$source_dir/variants-31-34.tex" 'figTangentSecantReverse'

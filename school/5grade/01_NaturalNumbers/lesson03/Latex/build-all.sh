#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p pdf build
for main in main-*.tex; do
  base="${main%.tex}"
  xelatex -interaction=nonstopmode -halt-on-error -output-directory=build "$main" >/dev/null
  xelatex -interaction=nonstopmode -halt-on-error -output-directory=build "$main" >/dev/null
  case "$base" in
    main-reference-*) out="lesson3-reference-${base##main-reference-}" ;;
    main-student-*) out="lesson3-student-${base##main-student-}" ;;
    main-teacher-*) out="lesson3-teacher-${base##main-teacher-}" ;;
    main-homework-student-*) out="lesson3-homework-student-${base##main-homework-student-}" ;;
    main-homework-teacher-*) out="lesson3-homework-teacher-${base##main-homework-teacher-}" ;;
  esac
  cp "build/$base.pdf" "pdf/$out.pdf"
done
rm -rf build

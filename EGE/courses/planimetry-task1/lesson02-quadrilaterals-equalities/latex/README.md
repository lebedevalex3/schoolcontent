# Сборка урока 2

Из папки `latex/` выполните:

```bash
mkdir -p ../outputs
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-student.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-teacher.tex
```

Создаются `../outputs/main-student.pdf` и `../outputs/main-teacher.pdf`.
Схемы в `figures.tex` — шаблонные: не менять конфигурацию, вершины, линии и
оформление. Числа в условиях намеренно не напечатаны на схемах.

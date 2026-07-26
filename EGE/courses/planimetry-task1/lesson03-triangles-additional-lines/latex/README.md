# Сборка урока 3

Из папки `latex/` выполните:

```bash
mkdir -p ../outputs
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-student.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-teacher.tex
```

Создаются `../outputs/main-student.pdf` и `../outputs/main-teacher.pdf`.
Схемы в `figures.tex` — фиксированные шаблоны исходных задач: изменять можно
только уже напечатанные числовые метки и только вместе с условием.

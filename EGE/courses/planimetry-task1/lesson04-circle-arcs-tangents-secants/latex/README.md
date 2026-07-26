# LaTeX-исходники урока 4

Собрать ученическую версию:

```bash
cd EGE/courses/planimetry-task1/lesson04-circle-arcs-tangents-secants/latex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-student.tex
```

Для учительской версии замените `main-student.tex` на `main-teacher.tex`.
Промежуточные файлы и PDF находятся в `outputs/` и не добавляются в Git.

# LaTeX-комплект урока 1

- main-student.tex — лист для ученика;
- main-teacher.tex — та же структура с ответами и краткими опорами;
- lesson-content.tex — общее содержание;
- figures.tex — ссылки на канонические рисунки исходных задач.

Каждая задача размещена вертикально: сначала её текст, затем рисунок. TikZ-код
не копируется: figures.tex подключает latex/figure.tex из карточек задач.

Собирать из этой папки:

~~~bash
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-student.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-teacher.tex
~~~

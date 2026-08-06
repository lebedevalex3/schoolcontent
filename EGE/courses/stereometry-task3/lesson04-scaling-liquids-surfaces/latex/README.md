# LaTeX-комплект урока 4

Каждая задача размещена вертикально: текст, затем канонический рисунок.
Файл figures.tex подключает рисунки из карточек исходных задач без копирования TikZ-кода.

~~~bash
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-student.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-teacher.tex
~~~

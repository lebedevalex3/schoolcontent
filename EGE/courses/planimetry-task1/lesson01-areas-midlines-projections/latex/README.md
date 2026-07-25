# LaTeX-комплект урока 1

- `main-student.tex` — лист для ученика;
- `main-teacher.tex` — та же структура с краткими ответами и опорами;
- `lesson-content.tex` — общее содержание;
- `figures.tex` — шаблонные схемы конфигураций.

Собирать из этой папки:

```bash
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-student.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-teacher.tex
```

Схемы в `figures.tex` не перестраиваются для аналогов. Если число явно написано
на схеме и изменено в условии, меняется только это числовое значение в той же
подписи.

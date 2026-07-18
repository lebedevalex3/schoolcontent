# 03. Точки на отрезке

Комплект для 5 класса по теме «Точки на отрезке. Взаимное расположение».

## Состав

- `content-reference.tex` — справочный лист;
- `content-student.tex` — рабочий лист ученика;
- `content-teacher.tex` — учительская версия с ответами;
- `figures.tex` — TikZ-рисунки;
- `style-common.sty`, `style-color.sty`, `style-bw.sty` — стили;
- `main-*.tex` — точки сборки цветных и чёрно-белых версий.

## Сборка

```bash
lualatex main-reference-color.tex
lualatex main-reference-bw.tex
lualatex main-student-color.tex
lualatex main-student-bw.tex
lualatex main-teacher-color.tex
lualatex main-teacher-bw.tex
```

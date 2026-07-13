# Логарифмическое неравенство: скорректированный комплект листов

Тема:

\[
\lg^4((x^2-4)^2)-\lg^2((x^2-4)^4)\ge192.
\]

В комплекте отдельно отрабатываются три похожие записи:

\[
\lg^2 A=(\lg A)^2,
\qquad
\lg(A^2),
\qquad
\log_2 A.
\]

Основной маршрут решения:

\[
y=\lg|x^2-4|,
\qquad
t=y^2=\lg^2|x^2-4|.
\]

## Состав

- `content-student.tex` — ученический лист с пропусками, таблицами, местом для записей и восстановлением полного решения;
- `content-teacher.tex` — сценарий занятия, полное и альтернативное решения, типичные ошибки, дифференциация и критерии;
- `homework-content.tex` — домашняя работа с постепенным снятием опор;
- `homework-solutions.tex` — решения и диагностические комментарии;
- `figures.tex` — TikZ-схемы нотации, цепочки замен и числовые прямые;
- `style-common.sty`, `style-color.sty`, `style-bw.sty`, `homework-style.sty` — стили.

## Точки входа

- `main-student-color.tex`, `main-student-bw.tex`;
- `main-teacher-color.tex`, `main-teacher-bw.tex`;
- `main-homework-student-color.tex`, `main-homework-student-bw.tex`;
- `main-homework-teacher-color.tex`, `main-homework-teacher-bw.tex`.

## Сборка

Используется XeLaTeX:

```bash
xelatex -interaction=nonstopmode -halt-on-error main-student-color.tex
```

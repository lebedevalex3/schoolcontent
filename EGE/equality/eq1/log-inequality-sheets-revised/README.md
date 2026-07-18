# Логарифмическое неравенство: комплект из двух учебных частей

Тема:

\[
\lg^4((x^2-4)^2)-\lg^2((x^2-4)^4)\ge192.
\]

Комплект разделён на две последовательные части:

1. **Готовимся к решению** --- нотация, ОДЗ, формула с модулем, конструкция
   \(0<|u|\le a\) и переход от \(x^2\) к \(x\).
2. **Решаем логарифмическое неравенство** --- две замены, обратный переход
   и сборка точного ответа.

В первой части отдельно отрабатываются три похожие записи:

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

- `content-tools-student.tex` — часть 1 с четырьмя ключевыми переходами и проверкой готовности;
- `content-solution-student.tex` — часть 2 с решением задачи и восстановлением полного решения;
- `content-teacher.tex` — сценарий занятия, полное и альтернативное решения, типичные ошибки, дифференциация и критерии;
- `homework-content.tex` — домашняя работа с постепенным снятием опор;
- `homework-short-answers.tex` — краткие ответы для самостоятельной проверки ученика;
- `homework-solutions.tex` — решения и диагностические комментарии;
- `figures.tex` — TikZ-схемы нотации, цепочки замен и числовые прямые;
- `style-common.sty`, `style-color.sty`, `style-bw.sty`, `homework-style.sty` — стили.

## Точки входа

- `main-tools-student-color.tex`, `main-tools-student-bw.tex` — часть 1;
- `main-solution-student-color.tex`, `main-solution-student-bw.tex` — часть 2;
- `main-teacher-color.tex`, `main-teacher-bw.tex`;
- `main-homework-student-color.tex`, `main-homework-student-bw.tex`;
- `main-homework-teacher-color.tex`, `main-homework-teacher-bw.tex`.

## Сборка

Используется XeLaTeX:

```bash
xelatex -interaction=nonstopmode -halt-on-error main-tools-student-color.tex
xelatex -interaction=nonstopmode -halt-on-error main-solution-student-color.tex
```

Для чёрно-белой печати замените суффикс `color` на `bw`. Методическая версия
и практикум собираются через соответствующие файлы `main-teacher-*` и
`main-homework-*`.

## Шрифты

Комплект использует стандартные системные шрифты macOS:

- Times New Roman — основной текст;
- Arial — заголовки и служебные подписи;
- Courier New — моноширинный текст;
- стандартные шрифты LaTeX — математические формулы и специальные символы.

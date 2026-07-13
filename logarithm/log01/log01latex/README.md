# Комплект №1. Логарифм: в какую степень?

Комплект посвящён первому знакомству с логарифмом как показателем степени.
Центральная связь:

```tex
\log_a b=c \Longleftrightarrow a^c=b.
```

## Состав

- `content-reference.tex` — справочный лист с теорией, примерами и заданиями;
- `content-student.tex` — рабочий лист ученика;
- `content-teacher.tex` — методическая версия и ответы к рабочему листу;
- `homework-content.tex` — домашняя работа;
- `homework-solutions.tex` — решения и диагностические комментарии;
- `figures.tex` — общие TikZ-рисунки;
- `style-common.sty`, `style-color.sty`, `style-bw.sty` — оформление;
- `homework-style.sty` — оформление домашней работы;
- `main-*.tex` — точки сборки цветных и чёрно-белых версий.

## Готовые PDF

- справочный лист: `main-reference-color.pdf`, `main-reference-bw.pdf`;
- рабочий лист: `main-student-color.pdf`, `main-student-bw.pdf`;
- методическая версия: `main-teacher-color.pdf`, `main-teacher-bw.pdf`;
- домашняя работа ученика: `main-homework-student-color.pdf`, `main-homework-student-bw.pdf`;
- домашняя работа с решениями: `main-homework-teacher-color.pdf`, `main-homework-teacher-bw.pdf`.

## Сборка

Используется XeLaTeX. Например:

```bash
xelatex main-reference-color.tex
xelatex main-student-color.tex
xelatex main-teacher-color.tex
xelatex main-homework-student-color.tex
xelatex main-homework-teacher-color.tex
```

Для чёрно-белой печати замените суффикс `color` на `bw`.

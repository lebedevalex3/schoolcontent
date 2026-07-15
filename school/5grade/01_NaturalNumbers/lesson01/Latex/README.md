# Урок 1. Цифры, числа и разряды

Комплект для первого урока темы «Обозначение натуральных чисел» в 5 классе.

## Состав

- `content-reference.tex` — теоретический лист;
- `content-student.tex` — рабочий лист ученика;
- `content-teacher.tex` — версия учителя с ответами и методическими комментариями;
- `homework-content.tex` — домашняя работа;
- `homework-solutions.tex` — решения домашней работы;
- `figures.tex` — TikZ-схемы;
- `style-common.sty`, `style-color.sty`, `style-bw.sty` — стили;
- `homework-style.sty` — дополнительные стили домашней работы;
- `main-*.tex` — сборочные файлы для цветной и чёрно-белой версий.

## Сборка

Используется XeLaTeX:

```bash
xelatex main-student-color.tex
xelatex main-teacher-color.tex
xelatex main-reference-color.tex
xelatex main-homework-student-color.tex
xelatex main-homework-teacher-color.tex
```

Для чёрно-белой печати замените `color` на `bw`.

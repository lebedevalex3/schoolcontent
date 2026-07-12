# Комплект «Скрытый треугольник и окружность»

## Состав

- `content-student.tex` — учебный лист с подготовительными заданиями и управляемым решением;
- `content-homework.tex` — домашняя работа;
- `content-teacher.tex` — решения, методические комментарии и критерии оценивания;
- `figures.tex` — общий TikZ-код рисунков;
- `style-common.sty` — общая типографика и команды;
- `style-color.sty` / `style-bw.sty` — цветная и чёрно-белая версии.

## Сборка

Компилировать XeLaTeX, например:

```bash
xelatex main-student-color.tex
xelatex main-homework-color.tex
xelatex main-teacher-color.tex
```

Для чёрно-белых версий заменить `color` на `bw`.

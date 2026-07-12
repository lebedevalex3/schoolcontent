# Домашняя работа: рациональные уравнения с модулем и параметром

Комплект продолжает теоретический лист «Три метода решения одной задачи».

## Файлы

- `homework-content.tex` — ученический лист;
- `homework-solutions.tex` — решения и методические комментарии;
- `homework-style.sty` — дополнительные окружения домашней работы;
- `style-common.sty`, `style-color.sty`, `style-bw.sty` — общие стили серии;
- `main-student-color.tex` — ученическая цветная версия;
- `main-student-bw.tex` — ученическая чёрно-белая версия;
- `main-teacher-color.tex` — учительская цветная версия;
- `main-teacher-bw.tex` — учительская чёрно-белая версия.

## Сборка

Компилировать XeLaTeX, например:

```bash
xelatex -interaction=nonstopmode -halt-on-error main-student-color.tex
xelatex -interaction=nonstopmode -halt-on-error main-teacher-color.tex
```

Для стабильного обновления ссылок и разметки рекомендуется два запуска XeLaTeX.

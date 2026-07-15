# Урок 2. Классы. Чтение и запись чисел

Комплект материалов для 5 класса по теме «Обозначение натуральных чисел».

## Состав

- `content-reference.tex` — теоретический лист;
- `content-student.tex` — рабочий лист ученика;
- `content-teacher.tex` — версия учителя с ответами и комментариями;
- `homework-content.tex` — домашняя работа;
- `homework-solutions.tex` — решения;
- `figures.tex` — TikZ-схемы;
- `style-common.sty`, `style-color.sty`, `style-bw.sty` — стили;
- `main-*.tex` — сборочные файлы;
- `pdf/` — готовые цветные и чёрно-белые PDF.

## Сборка

Требуется XeLaTeX и шрифты Tinos, Arimo, DejaVu Sans Mono.

```bash
xelatex -interaction=nonstopmode -halt-on-error main-student-color.tex
```

Для сборки всех вариантов запустите:

```bash
bash build-all.sh
```

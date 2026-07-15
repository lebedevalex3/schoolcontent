# M02. Ноль и разрядный состав

Второй модуль раздела «Обозначение натуральных чисел».

## Результат

Ученик объясняет роль нуля в позиционной записи, раскладывает число на
разрядные слагаемые и восстанавливает число обратно.

## Предварительное условие

Пройдена контрольная точка M01: ученик определяет разряд и значение цифры.

## Ориентировочное время

15–20 минут. Переход определяется контрольной точкой.

## Комплект

- `content-student.tex` — базовый лист ученика;
- `content-teacher.tex` — ответы и решения по маршруту;
- `content-correction.tex` — коррекционная карточка M02-R;
- `content-extension.tex` — усложнение M02★;
- `main-*.tex` — сборочные файлы.

## Сборка

Запускать из папки `Latex`:

```bash
xelatex -interaction=nonstopmode -halt-on-error main-student-color.tex
xelatex -interaction=nonstopmode -halt-on-error main-teacher-color.tex
xelatex -interaction=nonstopmode -halt-on-error main-correction-color.tex
xelatex -interaction=nonstopmode -halt-on-error main-extension-color.tex
```

Итоговые PDF сохраняются в общей папке `output/pdf/`:

- `M02-student-color.pdf` — 2 страницы;
- `M02-teacher-color.pdf` — 2 страницы;
- `M02-correction-color.pdf` — 1 страница;
- `M02-extension-color.pdf` — 1 страница.

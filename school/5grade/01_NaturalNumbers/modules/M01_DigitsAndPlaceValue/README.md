# M01. Цифры, числа и разряды

Пилотный модуль модульной версии раздела «Обозначение натуральных чисел».

## Результат

Ученик определяет разряд цифры и называет её значение в записи числа.

## Ориентировочное время

15–20 минут. Переход определяется контрольной точкой, а не временем.

## Комплект

- `content-student.tex` — базовый лист ученика;
- `content-teacher.tex` — ответы и решения по маршруту;
- `content-correction.tex` — коррекционная карточка M01-R;
- `content-extension.tex` — усложнение M01★;
- `main-*.tex` — сборочные файлы.

Модуль использует общий стиль из `modules/common/Latex`. В нём применяются
доступные Times New Roman и Arial. Общий стиль используется всеми следующими
модулями.

## Сборка

Запускать из папки `Latex`:

```bash
xelatex -interaction=nonstopmode -halt-on-error main-student-color.tex
xelatex -interaction=nonstopmode -halt-on-error main-teacher-color.tex
xelatex -interaction=nonstopmode -halt-on-error main-correction-color.tex
xelatex -interaction=nonstopmode -halt-on-error main-extension-color.tex
```

Проверенные итоговые PDF сохраняются в общей папке `output/pdf/`:

- `M01-student-color.pdf` — 2 страницы;
- `M01-teacher-color.pdf` — 2 страницы;
- `M01-correction-color.pdf` — 1 страница;
- `M01-extension-color.pdf` — 1 страница.

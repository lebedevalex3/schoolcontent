# M01. Цифры, числа и разряды

Пилотный модуль модульной версии раздела «Обозначение натуральных чисел».

## Результат

Ученик определяет разряд цифры и называет её значение в записи числа.

## Организация работы

Время не ограничивается. Переход определяется контрольной точкой, а объём
практики — устойчивостью результата.

## Комплект

- `content-student.tex` — базовый лист ученика;
- `content-teacher.tex` — ответы и решения по маршруту;
- `content-correction.tex` — коррекционная карточка M01-R;
- `content-extension.tex` — усложнение M01★;
- `content-homework-student.tex` — домашняя работа M01-H;
- `content-homework-teacher.tex` — ответы и критерии проверки M01-H;
- `main-*.tex` — сборочные файлы.

## Маршрут

При подмене значения цифры самой цифрой, определении разрядов слева или
пропуске нулевого разряда назначается M01-R. Для самостоятельного закрепления
используется M01-H. После устойчивого контроля ученик переходит к M02; M01★
выполняется дополнительно.

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
xelatex -interaction=nonstopmode -halt-on-error main-homework-student-color.tex
xelatex -interaction=nonstopmode -halt-on-error main-homework-teacher-color.tex
```

Проверенные итоговые PDF сохраняются в папке `outputs/` модуля:

- `M01-student-color.pdf` — 5 страниц;
- `M01-teacher-color.pdf` — 5 страниц;
- `M01-correction-color.pdf` — 1 страница;
- `M01-extension-color.pdf` — 1 страница;
- `M01-homework-student-color.pdf` — домашняя работа ученика, 1 страница;
- `M01-homework-teacher-color.pdf` — ответы для учителя, 1 страница.

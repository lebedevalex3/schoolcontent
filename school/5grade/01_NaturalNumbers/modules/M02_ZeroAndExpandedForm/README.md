# M02. Ноль и разрядный состав

Второй модуль раздела «Обозначение натуральных чисел».

## Результат

Ученик объясняет роль нуля в позиционной записи, раскладывает число на
разрядные слагаемые и восстанавливает число обратно.

## Предварительное условие

Пройдена контрольная точка M01: ученик определяет разряд и значение цифры.

Модуль не ограничен временем. Переход определяется достижением результата в
контрольной точке, а объём практики выбирается по устойчивости способа.

## Комплект

- `content-student.tex` — полный учебный маршрут ученика;
- `content-teacher.tex` — ответы и решения по маршруту;
- `content-correction.tex` — коррекционная карточка M02-R;
- `content-extension.tex` — усложнение M02★;
- `content-homework-student.tex` — домашняя работа M02-H;
- `content-homework-teacher.tex` — ответы и критерии проверки M02-H;
- `main-*.tex` — сборочные файлы.

## Маршрут

При потере разряда, неверном значении цифры или необъяснённой роли нуля
назначается M02-R. Если способ понятен, но требует тренировки, используются
дополнительная практика или M02-H. После устойчивого контроля ученик
переходит к M03; M02★ выполняется дополнительно.

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

Итоговые PDF сохраняются в папке `outputs/` модуля:

- `M02-student-color.pdf` — основной лист ученика, 6 страниц;
- `M02-teacher-color.pdf` — версия учителя, 6 страниц;
- `M02-correction-color.pdf` — коррекционная карточка, 2 страницы;
- `M02-extension-color.pdf` — усложнение, 2 страницы;
- `M02-homework-student-color.pdf` — домашняя работа, 2 страницы;
- `M02-homework-teacher-color.pdf` — ответы к домашней работе, 2 страницы.

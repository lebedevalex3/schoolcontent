# M05. Составление чисел из цифр

Пятый модуль раздела «Обозначение натуральных чисел».

## Результат

Ученик точно читает условие переборной задачи, строит полный упорядоченный
список чисел, учитывает повторения, обязательность цифр и запрет нуля в начале
записи, обнаруживает пропуски и повторы.

## Предварительные условия

Ученик различает цифру и число, понимает значение позиции цифры. Основная
опора — результаты M01 и M02.

Модуль не ограничен временем. Переход определяется достижением результата в
контрольной точке, а объём практики выбирается по устойчивости способа.

## Комплект

- `content-student.tex` — полный учебный маршрут ученика;
- `content-teacher.tex` — ответы, диагностика и маршрут учителя;
- `content-correction.tex` — коррекционная карточка M05-R;
- `content-extension.tex` — усложнение M05★;
- `content-homework-student.tex` — домашняя работа M05-H;
- `content-homework-teacher.tex` — ответы и критерии проверки M05-H;
- `main-*.tex` — сборочные файлы.

## Маршрут

Ученик выполняет обязательное ядро и контрольную точку. При случайном или
неполном переборе, изменении условия либо ведущем нуле назначается M05-R. Если
способ понятен, но требует закрепления, используются дополнительные задания
или M05-H. После устойчивого контроля ученик переходит к M06; M05★ выполняется
дополнительно.

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

- `M05-student-color.pdf` — основной лист ученика, 6 страниц;
- `M05-teacher-color.pdf` — версия учителя, 6 страниц;
- `M05-correction-color.pdf` — коррекционная карточка, 2 страницы;
- `M05-extension-color.pdf` — усложнение, 2 страницы;
- `M05-homework-student-color.pdf` — домашняя работа, 2 страницы;
- `M05-homework-teacher-color.pdf` — ответы к домашней работе, 2 страницы.

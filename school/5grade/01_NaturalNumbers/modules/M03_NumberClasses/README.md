# M03. Классы многозначных чисел

Третий модуль раздела «Обозначение натуральных чисел».

## Результат

Ученик делит запись числа справа налево на классы, называет классы единиц,
тысяч и миллионов, различает группу класса и количество его единиц,
восстанавливает число по описанию классов.

## Предварительное условие

Пройдена контрольная точка M02: ученик сохраняет нулевые разряды при записи
числа.

Модуль не ограничен временем. Переход определяется достижением результата в
контрольной точке, а объём практики выбирается по устойчивости способа.

## Комплект

- `content-student.tex` — полный учебный маршрут ученика;
- `content-teacher.tex` — ответы, диагностика и маршрут учителя;
- `content-correction.tex` — коррекционная карточка M03-R;
- `content-extension.tex` — усложнение M03★;
- `content-homework-student.tex` — домашняя работа M03-H;
- `content-homework-teacher.tex` — ответы и критерии проверки M03-H;
- `main-*.tex` — сборочные файлы.

## Маршрут

При делении записи слева, неполной группе или потере нулей назначается M03-R.
Для самостоятельного закрепления деления и сборки числа по классам
используется M03-H. После устойчивого контроля ученик переходит к M04; M03★
выполняется дополнительно.

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

- `M03-student-color.pdf` — основной лист ученика, 6 страниц;
- `M03-teacher-color.pdf` — версия учителя, 5 страниц;
- `M03-correction-color.pdf` — коррекционная карточка, 2 страницы;
- `M03-extension-color.pdf` — усложнение, 2 страницы;
- `M03-homework-student-color.pdf` — домашняя работа, 2 страницы;
- `M03-homework-teacher-color.pdf` — ответы к домашней работе, 2 страницы.

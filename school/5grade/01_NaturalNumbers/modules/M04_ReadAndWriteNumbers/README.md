# M04. Чтение и запись многозначных чисел

Четвёртый модуль раздела «Обозначение натуральных чисел».

## Результат

Ученик читает многозначные числа, правильно согласует названия классов,
записывает числа цифрами, сохраняет нулевые классы и три позиции внутри групп.

## Предварительное условие

Пройдена контрольная точка M03: ученик делит запись числа справа налево на
классы и сохраняет три цифры во всех группах, кроме крайней левой.

Модуль не ограничен временем. Переход определяется достижением результата в
контрольной точке, а объём практики выбирается по устойчивости способа.

## Комплект

- `content-student.tex` — полный учебный маршрут ученика;
- `content-teacher.tex` — ответы, диагностика и маршрут учителя;
- `content-correction.tex` — коррекционная карточка M04-R;
- `content-extension.tex` — усложнение M04★;
- `content-homework-student.tex` — домашняя работа M04-H;
- `content-homework-teacher.tex` — ответы и критерии проверки M04-H;
- `main-*.tex` — сборочные файлы.

## Маршрут

При потере нулевого класса, неполной группе или неверном чтении назначается
M04-R. Если чтение и запись понятны, но требуют тренировки, используются
дополнительная практика или M04-H. После устойчивого контроля ученик
переходит к M05; M04★ выполняется дополнительно.

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

- `M04-student-color.pdf` — основной лист ученика, 5 страниц;
- `M04-teacher-color.pdf` — версия учителя, 5 страниц;
- `M04-correction-color.pdf` — коррекционная карточка, 2 страницы;
- `M04-extension-color.pdf` — усложнение, 2 страницы;
- `M04-homework-student-color.pdf` — домашняя работа, 2 страницы;
- `M04-homework-teacher-color.pdf` — ответы к домашней работе, 2 страницы.

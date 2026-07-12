# Рациональное уравнение с модулем и параметром

Переработанный комплект построен по модели рабочего листа с постепенным открытием решения.

## Основные файлы

- `content-student.tex` — ученический рабочий лист с пропусками, таблицами, рисунками и самостоятельной реконструкцией доказательства.
- `content-teacher.tex` — методический сценарий, ответы, полное решение, типичные ошибки и дифференциация.
- `homework-content.tex` — домашняя работа с постепенным снятием опор.
- `homework-solutions.tex` — решения и комментарии для учителя.
- `content-reference.tex` — сохранённая исходная полная теория с тремя методами.

## Сборка XeLaTeX

Ученический лист:

```bash
xelatex main-student-color.tex
xelatex main-student-bw.tex
```

Учительская версия:

```bash
xelatex main-teacher-color.tex
xelatex main-teacher-bw.tex
```

Домашняя работа:

```bash
xelatex main-homework-student-color.tex
xelatex main-homework-student-bw.tex
xelatex main-homework-teacher-color.tex
xelatex main-homework-teacher-bw.tex
```

Исходная полная версия:

```bash
xelatex main-reference-color.tex
xelatex main-reference-bw.tex
```

## Архитектурные изменения

1. Ученический и учительский контент разделены.
2. В ученическом листе один метод является основным, остальные работают как осмысление и расширение.
3. Добавлены рабочие блоки `thinkbox`, `fillbox`, `checkpointbox`, `reflectionbox`, `teacherbox`.
4. Добавлены рабочие версии логической схемы, графика и числовой прямой.
5. В домашней работе опоры постепенно снимаются: подробная карта → сокращённая карта → самостоятельное решение.
6. Имена файлов нормализованы: без суффиксов `(1)`, `(7)` и т. п.

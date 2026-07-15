# Контекст блока: логарифмическое неравенство

## Назначение

Папка содержит единый учебно-методический комплект по неравенству

\[
\lg^4((x^2-4)^2)-\lg^2((x^2-4)^4)\ge192.
\]

Комплект рассчитан на два последовательных занятия и состоит из материалов
для ученика, домашней работы и методической версии для учителя.

## Педагогическая логика

1. В части 1 ученик осваивает четыре перехода:
   - различает `\lg^2 A`, `\lg(A^2)` и `\log_2 A`;
   - учитывает ОДЗ и использует формулу `\lg(z^2)=2\lg|z|`;
   - решает условия вида `0<|u|\le a` и `|u|\ge a`;
   - переходит от условий на `x^2` к обеим симметричным частям ответа для `x`.
2. В части 2 ученик решает основное неравенство через замены
   `y=\lg|x^2-4|` и `t=y^2`, выполняет обратный переход и собирает точный
   ответ.
3. Домашняя работа закрепляет те же действия с постепенным снятием опор.
4. Методическая версия содержит сценарий уроков, полное решение, типичные
   ошибки, дифференциацию и критерии освоения.

## Структура файлов

### Ученик: часть 1

- `content-tools-student.tex` — содержание части 1 «Готовимся к решению».
- `main-tools-student-color.tex` — сборка цветной версии.
- `main-tools-student-bw.tex` — сборка чёрно-белой версии.
- `main-tools-student-color.pdf`, `main-tools-student-bw.pdf` — готовые PDF.

### Ученик: часть 2

- `content-solution-student.tex` — содержание части 2 «Решаем
  логарифмическое неравенство».
- `main-solution-student-color.tex` — сборка цветной версии.
- `main-solution-student-bw.tex` — сборка чёрно-белой версии.
- `main-solution-student-color.pdf`, `main-solution-student-bw.pdf` — готовые
  PDF.

### Домашняя работа

- `homework-content.tex` — задания для ученика.
- `homework-short-answers.tex` — краткий ключ для самостоятельной проверки;
  включается только в ученические версии после всех заданий.
- `homework-solutions.tex` — решения и диагностические комментарии для
  учителя.
- `homework-style.sty` — дополнительный стиль домашней работы.
- `main-homework-student-color.tex`, `main-homework-student-bw.tex` — домашняя
  работа без решений.
- `main-homework-teacher-color.tex`, `main-homework-teacher-bw.tex` — домашняя
  работа вместе с решениями.
- PDF с теми же основами имён — собранные версии, если они присутствуют.

### Методическая версия

- `content-teacher.tex` — методический сценарий и полное математическое
  решение.
- `main-teacher-color.tex`, `main-teacher-bw.tex` — точки сборки.
- `main-teacher-color.pdf`, `main-teacher-bw.pdf` — готовые PDF.

### Общие зависимости

- `figures.tex` — TikZ-схемы, цепочки замен и числовые прямые.
- `style-common.sty` — общие команды, геометрия страниц и типографика.
- `style-color.sty` — цветовая тема.
- `style-bw.sty` — чёрно-белая тема.
- `README.md` — краткое описание и команда сборки.

## Карта зависимостей

```text
main-tools-student-*       -> content-tools-student.tex
main-solution-student-*    -> content-solution-student.tex
main-teacher-*             -> content-teacher.tex
main-homework-student-*    -> homework-content.tex + homework-short-answers.tex
main-homework-teacher-*    -> homework-content.tex + homework-solutions.tex

учебные и методические main-* -> style-common.sty + style-color/style-bw
                              + figures.tex
домашние main-*              -> style-common.sty + style-color/style-bw
                              + homework-style.sty
```

## Правила изменения

- Не создавать отдельную базу содержания: источником истины остаются `.tex`.
- Не дублировать часть 2 под общим именем `main-student-*`.
- Изменения содержания ученика вносить в `content-tools-student.tex` или
  `content-solution-student.tex`, а не в `main-*.tex`.
- Общие команды менять в `style-common.sty`; цветовые различия — только в
  `style-color.sty` и `style-bw.sty`.
- После изменения пересобирать затронутые цветную и чёрно-белую версии.
- После сборки визуально проверять PDF: разрывы рамок, переполнения, дроби,
  интервалы, поля для записи и читаемость чёрно-белой версии.

## Сборка

Запускать из этой папки, например:

```bash
xelatex -interaction=nonstopmode -halt-on-error main-tools-student-color.tex
xelatex -interaction=nonstopmode -halt-on-error main-solution-student-color.tex
xelatex -interaction=nonstopmode -halt-on-error main-teacher-color.tex
xelatex -interaction=nonstopmode -halt-on-error main-homework-student-color.tex
```

Для печатной версии заменить суффикс `color` на `bw`. После изменения ссылок
или оглавления XeLaTeX следует запустить дважды.

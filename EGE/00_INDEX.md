---
id: MOC-EGE
title: "ЕГЭ — каталог материалов"
type: moc
status: active
tags: [ege, index]
---

# ЕГЭ — каталог материалов

Эта карта показывает педагогические объекты, а не просто файлы: задачу,
решение, рабочий лист, домашнюю работу, комплект и вариант.

## Навигация

- [[EGE/_catalog/README|Как читать каталог ЕГЭ]]
- [[EGE/01_TASKS|Задачи]]
- [[EGE/02_WORKSHEETS|Рабочие листы]]
- [[EGE/03_SOLUTIONS|Решения]]
- [[EGE/04_PACKS|Готовые комплекты]]
- [[EGE/05_VARIANTS|Варианты и источники]]
- [[EGE/06_INBOX|Добавить новый материал]]
- [[EGE/methodology/MAP-EGE-PLAN-TASK01-YA36-2022|Методическая карта: планиметрия, задание №1]]

## Всё готовое к использованию

```dataview
TABLE type AS "Тип", topic AS "Тема", grade AS "Класс", file.link AS "Материал"
FROM "EGE/_catalog/records"
WHERE status = "ready"
SORT topic ASC, file.name ASC
```

## В разработке

```dataview
TABLE type AS "Тип", topic AS "Тема", file.link AS "Материал"
FROM "EGE/_catalog/records"
WHERE status != "ready"
SORT status ASC, file.name ASC
```

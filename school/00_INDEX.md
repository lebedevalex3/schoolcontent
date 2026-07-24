---
id: MOC-SCHOOL
title: "Школа — каталог материалов"
type: moc
status: active
tags: [school, index]
---

# Школа — каталог материалов

## Сейчас: 5 класс

- [[school/5grade/00_INDEX|5 класс — карта модулей]]
- [[school/5grade/01_NaturalNumbers/README|Натуральные числа]]
- [[school/5grade/02_Line_Dots/README|Геометрические объекты и точки на линии]]
- [[school/00_ADD_CONTENT|Добавить школьный материал]]

## Все действующие школьные модули

```dataview
TABLE grade AS "Класс", section AS "Раздел", module_code AS "Модуль", learning_result AS "Результат", file.link AS "Материал"
FROM "school/_catalog"
WHERE type = "module" AND status = "ready"
SORT grade ASC, section_order ASC, module_order ASC
```

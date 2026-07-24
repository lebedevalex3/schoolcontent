---
id: MOC-SCHOOL-G5
title: "5 класс — карта модулей"
type: moc
grade: 5
---

# 5 класс — карта модулей

## Разделы

- [[school/5grade/01_NaturalNumbers/README|01. Натуральные числа]]
- [[school/5grade/02_Line_Dots/README|02. Геометрические объекты и точки на линии]]

## Все модули

```dataview
TABLE section AS "Раздел", module_code AS "Код", learning_result AS "Чему учимся", status AS "Статус", file.link AS "Паспорт"
FROM "school/_catalog/5grade"
WHERE type = "module"
SORT section_order ASC, module_order ASC
```

## Модули по натуральным числам

```dataview
TABLE module_code AS "Код", learning_result AS "Результат", file.link AS "Модуль"
FROM "school/_catalog/5grade"
WHERE section_id = "G5-NATURAL-NUMBERS"
SORT module_order ASC
```

## Геометрические объекты и точки на линии

```dataview
TABLE module_code AS "Код", learning_result AS "Результат", file.link AS "Модуль"
FROM "school/_catalog/5grade"
WHERE section_id = "G5-LINE-DOTS"
SORT module_order ASC
```

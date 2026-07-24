---
id: MOC-EGE-VARIANTS
title: "ЕГЭ — варианты и источники"
type: moc
---

# Варианты и источники ЕГЭ

## Варианты

```dataview
TABLE year AS "Год", variant_number AS "Вариант", status AS "Статус", file.link AS "Вариант"
FROM "EGE/_catalog/records"
WHERE type = "exam_variant"
SORT year DESC, variant_number ASC
```

## Неразобранные источники

```dataview
TABLE year AS "Год", topic AS "Тема", status AS "Статус", file.link AS "Источник"
FROM "EGE/_catalog/records"
WHERE type = "source"
SORT year DESC, file.name ASC
```

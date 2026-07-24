---
id: MOC-EGE-PACKS
title: "ЕГЭ — готовые комплекты"
type: moc
---

# Готовые комплекты ЕГЭ

```dataview
TABLE topic AS "Тема", tasks AS "Задачи", status AS "Статус", file.link AS "Комплект"
FROM "EGE/_catalog/records"
WHERE type = "pack"
SORT topic ASC, file.name ASC
```

---
id: MOC-EGE-WORKSHEETS
title: "ЕГЭ — рабочие листы"
type: moc
---

# Рабочие листы ЕГЭ

```dataview
TABLE topic AS "Тема", audience AS "Для кого", purpose AS "Назначение", task AS "Задача", file.link AS "Лист"
FROM "EGE/_catalog/records"
WHERE type = "worksheet"
SORT topic ASC, file.name ASC
```

---
id: MOC-EGE-TASKS
title: "ЕГЭ — задачи"
type: moc
---

# Задачи ЕГЭ

```dataview
TABLE topic AS "Тема", subtopics AS "Подтемы", difficulty AS "Уровень", status AS "Статус", file.link AS "Задача"
FROM "EGE/_catalog/records"
WHERE type = "task"
SORT topic ASC, file.name ASC
```

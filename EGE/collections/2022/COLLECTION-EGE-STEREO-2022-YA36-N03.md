---
id: COLLECTION-EGE-STEREO-2022-YA36-N03
title: "Ященко-2022: задание №3 по стереометрии"
type: collection
status: developing
course: ege
topic: stereometry
latex_locked: true
figure_template_locked: true
figure_role: schematic_template
allowed_content_edits: [condition_text, numerical_data, question, answer]
permitted_figure_edits: [synchronize_explicit_numerical_labels]
source:
  publisher: "Ященко"
  year: 2022
  collection: "36 вариантов"
  number: 3
available_variants: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 35, 36]
missing_variants: [34]
tags: [ege, stereometry, yashchenko-2022, collection]
---

# Ященко-2022: задание №3 по стереометрии

> [[00_meta/FIGURE_TEMPLATE_POLICY|Рисунки этой подборки — неизменяемые шаблоны]].
> Для похожих задач допускается менять только условие и синхронизированные с
> ним числовые метки. Конфигурацию, рёбра, дуги и позиции подписей не менять.

В исходной поставке есть варианты 1–33, 35 и 36. Вариант 34 будет добавлен
после получения исходника.

## Банк задач

```dataview
TABLE source.variant AS "Вариант", title AS "Задача", answer AS "Ответ", status AS "Статус"
FROM "EGE/tasks/stereometry"
WHERE source.publisher = "Ященко" AND source.year = 2022 AND source.number = 3
SORT source.variant ASC
```

## Сборка и проверка

```bash
bash EGE/collections/2022/build-stereo-2022-ya36-n03.sh
```

Готовые PDF появляются в `outputs/main.pdf` каждой карточки и не попадают в
Git. При отдельном запросе на публикацию они выгружаются на Яндекс.Диск командой
`scripts/publish-yandex-disk.sh EGE`.

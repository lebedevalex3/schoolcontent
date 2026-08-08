# Assessment Core sidecars

Файлы `task.yaml`, `rubric.yaml`, `test-cases.yaml` и `issuance.yaml`
генерируются командой:

```bash
node ../generate-assessment-sidecars.mjs
```

Готовы к выдаче два пакета по 10 основных баллов: A и B. В каждом доступны
варианты I-VI и компактный макет `standard-2x3-v1`.

Пакет B с бонусным заданием V-04 остаётся `draft`: исходная методика считает
его отдельно от 10 основных баллов, а текущий Assessment Core пока суммирует
все rubric profiles в один максимум. Делать его `ready` до поддержки
отдельного bonus score нельзя.

# Натуральные числа. 5 класс

Раздел является эталонной реализацией общего контракта школьных рабочих
листов.

## Документы

- [`../../WORKSHEET_CONTRACT.md`](../../WORKSHEET_CONTRACT.md) — общий
  школьный контракт;
- [`MODULE_CONTRACT.md`](MODULE_CONTRACT.md) — устройство модульного раздела;
- [`MODULE_MAP.md`](MODULE_MAP.md) — последовательность и результаты M01–M07;
- [`modules/METHODOLOGY.md`](modules/METHODOLOGY.md) — терминология,
  возрастные ограничения и предметная методика;
- [`CONTENT_INVENTORY.md`](CONTENT_INVENTORY.md) — происхождение содержания из
  ранних уроков.

## Исходники и результаты

- `modules/M01–M07` — эталонные комплекты;
- `modules/common/Latex` — совместимые оболочки старых путей стилей;
- `../../common/Latex` — каноническая школьная дизайн-система;
- `output/pdf` — собранные итоговые PDF.

Полная сборка:

```bash
cd modules
./build-all.sh
```


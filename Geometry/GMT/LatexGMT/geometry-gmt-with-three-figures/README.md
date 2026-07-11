# Geometry GMT

## Структура

```text
geometry-gmt-final/
├── content.tex
├── figures.tex
├── main-color.tex
├── main-bw.tex
├── style-common.sty
├── style-color.sty
└── style-bw.sty
```

## Сборка

Цветная версия:

```bash
xelatex main-color.tex
```

Чёрно-белая версия:

```bash
xelatex main-bw.tex
```

Рисунки отдельно собирать не требуется. Оба рисунка хранятся в `figures.tex`.


## Рисунки

В `figures.tex` определены три команды:

```latex
\gmtcirclefigure
\gmtdistancecomparisonfigure
\gmtextraandmissingpointsfigure
```

Один и тот же TikZ-код автоматически получает цветное или чёрно-белое оформление.

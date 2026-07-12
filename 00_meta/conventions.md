# Структура schoolcontent — предложение v2

Дата: 2026-07-12. Это рабочий черновик. После согласования переименуется в `conventions.md`.

## Изменения по сравнению с v1

- **Концепты** лежат внутри `Geometry/concepts/`, **не** в общем `01_concepts/` (твой выбор).
- **`GMT.md` — концепт**, а не урок. LaTeX-комплект остаётся рядом с ним в папке.
- **EGE — отдельный корень** верхнего уровня, а не подпапка `03_tasks/ege/`.
- **schoolcontent — сам по себе**, не часть `math-teacher-lab`. Схема ID не стыкуется с `math-teacher-lab` (если позже понадобится — отдельный разговор).
- По `WS-` (отдельная сущность «лист»): не вводим по умолчанию, лист = подмножество задачи. Если передумаешь — переключимся точечно.

---

## 0. Что сейчас в репозитории

Три «острова» контента:

- `EGE/Planimetry/Task1/` — задача про трапецию + LaTeX-комплект + архивный zip
- `EGE/Parametr/Parametr1/` — параметрическая задача + LaTeX
- `Geometry/GMT/` — конспект про ГМТ + LaTeX

**Что хорошо:** в каждой «рабочей» папке рядом с заметкой лежит `latex/` с кодом — паттерн, который хочется сохранить. Между `.md` и `tex` уже есть мостик через `id` в frontmatter.

**Что плохо / несогласованно:**

1. **Имена файлов хаотичны:** `Task 1.md`, `Без названия.md`, `Без названия 1.md`, `Parametr.md`, `GMT.md`. Никакой системы.
2. **Дубликаты:** про трапецию — три `.md`-файла, из них два про одну и ту же задачу в разной степени готовности.
3. **Frontmatter расходится:** Planimetry использует `id`, Parametr — `note_id`. Разные схемы.
4. **`GMT.md` без frontmatter вообще.**
5. **Концепты только упоминаются** (`[[Серединный перпендикуляр]]`), но самих файлов нет.
6. **Имена папок с LaTeX неединообразны:** `Latex`, `LatexGMT`, `trapezoid_circumcenter_pack`.
7. **`trapezoid_circumcenter_pack.zip`** лежит в репо и `.gitignore` его не покрывает.
8. **`LatexGMT/geometry-gmt-with-three-figures/`** — тяжёлые сборочные артефакты (PDF/aux/log/xdv) внутри репы, не смотря на `.gitignore` верхнего уровня (git мог их уже закоммитить до игнора).

---

## 1. Принципы

1. **Одна заметка = один логический объект.** Не два-три дубля одной и той же задачи.
2. **Папка = единица работы** (задача, урок, концепт с иллюстрациями). Внутри — заметка + `latex/` + README.
3. **ID стабильнее названия.** Название может меняться, ID — нет.
4. **Концепты отдельно от задач.** Иначе одни и те же теоремы дублируются в десяти местах.
5. **Frontmatter — единая схема** для всех типов + типоспецифичные поля.
6. **Теги — управляемый словарь**, не свободный ввод.
7. **Корни по контексту, не по типу контента.** `EGE/`, `Geometry/`, `Algebra/` — это разные **учебные контексты** со своей спецификой (экзамен / кружок / курс). Тип (`task` / `concept` / `lesson`) живёт внутри корня как подпапка.

---

## 2. Структура папок

```
schoolcontent/
├── 00_meta/                              # служебное: конвенции, словари, шаблоны
│   ├── conventions.md                    # эта инструкция (после согласования)
│   ├── tags.md                           # словарь тегов
│   └── templates/                        # шаблоны Obsidian
│       ├── task.md
│       ├── worksheet.md
│       ├── homework.md
│       ├── concept.md
│       ├── pack.md
│       ├── lesson.md
│       └── diag.md
│
├── EGE/                                  # ЕГЭ — отдельный корень
│   ├── README.md                         # навигация по ЕГЭ
│   ├── planimetry/                       # подраздел экзамена
│   │   ├── TASK-PLAN-TRAP-CIRC-001/
│   │   │   ├── TASK-PLAN-TRAP-CIRC-001.md
│   │   │   ├── latex/
│   │   │   │   ├── main-student-color.tex
│   │   │   │   ├── main-student-bw.tex
│   │   │   │   ├── main-teacher-color.tex
│   │   │   │   ├── main-teacher-bw.tex
│   │   │   │   ├── main-homework-color.tex
│   │   │   │   ├── main-homework-bw.tex
│   │   │   │   ├── content-student.tex
│   │   │   │   ├── content-teacher.tex
│   │   │   │   ├── content-homework.tex
│   │   │   │   ├── figures.tex
│   │   │   │   ├── style-common.sty
│   │   │   │   ├── style-color.sty
│   │   │   │   └── style-bw.sty
│   │   │   └── README.md                 # какие команды что собирают
│   │   ├── TASK-PLAN-INSCRIBED-ANGLE-002/
│   │   └── ...
│   ├── stereometry/
│   ├── parametr/
│   │   ├── PARAM-RAT-MOD-017/
│   │   │   ├── PARAM-RAT-MOD-017.md
│   │   │   ├── latex/
│   │   │   │   ├── main-student-color.tex
│   │   │   │   ├── main-student-bw.tex
│   │   │   │   ├── main-teacher-color.tex
│   │   │   │   ├── main-teacher-bw.tex
│   │   │   │   ├── main-color.tex        # сводный (если есть)
│   │   │   │   ├── main-bw.tex
│   │   │   │   ├── content.tex
│   │   │   │   ├── figures.tex
│   │   │   │   ├── homework-content.tex
│   │   │   │   ├── homework-solutions.tex
│   │   │   │   ├── homework-style.sty
│   │   │   │   ├── style-common.sty
│   │   │   │   ├── style-color.sty
│   │   │   │   └── style-bw.sty
│   │   │   └── README.md
│   │   └── ...
│   ├── equation/
│   └── ...
│
├── Geometry/                             # школьная геометрия (кружок, не ЕГЭ)
│   ├── README.md
│   ├── concepts/                         # ← ТЕОРИЯ лежит здесь, а не в общем 01_concepts/
│   │   ├── CON-GEO-LOCUS-INTRO/          # концепты с тяжёлым LaTeX — папкой
│   │   │   ├── CON-GEO-LOCUS-INTRO.md
│   │   │   ├── latex/
│   │   │   │   ├── main-bw.tex
│   │   │   │   ├── main-color.tex
│   │   │   │   ├── content.tex
│   │   │   │   ├── figures.tex
│   │   │   │   ├── style-bw.sty
│   │   │   │   ├── style-color.sty
│   │   │   │   └── style-common.sty
│   │   │   └── README.md
│   │   ├── CON-GEO-MIDLINE-TRIANGLE.md   # концепты без LaTeX — одиночный .md
│   │   ├── CON-GEO-PERP-BISECTOR.md
│   │   ├── CON-GEO-CIRCUMCENTER.md
│   │   ├── CON-GEO-INSCRIBED-ANGLE.md
│   │   └── ...
│   ├── lessons/                          # сценарии уроков
│   │   └── LESSON-GEO-GMT-001/           # (если/когда появится)
│   │       ├── LESSON-GEO-GMT-001.md
│   │       ├── latex/
│   │       └── README.md
│   └── tasks/                            # задачи кружка
│       └── ...
│
├── Algebra/                              # (если/когда появится)
│   ├── concepts/
│   ├── lessons/
│   └── tasks/
│
├── packs/                                # комплекты — общие, не привязаны к корню
│   ├── PACK-PLAN-TRAP-CIRC-001.md        # сводка по задаче + листы + домашка
│   └── ...
│
├── diagnostics/                          # контрольные/диагностические — общие
│   ├── DIAG-PLAN-MIX-001.md
│   └── ...
│
├── archive/                              # неактуальное, zip-архивы
│   └── trapezoid_circumcenter_pack.zip
│
├── .obsidian/
├── .gitignore
└── README.md                             # верхнеуровневая навигация
```

**Ключевая идея:** `EGE/planimetry/TASK-PLAN-TRAP-CIRC-001/` — это **рабочая папка одной задачи**. Внутри:

- `TASK-PLAN-TRAP-CIRC-001.md` — сама задача (заметка Obsidian).
- `latex/` — весь LaTeX-код для печатных листов.
- `README.md` — инструкция: какие команды собирают какие PDF.

**Почему концепты — внутри `Geometry/concepts/`, а не общий `01_concepts/`?**
- Концепты геометрии — теория для геометрии, и держим их рядом с местом использования.
- Когда появится `Algebra/concepts/` — не будет путаницы «эта теорема геометрическая или алгебраическая?».
- Если в будущем концепт понадобится и геометрии, и алгебре (бывает редко), сделаем перекрёстную ссылку `[[...]]`, а не дубль.

**Почему EGE — отдельный корень?**
- Экзамен — другая сущность: варианты, прототипы, тайминг, «задача 17 из демоверсии». Своя логика нумерации (по номерам заданий КИМа), свой пак листов.
- Школьная геометрия — это кружок: темы по программе, концепты, разборы. Совсем другая жизнь.

---

## 3. Именование файлов и папок

### Формат идентификатора

`TYPE-DOMAIN-TOPIC-NNNN` — стабильный, читаемый, латиницей, без пробелов.

| TYPE     | Значение                                    |
| -------- | ------------------------------------------- |
| `TASK`   | отдельная задача                            |
| `PARAM`  | задача с параметром (подтип TASK)            |
| `WS`     | учебный лист (worksheet)                    |
| `HW`     | домашняя работа                             |
| `PACK`   | комплект (набор задач + листов + домашки)   |
| `CON`    | концепт (теорема, определение, факт)        |
| `LESSON` | сценарий урока                              |
| `DIAG`   | диагностическая / контрольная работа        |
| `MOC`    | навигационная заметка (Map of Content)      |

`PARAM` — потому что задачи с параметром в ЕГЭ — это всегда «задание 17» или «задание 18», у них своя жизнь, свой тайминг, своя разметка. Хочется видеть это в имени файла. Если потом решишь, что это просто `TASK-PARAM-...` — переименуем.

**Примеры:**

- `TASK-PLAN-TRAP-CIRC-001` — задача по планиметрии ЕГЭ, тема «трапеция и описанная окружность», №001
- `PARAM-RAT-MOD-017` — задача с параметром, рациональное уравнение с модулем, №17 из КИМа
- `CON-GEO-LOCUS-INTRO` — концепт «введение в ГМТ»
- `CON-GEO-MIDLINE-TRIANGLE` — концепт «средняя линия треугольника»
- `LESSON-GEO-GMT-001` — сценарий урока по ГМТ, №001

### Имя файла = ID + `.md

```
TASK-PLAN-TRAP-CIRC-001.md
```

Никаких «Без названия», «Task 1», «Parametr», «GMT» — это всё уходит.

**Плюсы:**

- Сортируется естественно (TASK-001, TASK-002, ...).
- Один взгляд на имя = полная идентификация.
- Не ломается при переименовании темы.

**Минус:** некрасиво для глаза вне Obsidian. **Решение:** aliases в frontmatter.

```yaml
---
id: TASK-PLAN-TRAP-CIRC-001
title: "Трапеция — скрытый треугольник и описанная окружность"
aliases:
  - "Задача 1 (Планиметрия)"
  - "Трапеция и окружность"
---
```

В Quick Switcher ищешь по-человечески — находишь по ID.

### Имя папки = ID

```
EGE/planimetry/TASK-PLAN-TRAP-CIRC-001/
Geometry/concepts/CON-GEO-LOCUS-INTRO/
```

Не `Task1/`, не `trap_circ/` — только `TASK-PLAN-TRAP-CIRC-001/`. По той же причине.

### Концепты: папка или одиночный файл?

- **Одиночный `.md`:** если концепт чисто текстовый (формулировка + доказательство + пара ссылок). Например, `CON-GEO-MIDLINE-TRIANGLE.md`.
- **Папка:** если рядом лежит LaTeX-комплект с иллюстрациями. Например, `CON-GEO-LOCUS-INTRO/CON-GEO-LOCUS-INTRO.md` + `latex/` + `README.md`.

**Правило переезда:** если у концепта появляется LaTeX-папка — переезжает в собственную папку. Если удаляется вся LaTeX-часть — обратно в одиночный файл. Это редкая операция, можно делать руками.

---

## 4. Frontmatter — единая схема

### Обязательные поля (для всех заметок)

```yaml
---
id: TASK-PLAN-TRAP-CIRC-001           # уникальный ID
title: "Трапеция — скрытый треугольник и описанная окружность"
type: task                             # task | worksheet | homework | pack | concept | lesson | diag | moc
status: developed                      # draft | developing | developed | ready | archived
created: 2026-07-12
updated: 2026-07-12
tags: [ege, planimetry, trapezoid]
---
```

**Пояснения:**

- `type` — фиксированный словарь. Используется для фильтров и валидации.
- `status` — фиксированный словарь стадий. `ready` = «можно идти в класс», `archived` = «снято с использования».
- `created` / `updated` — даты ISO. Obsidian показывает, но не управляет ими.
- `tags` — **управляемый словарь** (см. раздел 5).

### Типоспецифичные поля

**`type: task` (включая `PARAM`):**

```yaml
course: geometry                      # geometry | algebra | analysis | ...
grade: 8                              # класс (или список: [10, 11])
difficulty: advanced                  # basic | medium | advanced | olympiad
lesson_role: synthesis                # intro | practice | synthesis | control
source:                               # источник (если внешний)
  - ege-2025-variant-12
  - авторская
topics:                               # крупные темы
  - trapezoid
  - circumcenter
  - inscribed_angle
prerequisites:                        # какие концепты нужны
  - "[[CON-GEO-MIDLINE-TRIANGLE]]"
  - "[[CON-GEO-PERP-BISECTOR]]"
  - "[[CON-GEO-CIRCUMCENTER]]"
methods:                              # какие методы/приёмы
  - auxiliary_construction
  - midline_recognition
  - inscribed_central_angles
artifacts:                            # ссылки на PDF в latex/
  student_color: main-student-color.pdf
  student_bw: main-student-bw.pdf
  teacher_color: main-teacher-color.pdf
  teacher_bw: main-teacher-bw.pdf
  homework_color: main-homework-color.pdf
  homework_bw: main-homework-bw.pdf
```

Для `PARAM` — то же самое, добавляется только `param_number: 17` (номер задания в КИМе).

**`type: concept`:**

```yaml
domain: geometry                      # область
subdomain: planimetry                 # подраздел (опц.)
related_concepts:                     # смежные концепты
  - "[[CON-GEO-CIRCUMCENTER]]"
  - "[[CON-GEO-INSCRIBED-ANGLE]]"
used_in_tasks:                        # в каких задачах применяется
  - "[[TASK-PLAN-TRAP-CIRC-001]]"
theorem_statement: |                  # краткая формулировка
  Средняя линия треугольника параллельна
  третьей стороне и равна её половине.
artifacts:                            # если есть LaTeX
  color: main-color.pdf
  bw: main-bw.pdf
```

**`type: pack`:**

```yaml
tasks:                                # какие задачи входят
  - "[[TASK-PLAN-TRAP-CIRC-001]]"
worksheets:
  - "[[WS-PLAN-TRAP-CIRC-001-student]]"
  - "[[WS-PLAN-TRAP-CIRC-001-teacher]]"
homework: "[[HW-PLAN-TRAP-CIRC-001]]"
target_audience: "геометрический кружок 8 класс"
```

**`type: lesson`:**

```yaml
date: 2026-09-15
class: 8
duration_min: 45
concepts:                             # какие концепты вводим/повторяем
  - "[[CON-GEO-LOCUS-INTRO]]"
  - "[[CON-GEO-CIRCLE-LOCUS]]"
tasks:                                # какие задачи разбираем
  - "[[TASK-GEO-LOCUS-001]]"
homework: "[[HW-GEO-LOCUS-001]]"
```

**`type: worksheet` и `type: homework`:** наследуют поля `task` + добавляют `print_orientation: portrait | landscape`, `page_count: N`, `includes_solution: false`.

**Важное замечание про `WS-` сущности:** сейчас в frontmatter Planimetry/Parametr артефакты (`main-student-color.tex`) лежат прямо в `latex/` и `artifacts` ссылается на PDF-файлы. **Мы не вводим отдельные `WS-*.md` заметки** — ученический лист живёт как подмножество задачи. Если позже захочешь, чтобы один и тот же лист можно было «приклеить» к разным задачам — введём `WS-` сущности точечно, переезд механический.

### Унификация с тем, что уже есть

| Поле в существующих заметках | Что с ним делать |
|------------------------------|------------------|
| `id` (Planimetry)            | оставляем — это `id` |
| `note_id` (Parametr)         | переименовываем в `id` |
| `course` / `subject`         | оставляем `course` |
| `lesson_role`                | оставляем, переносим в новую схему |
| `source_number` (Parametr, =17) | заменяем на `source: "ege-17"` + `param_number: 17` |
| `subtopics` (Parametr)       | заменяем на `topics` (концепты) + `tags` (классификация) |
| `prerequisites.knowledge/skills` (Parametr) | разносим: `prerequisites` для концептов, навыки — в тело заметки |
| `aliases` (Parametr)         | оставляем как есть |
| `artifacts` (Planimetry)     | оставляем, но в `artifacts` — только имена PDF (без путей) |

---

## 5. Теги — словарь

Теги — **плоский управляемый словарь**, не иерархия. Управляемый = «новый тег сначала вписывается в `00_meta/tags.md`, потом используется».

| Ось            | Примеры тегов |
| -------------- | ------------- |
| Экзамен / курс | `#ege`, `#oge`, `#school-circle`, `#olympiad` |
| Предмет        | `#math`, `#geometry`, `#algebra`, `#analysis` |
| Подраздел      | `#planimetry`, `#stereometry`, `#parametr`, `#equation` |
| Тема           | `#trapezoid`, `#midline`, `#circumcenter`, `#modulus`, `#locus` |
| Сложность      | `#basic`, `#medium`, `#advanced`, `#olympiad-level` |
| Роль в уроке   | `#intro`, `#practice`, `#synthesis`, `#diagnostic` |

**Важно:**

- `type` и `status` в frontmatter — это **не теги**. Они структурные. Не дублируй их.
- `tags` — для поиска, фильтров, графов. Тут можно и нужно дублировать: например, `planimetry` + `geometry` — оба тега.
- Теги плоские, не вложенные (`#math/geometry/planimetry` не используем). С плоскими проще фильтровать в tag-pane.

---

## 6. README в каждой рабочей папке

Внутри `TASK-PLAN-TRAP-CIRC-001/` лежит `README.md` — короткий, 5-15 строк:

```markdown
# TASK-PLAN-TRAP-CIRC-001

Задача: «Трапеция — скрытый треугольник и описанная окружность».

## Сборка

Из папки `latex/`:

    xelatex -interaction=nonstopmode main-student-color.tex
    xelatex -interaction=nonstopmode main-teacher-color.tex
    xelatex -interaction=nonstopmode main-homework-color.tex

Для чёрно-белых — заменить `color` на `bw`.

## Артефакты

- `main-student-color.pdf` — ученический лист
- `main-teacher-color.pdf` — лист с решениями для учителя
- `main-homework-color.pdf` — домашняя работа

## Связи

- Концепты: [[CON-GEO-MIDLINE-TRIANGLE]], [[CON-GEO-PERP-BISECTOR]]
- Комплект: [[PACK-PLAN-TRAP-CIRC-001]]
```

**Зачем:** когда откроешь эту папку через год — не придётся вспоминать, какой `.tex` что собирает. `latex/README.md` (он уже есть в Planimetry) — про устройство LaTeX-проекта. Папковый `README.md` — про эту конкретную задачу.

Для концептов README короче:

```markdown
# CON-GEO-LOCUS-INTRO

Концепт: «Геометрическое место точек — введение».

## Сборка

    xelatex -interaction=nonstopmode main-color.tex
    xelatex -interaction=nonstopmode main-bw.tex

## Связи

- Используется в: [[TASK-PLAN-TRAP-CIRC-001]] (если применимо)
- Смежные: [[CON-GEO-CIRCUMCENTER]]
```

---

## 7. Шаблоны Obsidian

Подключи папку `00_meta/templates/` как Template folder (Settings → Templates → Template folder location). Тогда в Obsidian через `Cmd+Shift+T` вставляется заготовка под нужный тип:

- `task.md` — шаблон задачи со всеми типоспецифичными полями
- `concept.md` — шаблон концепта
- `pack.md` — шаблон комплекта
- `lesson.md` — шаблон сценария урока
- `worksheet.md` — шаблон листа
- `homework.md` — шаблон домашней работы
- `diag.md` — шаблон диагностической

В шаблонах поле `id` остаётся пустым с пометкой `TYPE-DOMAIN-TOPIC-NNNN` — заполняешь при создании. `created` Obsidian умеет вставлять через `{{date}}`.

---

## 8. Миграция с текущего состояния

Конкретные шаги, чтобы привести репо к новому виду. Действия атомарны: каждая строка = одна операция переноса + переименования + правки frontmatter.

| Было | Стало | Действие |
|------|-------|----------|
| `EGE/Planimetry/Task1/Task 1.md` | — | Удалить. Это «облегчённая» версия; полная (`Без названия.md`) становится каноном. |
| `EGE/Planimetry/Task1/Без названия.md` | `EGE/planimetry/TASK-PLAN-TRAP-CIRC-001/TASK-PLAN-TRAP-CIRC-001.md` | Перенести, переименовать, обновить frontmatter: `type: task`, добавить `created` / `updated` / `tags`. |
| `EGE/Planimetry/Task1/Без названия 1.md` | `packs/PACK-PLAN-TRAP-CIRC-001.md` | Перенести, переименовать, добавить `type: pack`, `tasks`, `worksheets`, `homework`, `target_audience`. |
| `EGE/Planimetry/Task1/trapezoid_circumcenter_pack/` | `EGE/planimetry/TASK-PLAN-TRAP-CIRC-001/latex/` | Перенести, переименовать папку. |
| `EGE/Planimetry/Task1/trapezoid_circumcenter_pack.zip` | `archive/` | Перенести, добавить `*.zip` в `.gitignore`. |
| `EGE/Parametr/Parametr1/Parametr.md` | `EGE/parametr/PARAM-RAT-MOD-017/PARAM-RAT-MOD-017.md` | Перенести, переименовать, унифицировать frontmatter: `note_id` → `id`, добавить `type: task`, разнести `subtopics` на `topics` + `tags`, `source_number: 17` → `param_number: 17`. |
| `EGE/Parametr/Parametr1/Latex/` | `EGE/parametr/PARAM-RAT-MOD-017/latex/` | Перенести. |
| `Geometry/GMT/GMT.md` | `Geometry/concepts/CON-GEO-LOCUS-INTRO/CON-GEO-LOCUS-INTRO.md` | Перенести, переименовать, добавить frontmatter: `type: concept`, `domain: geometry`, `subdomain: planimetry`, `theorem_statement`, `artifacts`. |
| `Geometry/GMT/LatexGMT/geometry-gmt-with-three-figures/` | `Geometry/concepts/CON-GEO-LOCUS-INTRO/latex/` | Перенести, переименовать в `latex/`. |
| `Geometry/GMT/LatexGMT/geometry-gmt-with-three-figures/main-bw.{pdf,aux,log,out,xdv,fls,fdb_latexmk}` | — | Мусор сборки, удалить (`.gitignore` их уже покрывает, но они могли закоммититься до того, как правила были выставлены). |
| `Geometry/GMT/LatexGMT/.DS_Store` | — | macOS-мусор, удалить. |
| `.gitignore` | `.gitignore` | Добавить: `*.zip`, `.DS_Store`. |

После миграции удалить пустые директории: `EGE/Planimetry/Task1/`, `EGE/Parametr/Parametr1/`, `Geometry/GMT/`, `Geometry/GMT/LatexGMT/`, `EGE/Planimetry/`, `EGE/Parametr/`, `Geometry/`, `EGE/` — насколько они окажутся пустыми.

---

## 9. Принятые решения (фиксирую)

1. **Концепты внутри `Geometry/concepts/`** (рядом с местом использования). Когда появятся другие предметы — `Algebra/concepts/`, `Analysis/concepts/` по тому же шаблону.
2. **`GMT.md` — концепт.** ID: `CON-GEO-LOCUS-INTRO` (locus = ГМТ по-английски). Если позже разобьётся на подконцепты (locus-circle, locus-bisector) — добавим `CON-GEO-LOCUS-CIRCLE` и т.п. без перетряхивания структуры.
3. **EGE — отдельный корень** верхнего уровня.
4. **schoolcontent — сам по себе.** Схема ID не стыкуется с `math-teacher-lab` (валидаторы/индексы оттуда не применяются). Если в будущем понадобится — отдельный разговор, как именно.
5. **`WS-` сущности — не вводим** (по умолчанию). Лист = подмножество задачи, живёт в её папке. Переключение на отдельные `WS-` — точечная миграция, не ломает остальное.

---

## 10. Что делать дальше

После твоего ОК на эту версию:

1. **Переименовать этот файл** в `00_meta/conventions.md` (он становится постоянной инструкцией).
2. **Создать `00_meta/tags.md`** (словарь тегов) и `00_meta/templates/` (шаблоны Obsidian).
3. **По твоей команде — выполнить миграцию** по таблице в разделе 8. Перед удалением дублей покажу diff и попрошу подтверждение.
4. **Добавить верхнеуровневый `README.md`** с навигацией по корням.
5. **Добавить `EGE/README.md` и `Geometry/README.md`** с навигацией по подразделам.

Скажи ОК (или что подкрутить) — и стартую.

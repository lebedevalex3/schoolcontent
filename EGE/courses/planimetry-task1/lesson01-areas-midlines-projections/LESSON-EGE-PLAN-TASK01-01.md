---
id: LESSON-EGE-PLAN-TASK01-01
title: "Урок 1. Площади, средние линии и проекции"
type: lesson_sheet
status: review
course: "[[EGE/courses/planimetry-task1/COURSE-EGE-PLAN-TASK01]]"
course_level: ege
grade: [10, 11]
topic: planimetry
duration_minutes: 60
lesson_goals: [area, midline, projections, task1]
source_tasks:
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V19-N01/TASK-EGE-PLAN-2022-YA36-V19-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V20-N01/TASK-EGE-PLAN-2022-YA36-V20-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V23-N01/TASK-EGE-PLAN-2022-YA36-V23-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V27-N01/TASK-EGE-PLAN-2022-YA36-V27-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V29-N01/TASK-EGE-PLAN-2022-YA36-V29-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V30-N01/TASK-EGE-PLAN-2022-YA36-V30-N01]]"
latex_locked: false
figure_template_locked: true
permitted_figure_edits: [synchronize_explicit_numerical_labels]
student_source: "latex/main-student.tex"
teacher_source: "latex/main-teacher.tex"
presentation: "[[EGE/presentations/planimetry-task1/lesson01-areas-midlines-projections/README]]"
tags: [ege, planimetry, lesson, areas, midline]
---

# Урок 1. Площади, средние линии и проекции

Ученический лист: `latex/main-student.tex`; учительская версия с ответами и
краткими опорами: `latex/main-teacher.tex`.

Презентация для занятия: [[EGE/presentations/planimetry-task1/lesson01-areas-midlines-projections/README|Beamer-презентация]].

## Маршрут урока

1. Быстрый вход: прямоугольный треугольник и две записи одной площади.
2. Открытие: средняя линия треугольника и параллелограмм середин.
3. Трапеция: диагональ на средней линии и проекция в равнобедренной трапеции.
4. ЕГЭ-тренажёр: шесть аналогов без указания правила.
5. Домашняя работа: шесть новых числовых вариантов.

## Какие источники используются

Лист построен по типам задач 19, 20, 23, 27, 29 и 30 из банка. Внутри листа
числа изменены; рисунки являются схемами-конфигурациями. Для будущих аналогов
число на рисунке меняется только вместе с тем же числом в условии.

## Проверка PDF

```bash
cd EGE/courses/planimetry-task1/lesson01-areas-midlines-projections/latex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-student.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-teacher.tex
```

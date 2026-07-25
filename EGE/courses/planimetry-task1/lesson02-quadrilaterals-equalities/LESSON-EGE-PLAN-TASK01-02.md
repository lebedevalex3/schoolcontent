---
id: LESSON-EGE-PLAN-TASK01-02
title: "Урок 2. Четырёхугольники как система равенств"
type: lesson_sheet
status: review
course: "[[EGE/courses/planimetry-task1/COURSE-EGE-PLAN-TASK01]]"
course_level: ege
grade: [10, 11]
topic: planimetry
duration_minutes: 60
lesson_goals: [tangential_quadrilateral, parallelogram, rhombus, trapezoid, task1]
source_tasks:
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V05-N01/TASK-EGE-PLAN-2022-YA36-V05-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V06-N01/TASK-EGE-PLAN-2022-YA36-V06-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V09-N01/TASK-EGE-PLAN-2022-YA36-V09-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V10-N01/TASK-EGE-PLAN-2022-YA36-V10-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V13-N01/TASK-EGE-PLAN-2022-YA36-V13-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V21-N01/TASK-EGE-PLAN-2022-YA36-V21-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V22-N01/TASK-EGE-PLAN-2022-YA36-V22-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V28-N01/TASK-EGE-PLAN-2022-YA36-V28-N01]]"
latex_locked: false
figure_template_locked: true
permitted_figure_edits: [synchronize_explicit_numerical_labels]
student_source: "latex/main-student.tex"
teacher_source: "latex/main-teacher.tex"
presentation: "[[EGE/presentations/planimetry-task1/lesson02-quadrilaterals-equalities/README]]"
tags: [ege, planimetry, lesson, quadrilaterals]
---

# Урок 2. Четырёхугольники как система равенств

Ученический лист: `latex/main-student.tex`; учительская версия с ответами и
краткими опорами: `latex/main-teacher.tex`.

Презентация для занятия: [[EGE/presentations/planimetry-task1/lesson02-quadrilaterals-equalities/README|Beamer-презентация]].

## Маршрут урока

1. Касательный четырёхугольник: суммы противоположных сторон.
2. Параллелограмм: что даёт биссектриса и почему большая сторона может быть
   суммой двух отрезков.
3. Ромб с вписанной окружностью: одна формула через площадь.
4. Трапеция: периметр через отсечённый треугольник и радиус в прямоугольной
   касательной трапеции.
5. ЕГЭ-тренажёр и домашняя работа: числовые аналоги со схемами.

## Какие источники используются

Лист построен по типам задач 5, 6, 9, 10, 13, 21, 22 и 28 из банка. Числа в
упражнениях новые. Схемы урока являются фиксированными конфигурациями; измерять
их не нужно.

## Проверка PDF

```bash
cd EGE/courses/planimetry-task1/lesson02-quadrilaterals-equalities/latex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-student.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-teacher.tex
```

---
id: LESSON-EGE-PLAN-TASK01-03
title: "Урок 3. Треугольник и дополнительная линия"
type: lesson_sheet
status: review
course: "[[EGE/courses/planimetry-task1/COURSE-EGE-PLAN-TASK01]]"
course_level: ege
grade: [10, 11]
topic: planimetry
duration_minutes: 60
lesson_goals: [triangle, altitude, median, angle_bisector, incenter, circumcircle, task1]
source_tasks:
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V01-N01/TASK-EGE-PLAN-2022-YA36-V01-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V02-N01/TASK-EGE-PLAN-2022-YA36-V02-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V07-N01/TASK-EGE-PLAN-2022-YA36-V07-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V08-N01/TASK-EGE-PLAN-2022-YA36-V08-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V11-N01/TASK-EGE-PLAN-2022-YA36-V11-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V12-N01/TASK-EGE-PLAN-2022-YA36-V12-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V18-N01/TASK-EGE-PLAN-2022-YA36-V18-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V25-N01/TASK-EGE-PLAN-2022-YA36-V25-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V26-N01/TASK-EGE-PLAN-2022-YA36-V26-N01]]"
  - "[[EGE/tasks/planimetry/TASK-EGE-PLAN-2022-YA36-V32-N01/TASK-EGE-PLAN-2022-YA36-V32-N01]]"
latex_locked: false
figure_template_locked: true
permitted_figure_edits: [synchronize_explicit_numerical_labels]
student_source: "latex/main-student.tex"
teacher_source: "latex/main-teacher.tex"
tags: [ege, planimetry, lesson, triangle, additional-lines]
---

# Урок 3. Треугольник и дополнительная линия

Ученический лист: `latex/main-student.tex`; учительская версия с ответами и
краткими опорами: `latex/main-teacher.tex`.

## Маршрут урока

1. Равнобедренный треугольник: высота создаёт прямоугольный треугольник.
2. Из вершины прямого угла: различить высоту, медиану и биссектрису.
3. Две биссектрисы и две высоты: угол находится без длин сторон.
4. Описанная окружность: сторона через радиус и синус угла.
5. ЕГЭ-тренажёр и домашняя работа: числовые аналоги с теми же схемами.

## Правило рисунков

Схемы в `latex/figures.tex` повторяют конфигурации исходных задач. Нельзя
менять вершины, линии, дужки, отметки или положение подписей. Аргументы
макросов меняют только числа, уже напечатанные на соответствующих схемах.

## Проверка PDF

```bash
cd EGE/courses/planimetry-task1/lesson03-triangles-additional-lines/latex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-student.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-teacher.tex
```

# Сборка уроков и презентаций

## Что установить

На компьютере должен быть установлен дистрибутив LaTeX с командами
`pdflatex` и `xelatex`. На macOS удобнее всего установить MacTeX.
На Windows подойдут MiKTeX или TeX Live; после установки команды должны быть
добавлены в `PATH`.

Проверка:

```bash
pdflatex --version
xelatex --version
```

## Собрать всё одной командой

Из корня репозитория:

```bash
bash EGE/build-planimetry-lessons.sh
```

Скрипт собирает для уроков 1 и 2:

- ученический рабочий лист;
- учительский рабочий лист;
- Beamer-презентацию.

Готовые PDF появляются в папках `outputs` рядом с соответствующими уроками и
презентациями. Эти папки являются результатом сборки и не попадают в Git.

## Windows

Обычный `cmd.exe` сам по себе не умеет запускать `.sh`. Установите Git for
Windows и откройте **Git Bash** в папке репозитория: в Проводнике нажмите
правой кнопкой по папке проекта и выберите `Open Git Bash here`. Затем выполните:

```bash
bash EGE/build-planimetry-lessons.sh
```

Если репозиторий открыт в обычном CMD, но Git Bash добавлен в `PATH`, можно
выполнить и там:

```bat
bash EGE/build-planimetry-lessons.sh
```

Альтернативный вариант — установить WSL, открыть Ubuntu и запускать скрипт из
каталога репозитория, например `/mnt/c/Users/<имя>/Projects/schoolcontent`.

## Собрать один рабочий лист вручную

Например, первый урок:

```bash
cd EGE/courses/planimetry-task1/lesson01-areas-midlines-projections/latex
mkdir -p ../outputs
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-student.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main-teacher.tex
```

Для второго урока замените `lesson01-areas-midlines-projections` на
`lesson02-quadrilaterals-equalities`.

## Собрать одну Beamer-презентацию вручную

Например, презентацию первого урока:

```bash
cd EGE/presentations/planimetry-task1/lesson01-areas-midlines-projections/latex
mkdir -p ../outputs
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main.tex
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../outputs main.tex
```

Для презентации второго урока замените каталог урока на
`lesson02-quadrilaterals-equalities`.

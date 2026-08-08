import fs from 'node:fs';
import path from 'node:path';

const sourceDir = path.dirname(new URL(import.meta.url).pathname);
const outputDir = process.argv[2];

if (!outputDir) {
  throw new Error('Usage: node generate-latex.mjs <output-directory>');
}

const texPreamble = String.raw`\documentclass[10pt,a4paper]{extarticle}

\usepackage{fontspec}
\usepackage{polyglossia}
\setdefaultlanguage{russian}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\newfontfamily\cyrillicfont{Times New Roman}
\newfontfamily\cyrillicfontsf{Arial}
\usepackage[a4paper,left=13mm,right=13mm,top=9mm,bottom=9mm]{geometry}
\usepackage{enumitem}
\usepackage{microtype}
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setlist[enumerate]{leftmargin=5.5mm,labelsep=1.5mm,itemsep=0.2em,topsep=0.32em,parsep=0pt}

\newcommand{\variantheader}[2]{%
  {\normalsize\bfseries\sffamily Самостоятельная работа #1\hfill Вариант #2}\par
  \vspace{0.32em}\hrule\vspace{0.38em}%
}
\newcommand{\cutline}{\par\vfill\noindent\makebox[\textwidth]{\dotfill}\vfill\par}
\begin{document}
`;

const texEnd = '\\end{document}\n';

function taskNumber(number) {
  return number === '★' ? '\\(\\star\\)' : String(number);
}

function taskList(work, variant) {
  return work.tasks.map((task) => {
    const prompt = task.instances[variant.instance_id].prompt_latex;
    return `\\item[\\textbf{${taskNumber(task.number)}.}] ${prompt}`;
  }).join('\n');
}

function variantBlock(work, variant) {
  const level = work.work_id.endsWith('-A') ? 'A' : 'B';
  return String.raw`\begin{minipage}[t][0.22\textheight][t]{\textwidth}
\variantheader{${level}}{${variant.id}}
\begin{enumerate}
${taskList(work, variant)}
\end{enumerate}
\end{minipage}`;
}

function documentFor(work) {
  const blocks = [];
  const variants = work.variant_policy.variants;
  for (let index = 0; index < variants.length; index += 1) {
    for (let copy = 0; copy < 4; copy += 1) {
      blocks.push(variantBlock(work, variants[index]));
      if (copy < 3) blocks.push('\\cutline');
    }
    if (index + 1 < variants.length) blocks.push('\\newpage');
  }
  return `${texPreamble}${blocks.join('\n\n')}\n${texEnd}`;
}

fs.mkdirSync(outputDir, { recursive: true });
for (const level of ['A', 'B']) {
  const work = JSON.parse(fs.readFileSync(path.join(sourceDir, `work-${level}.json`), 'utf8'));
  fs.writeFileSync(path.join(outputDir, `self-study-${level}.tex`), documentFor(work));
}

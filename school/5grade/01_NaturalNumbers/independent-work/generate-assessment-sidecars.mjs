import fs from 'node:fs';
import path from 'node:path';

const root = path.dirname(new URL(import.meta.url).pathname);
const assessmentDir = path.join(root, 'assessment');
const variantIds = ['I', 'II', 'III', 'IV', 'V', 'VI'];
const instanceIds = ['01', '02', '03', '04', '05', '06'];
const itemTitles = {
  'A-01': 'Запись чисел цифрами',
  'A-03': 'Перебор чисел',
  'A-04': 'Разрядные единицы',
  'B-01': 'Запись чисел цифрами',
  'B-02': 'Число цифрами и словами',
  'B-03': 'Перебор чисел',
  'B-04': 'Разрядные единицы',
  'B-05': 'Условия на цифры',
  'V-02': 'Число цифрами и словами',
  'V-04': 'Бонус',
};

function readJson(name) {
  return JSON.parse(fs.readFileSync(path.join(root, name), 'utf8'));
}

function assert(condition, message) {
  if (!condition) throw new Error(message);
}

const sources = ['A', 'B'].map((level) => ({
  level,
  work: readJson(`work-${level}.json`),
  rubric: readJson(`rubric-${level}.json`),
}));

for (const { level, work, rubric } of sources) {
  assert(work.content_status === 'approved-composition', `work ${level} is not approved`);
  assert(work.work_id === rubric.work_id, `work/rubric ID mismatch for ${level}`);
  assert(work.variant_policy.count === 6, `work ${level} must have six variants`);
  assert(JSON.stringify(work.variant_policy.variants.map((item) => item.id)) === JSON.stringify(variantIds), `variant IDs mismatch for ${level}`);
  assert(JSON.stringify(work.variant_policy.variants.map((item) => item.instance_id)) === JSON.stringify(instanceIds), `instance IDs mismatch for ${level}`);
  assert(JSON.stringify(rubric.variants) === JSON.stringify(work.variant_policy.variants), `rubric variants mismatch for ${level}`);
  const rubricTasks = new Map(rubric.tasks.map((task) => [task.bank_item_id, task]));
  for (const task of work.tasks) {
    const scoring = rubricTasks.get(task.bank_item_id);
    assert(scoring, `rubric task missing: ${task.bank_item_id}`);
    assert(scoring.max_score === task.max_score, `max score mismatch: ${task.bank_item_id}`);
    assert(scoring.criteria.reduce((sum, item) => sum + item.points, 0) === task.max_score, `criterion sum mismatch: ${task.bank_item_id}`);
    for (const instanceId of instanceIds) {
      assert(task.instances[instanceId]?.prompt_latex, `prompt missing: ${task.bank_item_id}/${instanceId}`);
      assert(scoring.instances[instanceId]?.answer_latex, `answer missing: ${task.bank_item_id}/${instanceId}`);
    }
  }
  const main = work.tasks.filter((task) => !task.optional).reduce((sum, task) => sum + task.max_score, 0);
  const bonus = work.tasks.filter((task) => task.optional).reduce((sum, task) => sum + task.max_score, 0);
  assert(main === work.scoring.main_max_score, `main score mismatch for ${level}`);
  assert(bonus === work.scoring.bonus_max_score, `bonus score mismatch for ${level}`);
}

const itemSources = new Map();
for (const source of sources) {
  const rubricTasks = new Map(source.rubric.tasks.map((task) => [task.bank_item_id, task]));
  for (const task of source.work.tasks) {
    const existing = itemSources.get(task.bank_item_id);
    const value = { ...source, task, scoring: rubricTasks.get(task.bank_item_id) };
    if (existing) {
      assert(JSON.stringify(existing.task.instances) === JSON.stringify(task.instances), `shared prompts differ: ${task.bank_item_id}`);
      assert(JSON.stringify(existing.scoring.instances) === JSON.stringify(value.scoring.instances), `shared answers differ: ${task.bank_item_id}`);
    } else {
      itemSources.set(task.bank_item_id, value);
    }
  }
}

function slug(bankItemId) {
  return bankItemId.toLowerCase();
}

function expected(scoring, instanceId) {
  return [{ id: 'expected', type: 'latex_expression', latex: scoring.instances[instanceId].answer_latex }];
}

const assessmentItems = [...itemSources.values()].map(({ level, task, scoring }) => {
  assert(itemTitles[task.bank_item_id], `title missing: ${task.bank_item_id}`);
  return {
    id: slug(task.bank_item_id),
    title: itemTitles[task.bank_item_id],
    source_ref: `work-${level}.json#${task.bank_item_id}`,
    statement_latex: task.instances['01'].prompt_latex,
    rubric_profile: `${slug(task.bank_item_id)}-v1`,
    expected_answers: expected(scoring, '01'),
  };
});

const variants = variantIds.map((id, index) => ({
  id,
  item_overrides: Object.fromEntries(
    [...itemSources.values()].map(({ task, scoring }) => [
      slug(task.bank_item_id),
      {
        statement_latex: task.instances[instanceIds[index]].prompt_latex,
        expected_answers: expected(scoring, instanceIds[index]),
      },
    ]),
  ),
}));

const criteria = [];
const profiles = [];
for (const { task, scoring } of itemSources.values()) {
  const allocations = [];
  for (const criterion of scoring.criteria) {
    const criterionId = `g5.natural.${slug(task.bank_item_id)}.${criterion.id.replaceAll('_', '-')}`;
    criteria.push({
      id: criterionId,
      title: criterion.rule,
      max_points: criterion.points,
      evidence: [criterion.rule],
      review_triggers: scoring.diagnostic_codes,
    });
    allocations.push({ criterion_id: criterionId, max_points: criterion.points });
  }
  profiles.push({
    id: `${slug(task.bank_item_id)}-v1`,
    assessment_item_id: slug(task.bank_item_id),
    max_points: task.max_score,
    criteria: allocations,
  });
}

const cases = [];
for (const profile of profiles) {
  cases.push({
    id: `${profile.assessment_item_id}-correct`,
    assessment_item_id: profile.assessment_item_id,
    category: 'correct',
    expected: {
      final_score: profile.max_points,
      review_status: 'ready_for_batch_approval',
      criterion_results: profile.criteria.map((item) => ({ criterion_id: item.criterion_id, suggested_points: item.max_points, status: 'met' })),
      review_flags: [],
    },
  });
  cases.push({
    id: `${profile.assessment_item_id}-needs-review`,
    assessment_item_id: profile.assessment_item_id,
    category: 'uncertain',
    expected: {
      final_score: 0,
      review_status: 'needs_review',
      criterion_results: profile.criteria.map((item) => ({ criterion_id: item.criterion_id, suggested_points: 0, status: 'uncertain' })),
      review_flags: ['ambiguous-handwriting'],
    },
  });
}

function sequence(work, includeBonus) {
  return work.tasks
    .filter((task) => includeBonus || !task.optional)
    .map((task) => ({ assessment_item_id: slug(task.bank_item_id), answer_space: 'compact' }));
}

const taskDocument = {
  schema_version: 1,
  task_id: 'TASK-G5-NATURAL-NUMBERS-INDEPENDENT-001',
  version: 1,
  topic_id: 'g5_natural_numbers_notation',
  source: {
    task_record: 'school/5grade/01_NaturalNumbers/independent-work/README.md',
    latex_package_dir: 'school/5grade/01_NaturalNumbers/independent-work',
  },
  assessment_items: assessmentItems,
  variants,
};

const rubricDocument = {
  schema_version: 1,
  rubric_version_id: 'g5-natural-numbers-independent-v1',
  task_id: taskDocument.task_id,
  criteria,
  profiles,
};

const testCasesDocument = {
  schema_version: 1,
  task_id: taskDocument.task_id,
  rubric_version_id: rubricDocument.rubric_version_id,
  cases,
};

const workA = sources.find((source) => source.level === 'A').work;
const workB = sources.find((source) => source.level === 'B').work;
const issuanceDocument = {
  schema_version: 1,
  task_id: taskDocument.task_id,
  issuance_status: 'ready',
  work_packages: [
    {
      id: 'G5-NATURAL-NUMBERS-INDEPENDENT-A-V1',
      title: '5 класс. Натуральные числа. Самостоятельная работа A',
      status: 'ready',
      layout_id: 'standard-2x3-v1',
      processing: 'photo-upload-v1',
      variant_ids: variantIds,
      item_sequence: sequence(workA, false),
    },
    {
      id: 'G5-NATURAL-NUMBERS-INDEPENDENT-B-V1',
      title: '5 класс. Натуральные числа. Самостоятельная работа B',
      status: 'ready',
      layout_id: 'standard-2x3-v1',
      processing: 'photo-upload-v1',
      variant_ids: variantIds,
      item_sequence: sequence(workB, false),
    },
    {
      id: 'G5-NATURAL-NUMBERS-INDEPENDENT-B-BONUS-V1',
      title: '5 класс. Натуральные числа. Самостоятельная работа B с бонусом',
      status: 'draft',
      layout_id: 'standard-2x3-v1',
      processing: 'photo-upload-v1',
      variant_ids: variantIds,
      item_sequence: sequence(workB, true),
    },
  ],
};

fs.mkdirSync(assessmentDir, { recursive: true });
for (const [name, document] of Object.entries({
  'task.yaml': taskDocument,
  'rubric.yaml': rubricDocument,
  'test-cases.yaml': testCasesDocument,
  'issuance.yaml': issuanceDocument,
})) {
  fs.writeFileSync(path.join(assessmentDir, name), `${JSON.stringify(document, null, 2)}\n`);
}

console.log(`Generated assessment sidecars in ${assessmentDir}`);

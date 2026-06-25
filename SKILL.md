---
name: loop
description: Loop Engineering workflow for Codex. Use when the user invokes $loop, says "Loop", "Loop Engineering", asks to set up an autonomous project cycle, continue work from roadmap/progress, or wants Codex to analyze a repository, create/update project-analysis.md, AGENTS.md, roadmap.md, progress.md, loop.md, verification.md, execute one small safe task, verify it, and report the result.
---

# Loop

Use this skill to set up or continue a small verified development loop:
plan -> task -> code/docs -> verification -> fix -> progress -> next task.

## Core Rules

- Work in English by default unless the user asks otherwise.
- Prefer small, safe, reviewable changes over broad rewrites.
- Preserve existing project style, stack, architecture, and user work.
- Do not delete important files, change the stack, add dependencies, deploy, publish, or run destructive commands without explicit approval.
- Never mark a task done if verification failed or was not run.
- If offering choices, phrase them as a short numbered question so the user can answer with a number.

## Start Or Continue

1. Inspect the current repository before editing:
   - file tree and git status;
   - README, package files, lockfiles, build configs, tests, scripts;
   - main source folders and existing project docs.
2. If Loop files already exist, read them before changing anything:
   - `AGENTS.md`
   - `project-analysis.md`
   - `roadmap.md`
   - `progress.md`
   - `loop.md`
   - `verification.md`
3. If files are missing, create them. If they exist, update them surgically and preserve useful existing content.
4. Choose exactly one first/next task: the smallest safe high-priority item from `roadmap.md`. If no safe coding task is clear, choose a documentation or verification task.
5. Execute one loop only unless the user explicitly asks for multiple loops or ongoing autonomous work.

## File Responsibilities

### `project-analysis.md`

Include:
- project purpose;
- current structure;
- tech stack;
- run/build/test/lint commands discovered from the project;
- completed parts;
- unfinished or risky parts;
- strengths;
- problems;
- recommended next work.

### `AGENTS.md`

Keep concise and project-specific. Include:
- how Codex should read this project;
- coding conventions;
- commands to run;
- verification expectations;
- safety rules;
- how to update `progress.md`;
- instruction to follow the closest nested `AGENTS.md` when present.

Do not overwrite unrelated project rules. Merge with them.

### `roadmap.md`

Use this task format:

```md
- [ ] ID: TASK-001
  Title:
  Goal:
  What to do:
  Files:
  Definition of done:
  Verification:
  Priority: high/medium/low
```

Create practical tasks that are small, checkable, and useful. Prefer 5-12 tasks for the initial roadmap.

### `progress.md`

Append entries. Do not erase history.

Each entry should include:
- date;
- task ID and name;
- what changed;
- files touched;
- checks run;
- result;
- next step.

### `loop.md`

Describe the operating loop:

1. Read `AGENTS.md`.
2. Read `roadmap.md`.
3. Read `progress.md`.
4. Pick the first unfinished high-priority safe task.
5. Implement the smallest useful change.
6. Run verification.
7. Fix failures if they are in scope.
8. Update `progress.md`.
9. Mark the task done only if verification passes or the task is documentation-only and manually reviewed.
10. Report the result and next task.

### `verification.md`

Document:
- install command, if needed;
- dev/run command;
- build command;
- test command;
- lint/typecheck command;
- manual checklist;
- what counts as success;
- what to do when checks fail.

Detect package manager from lockfiles:
- `pnpm-lock.yaml` -> `pnpm`
- `yarn.lock` -> `yarn`
- `package-lock.json` -> `npm`
- `bun.lockb` or `bun.lock` -> `bun`

Do not run dependency installation automatically unless dependencies are missing or the task requires it. Prefer existing lockfiles and existing scripts.

## First Loop

After setting up or updating the Loop files:

1. Pick one small safe task from `roadmap.md`.
2. Implement it.
3. Run the best available verification:
   - inspect `package.json` before choosing Node commands;
   - run build/test/lint when scripts exist and are relevant;
   - for static HTML, verify references, IDs, selectors, and browser behavior when practical;
  - for Swift/macOS, use the project's existing Xcode or SwiftPM commands when available.
4. Fix in-scope errors.
5. Update `progress.md`.
6. Mark the task complete in `roadmap.md` only when its readiness criteria are met.

## Final Report

End with:

```md
## Loop Report

Completed:
Checks:
Errors:
Fixed:
Next task:
Recommendations:
```

Keep the report concise and include changed file paths.

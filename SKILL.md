---
name: loop
description: Loop Engineering workflow for Codex. Use when the user invokes $loop, says "Loop", "Loop Engineering", asks to set up an autonomous project cycle, continue work from roadmap/progress, run audit-only, repair, or matrix mode, or wants Codex to analyze a repository, create/update project-analysis.md, AGENTS.md, roadmap.md, progress.md, loop.md, verification.md from templates, execute one small safe task, verify it, and report the result.
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

## Operating Modes

Pick exactly one mode from the user's request. If the mode is not explicit, infer the safest useful mode:

- `setup`: inspect the project, create or update Loop files, then run one first safe task unless the user asks for docs only.
- `continue`: read existing Loop files, select one next task from `roadmap.md`, implement it, verify it, and update progress.
- `audit-only`: inspect the project and Loop files, report findings and recommended next work, but do not edit files.
- `repair`: inspect existing Loop files, fix missing sections, stale commands, oversized tasks, or inconsistent progress records, then verify the documentation. Do not change application code unless explicitly requested.
- `matrix`: inspect the project stack and commands, then create or update the verification matrix in `verification.md`. Do not change application code or implement roadmap tasks unless explicitly requested.

Default to `setup` when Loop files are missing. Default to `continue` when `roadmap.md` and `progress.md` already exist. Use `audit-only` when the user asks to inspect, review, or diagnose without making changes. Use `matrix` when the user asks for verification strategy, a check matrix, or project-specific validation instructions.

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
3. If files are missing, create them from the closest matching file in `templates/`. If they exist, update them surgically and preserve useful existing content.
4. In `setup`, `continue`, or `repair`, choose exactly one first/next task: the smallest safe high-priority item from `roadmap.md`. If no safe coding task is clear, choose a documentation or verification task.
5. Execute one loop only unless the user explicitly asks for multiple loops or ongoing autonomous work.
6. In `audit-only`, stop after the report. Do not create files, edit files, install dependencies, or run commands that change project state.
7. In `matrix`, update only `verification.md` and directly related discovered-command notes. Do not select or implement a roadmap task.

## Template Use

Use templates as structure, not as text to copy blindly. Fill unknown items with `Unknown` or `Not found` only after inspecting the repository.

Template files:
- `templates/AGENTS.md`
- `templates/project-analysis.md`
- `templates/roadmap.md`
- `templates/progress.md`
- `templates/loop.md`
- `templates/verification.md`

When a target project already has any of these files:
- preserve user-written rules, decisions, history, and project-specific details;
- add missing sections only where they improve future loop runs;
- do not reorder append-only progress history;
- do not replace a local `AGENTS.md` with the generic template.

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

## Verification Matrix

Choose the narrowest verification that proves the completed task. Prefer commands already defined by the project.

In `matrix` mode, this section is the primary deliverable. Build a compact project-specific matrix that maps each detected stack or project area to:
- command or manual check;
- when to run it;
- success signal;
- fallback when the command is unavailable.

### Node, Next.js, Vite, React, or TypeScript

Inspect `package.json` and the lockfile first. Prefer:
- install: only when dependencies are missing, using the detected package manager;
- lint: `<pm> run lint` when available;
- typecheck: `<pm> run typecheck` or `tsc --noEmit` when configured;
- test: `<pm> test` or the project's named test script;
- build: `<pm> run build` for user-facing or bundling changes.

### Python

Inspect `pyproject.toml`, `requirements*.txt`, `Pipfile`, `poetry.lock`, and test folders. Prefer:
- lint/format checks when configured, such as `ruff check .`;
- typecheck when configured, such as `mypy`;
- tests with `pytest` when present;
- package or app-specific smoke commands documented by the project.

### Swift, iOS, or macOS

Inspect `Package.swift`, `.xcodeproj`, `.xcworkspace`, schemes, and existing scripts. Prefer:
- `swift test` for SwiftPM packages;
- `swift build` for SwiftPM build verification;
- the project's documented `xcodebuild` command or available Xcode workflow for app projects;
- manual app launch checks only when practical and relevant.

### Static HTML, CSS, or Vanilla JavaScript

Inspect file references and scripts. Prefer:
- static reference checks for linked CSS, JS, images, anchors, IDs, and selectors;
- local browser smoke test when the change affects behavior or layout;
- console error check when a browser is used;
- HTML/CSS validation only if tooling already exists or the task requires it.

### Documentation-only or Knowledge Projects

Prefer:
- markdown link checks when tooling exists;
- table of contents and relative link review;
- consistency check across README, project docs, roadmap, and progress;
- manual review of changed sections.

## First Loop

After setting up or updating the Loop files:

1. Pick one small safe task from `roadmap.md`.
2. Implement it.
3. Run the best available verification:
   - inspect `package.json` before choosing Node commands;
   - run build/test/lint when scripts exist and are relevant;
   - for static HTML, verify references, IDs, selectors, and browser behavior when practical;
   - for Swift/macOS, use the project's existing Xcode or SwiftPM commands when available;
   - for docs-only work, manually review the changed docs and links.
4. Fix in-scope errors.
5. Update `progress.md`.
6. Mark the task complete in `roadmap.md` only when its readiness criteria are met.

## Final Report

End with:

```md
## Loop Report

Mode:
Completed:
Checks:
Errors:
Fixed:
Next task:
Recommendations:
```

Keep the report concise and include changed file paths.

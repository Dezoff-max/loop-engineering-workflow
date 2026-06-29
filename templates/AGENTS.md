# AGENTS.md

## Project Reading Order

1. Read this file first.
2. Read `project-analysis.md`.
3. Read `contract.md`.
4. Read `roadmap.md`.
5. Read `progress.md`.
6. Read `trace.md`.
7. Read `verification.md`.
8. Inspect the relevant source files before editing.

Follow the closest nested `AGENTS.md` when one exists.

## Project Rules

- Preserve the existing stack, architecture, naming, and style.
- Prefer small, reviewable changes over broad rewrites.
- Do not delete important files or run destructive commands without explicit approval.
- Do not add dependencies, change deployment, publish, or expose services without explicit approval.
- Do not extract, copy, or store secrets from `.env`, credentials files, tokens, or private config.

## Commands

- Install: `Unknown`
- Run: `Unknown`
- Build: `Unknown`
- Test: `Unknown`
- Lint/typecheck: `Unknown`

## Verification

- Run the narrowest check that proves the task.
- Prefer existing project scripts and documented commands.
- Do not mark a task complete when verification fails or was not run.
- If verification repeats the same failure, update `trace.md` and restart from a smaller contract.
- For documentation-only changes, manually review links, headings, and consistency.

## Progress Updates

After each completed loop, append to `progress.md`:
- date;
- task ID and title;
- what changed;
- files touched;
- checks run;
- result;
- next step;
- bottleneck;
- handoff note.

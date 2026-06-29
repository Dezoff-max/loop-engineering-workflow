# Prompt Examples

Use these prompts inside Codex from the target project directory.

## Setup

```text
$loop setup
```

Expected behavior: inspect the repository, create or update Loop files from templates, select one small safe first task, verify it, and record progress.

## Continue

```text
$loop continue
```

Expected behavior: read existing Loop files, score unfinished roadmap tasks, implement one safe task, verify it, update progress, and report the next task.

## Contract

```text
$loop continue after refreshing contract.md for the selected task.
```

Expected behavior: write or update `contract.md` before implementation, then build and verify against that contract.

## Audit-only

```text
$loop audit-only
```

Expected behavior: inspect the project and Loop files, then report findings without editing files.

## Repair

```text
$loop repair
```

Expected behavior: fix missing, stale, or inconsistent Loop documentation without changing application code unless explicitly requested.

## Matrix

```text
$loop matrix
```

Expected behavior: build or refresh the project-specific verification matrix in `verification.md` without implementing roadmap tasks.

## Doctor

```text
$loop doctor
```

Expected behavior: run a read-only Loop health check and recommend the next mode.

## Restart

```text
Loop: restart from the trace and shrink the current contract.
```

Expected behavior: read `trace.md`, identify the divergence point, shrink `contract.md`, and continue only if the new task is safe.

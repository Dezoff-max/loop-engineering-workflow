# Verification

## Package Manager

- Detected package manager: `Unknown`
- Detection source: `Unknown`

## Commands

- Install: `Unknown`
- Run/dev: `Unknown`
- Build: `Unknown`
- Test: `Unknown`
- Lint/typecheck: `Unknown`

## Manual Checklist

- `$loop doctor` reports no blocking Loop-state failures, or failures are documented.
- `contract.md` defines done criteria and allowed files before implementation.
- Relevant files were inspected before editing.
- The smallest useful change was made.
- Existing user work was preserved.
- No secrets were copied or logged.
- Documentation was updated when behavior changed.
- `progress.md` was updated after verification.
- `trace.md` was updated when verification failed or the loop restarted.

## Success Criteria

- The selected task's definition of done is met.
- The selected task's contract is satisfied.
- The relevant verification command or manual check passes.
- Any known failures are documented clearly.

## If Checks Fail

1. Read the error output.
2. Fix only failures caused by the current task.
3. Re-run the relevant check.
4. If the failure is unrelated or out of scope, document it in `progress.md` and do not mark the task complete.

## Verification Matrix

In `matrix` mode, fill this section with project-specific checks. Each row should explain what to run, when to run it, what success looks like, and what fallback to use when the command is unavailable.

### Node, Next.js, Vite, React, or TypeScript

- Inspect `package.json` and lockfiles.
- Prefer existing scripts: lint, typecheck, test, build.
- Install dependencies only when missing and required.

### Python

- Inspect `pyproject.toml`, `requirements*.txt`, and test folders.
- Prefer configured checks such as `ruff`, `mypy`, and `pytest`.

### Swift, iOS, or macOS

- Inspect `Package.swift`, `.xcodeproj`, `.xcworkspace`, schemes, and scripts.
- Prefer `swift test`, `swift build`, or documented `xcodebuild` commands.

### Static HTML, CSS, or Vanilla JavaScript

- Check linked CSS, JS, images, anchors, IDs, and selectors.
- Use a browser smoke test for behavior or layout changes when practical.

### Documentation-only or Knowledge Projects

- Review headings, links, tables, and consistency across docs.
- Use markdown tooling when it already exists.

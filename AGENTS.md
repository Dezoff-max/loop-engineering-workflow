# AGENTS.md

## Purpose

This repository contains the `loop` Codex skill. Keep the skill small, safe, deterministic, and easy to verify.

## Reading Order

1. Read `SKILL.md`.
2. Read `templates/*.md`.
3. Read `examples/*.md`.
4. Read `README.md`.
5. Read `verification.md`.
6. Inspect `scripts/check.sh` before changing validation behavior.

## Editing Rules

- Preserve the public skill name: `name: loop`.
- Keep operating modes explicit and documented in both `SKILL.md` and `README.md`.
- Keep every generated-file template in `templates/`.
- Keep contract, trace, bottleneck, and restart instructions synchronized across `SKILL.md`, templates, examples, and `scripts/check.sh`.
- Do not add runtime dependencies for the skill unless there is a strong reason.
- Prefer instructions and templates over complex code.
- Do not remove safety rules that protect user work, secrets, or publishing/deployment boundaries.

## Verification

Run before committing:

```bash
scripts/check.sh
```

Also run:

```bash
git diff --check
```

## Release Rules

- Keep changes in `CHANGELOG.md` under `Unreleased` until a version is cut.
- Do not tag, publish, or push without explicit user approval.
- If the install path changes, update `install.sh`, `README.md`, and `scripts/check.sh` together.

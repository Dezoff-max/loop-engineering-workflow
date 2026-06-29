# Changelog

All notable changes to Loop Engineering Workflow will be documented in this file.

## Unreleased

- Added `contract.md` and `trace.md` templates for explicit task contracts and restart traces.
- Added planner, builder, and evaluator role separation to the loop instructions.
- Added restart policy, trace reading, bottleneck detection, and harness pruning guidance.
- Added bottleneck tracking to progress updates and doctor checks.
- Added contract and trace examples.

## 0.2.0 - 2026-06-28

- Added `templates/` for generated Loop project files.
- Added explicit `setup`, `continue`, `audit-only`, `repair`, `matrix`, and `doctor` operating modes.
- Added a stack-aware verification matrix for Node, Python, Swift/macOS, static HTML, and documentation-only projects.
- Added impact, risk, effort, confidence, and score fields to roadmap tasks.
- Added handoff guidance to progress updates.
- Added fixed report formats for `doctor` and `matrix` mode output.
- Added examples for prompts, doctor reports, and verification matrices.
- Added `scripts/check.sh` as a self-test for skill structure and docs.
- Added repository-level `AGENTS.md` and `verification.md` for maintaining the skill itself.
- Changed the default install path to `~/.codex/skills/loop-engineering-workflow` and added a duplicate-skill guard for the legacy `loop` path.
- Updated README usage examples and repository structure for the new modes, templates, and checks.

## 0.1.1 - 2026-06-25

- Added README badges.
- Added more usage examples.
- Added a safe `install.sh` installer for Codex skill installation and updates.

## 0.1.0 - 2026-06-25

- Initial public release of the Loop Engineering Workflow Codex skill.
- Added the core `SKILL.md` workflow instructions.
- Added OpenAI agent metadata in `agents/openai.yaml`.
- Added public documentation, installation instructions, safety principles, and MIT license.

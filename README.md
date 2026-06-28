# Loop Engineering Workflow

[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Codex Skill](https://img.shields.io/badge/Codex-skill-111827.svg)](SKILL.md)
[![Workflow](https://img.shields.io/badge/workflow-loop%20engineering-blue.svg)](README.md)
[![GitHub](https://img.shields.io/badge/GitHub-public-brightgreen.svg)](https://github.com/Dezoff-max/loop-engineering-workflow)

Loop Engineering Workflow is a Codex skill for running a small, safe, verified development loop inside an existing project.

It helps Codex inspect a repository, maintain lightweight project planning files, choose one practical next task, implement the smallest useful change, verify it, and record progress.

## What It Does

- Analyzes the current project structure before editing.
- Creates or updates `AGENTS.md`, `project-analysis.md`, `roadmap.md`, `progress.md`, `loop.md`, and `verification.md` using stable templates.
- Supports `setup`, `continue`, `audit-only`, `repair`, and `matrix` modes.
- Selects exactly one small, safe task from the roadmap.
- Runs the best available verification for the project using a stack-aware verification matrix.
- Records what changed, which checks ran, and what should happen next.
- Uses English by default, unless the user asks for another language.

## Workflow

```mermaid
flowchart LR
  A["Inspect project"] --> B["Update Loop docs"]
  B --> C["Pick one safe task"]
  C --> D["Implement minimal change"]
  D --> E["Verify"]
  E --> F["Record progress"]
  F --> G["Report next step"]
```

## Repository Structure

```text
.
+-- SKILL.md
+-- agents/
|   +-- openai.yaml
+-- CHANGELOG.md
+-- install.sh
+-- LICENSE
+-- README.md
+-- templates/
|   +-- AGENTS.md
|   +-- loop.md
|   +-- progress.md
|   +-- project-analysis.md
|   +-- roadmap.md
|   +-- verification.md
```

## Installation

Install with the included script:

```bash
curl -fsSL https://raw.githubusercontent.com/Dezoff-max/loop-engineering-workflow/main/install.sh | bash
```

Or clone this repository manually into your Codex skills directory:

```bash
mkdir -p ~/.codex/skills
git clone https://github.com/Dezoff-max/loop-engineering-workflow.git ~/.codex/skills/loop
```

You can install into a custom location with:

```bash
curl -fsSL https://raw.githubusercontent.com/Dezoff-max/loop-engineering-workflow/main/install.sh | INSTALL_DIR="$HOME/.codex/skills/loop-dev" bash
```

If `~/.codex/skills/loop` already exists and is not this repository, the installer stops without changing it.

## Usage

Inside Codex, invoke the skill with:

```text
$loop
```

You can also ask for it naturally:

```text
Loop: continue this project from the roadmap.
```

More examples:

```text
$loop analyze this repository and run the first safe task.
```

```text
Use Loop Engineering to continue from roadmap.md and progress.md.
```

```text
Loop: set up the project planning files, verify the app, and report the next task.
```

```text
Loop setup: create the planning files and run the first safe task.
```

```text
Loop continue: pick the next roadmap item, implement it, verify it, and update progress.
```

```text
Loop audit-only: inspect the project and report what should happen next without editing files.
```

```text
Loop repair: clean up stale Loop docs and verification instructions without changing app code.
```

```text
Loop matrix: build or refresh the project's verification matrix without changing app code.
```

## Operating Modes

| Mode | Purpose |
| --- | --- |
| `setup` | Inspect a project, create or update Loop files from templates, and run one first safe task unless told otherwise. |
| `continue` | Read existing Loop files, choose one next roadmap task, implement it, verify it, and record progress. |
| `audit-only` | Inspect the project and Loop files, then report findings without editing files. |
| `repair` | Fix missing, stale, or inconsistent Loop documentation without changing application code unless explicitly requested. |
| `matrix` | Build or refresh `verification.md` with stack-specific commands, manual checks, success signals, and fallbacks without changing application code. |

## Generated Project Files

The skill maintains these files in the target project:

| File | Purpose |
| --- | --- |
| `AGENTS.md` | Project-specific rules for Codex. |
| `project-analysis.md` | Current structure, stack, commands, risks, and recommended work. |
| `roadmap.md` | Small, checkable tasks with clear success criteria. |
| `progress.md` | Append-only history of completed loop work. |
| `loop.md` | The operating procedure for future loop runs. |
| `verification.md` | Commands and manual checks that define done. |

## Templates

The `templates/` directory provides stable starting structures for generated Loop files. Codex should use these templates as a baseline, then adapt them to the current project instead of copying generic placeholders blindly.

## Verification Matrix

Loop chooses the narrowest check that proves the selected task. In `matrix` mode, the verification matrix itself is the deliverable. The skill includes verification guidance for:

- Node, Next.js, Vite, React, and TypeScript projects.
- Python projects.
- Swift, iOS, and macOS projects.
- Static HTML, CSS, and vanilla JavaScript projects.
- Documentation-only and knowledge projects.

## Safety Principles

- Prefer small, reviewable changes over broad rewrites.
- Preserve the project's existing stack, structure, and visual style.
- Do not delete important files or run destructive commands without explicit approval.
- Do not publish, deploy, or expose anything publicly without explicit approval.
- Do not mark a task complete unless verification passed or the task was documentation-only and manually reviewed.

## Contributing

Forks, issues, and pull requests are welcome. If you adapt Loop Engineering Workflow for your own Codex setup, feel free to share improvements that keep the skill small, safe, and easy to verify.

## Compatibility

This skill is designed for the Codex skill layout:

```text
~/.codex/skills/loop/SKILL.md
~/.codex/skills/loop/agents/openai.yaml
~/.codex/skills/loop/templates/*.md
```

It is project-agnostic and can be used with web apps, macOS apps, static prototypes, documentation projects, and other repositories where incremental verified work is useful.

## License

MIT License. See [LICENSE](LICENSE).

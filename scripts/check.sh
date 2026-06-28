#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root_dir"

fail() {
  printf 'check failed: %s\n' "$1" >&2
  exit 1
}

required_files=(
  "AGENTS.md"
  "SKILL.md"
  "README.md"
  "CHANGELOG.md"
  "install.sh"
  "verification.md"
  "agents/openai.yaml"
  "templates/AGENTS.md"
  "templates/project-analysis.md"
  "templates/roadmap.md"
  "templates/progress.md"
  "templates/loop.md"
  "templates/verification.md"
)

for file in "${required_files[@]}"; do
  [ -f "$file" ] || fail "missing required file: $file"
done

grep -q '^---$' SKILL.md || fail "SKILL.md is missing frontmatter"
grep -q '^name: loop$' SKILL.md || fail "SKILL.md frontmatter must include name: loop"
grep -q '^description: ' SKILL.md || fail "SKILL.md frontmatter must include description"

for mode in setup continue audit-only repair matrix doctor; do
  grep -q "\`$mode\`" SKILL.md || fail "SKILL.md missing mode: $mode"
  grep -q "\`$mode\`" README.md || fail "README.md missing mode: $mode"
done

for field in Impact Risk Effort Confidence Score; do
  grep -q "^  $field:" templates/roadmap.md || fail "roadmap template missing scoring field: $field"
done

grep -q '^## Handoff$' templates/progress.md || fail "progress template missing handoff block"
grep -q 'Verification Matrix' templates/verification.md || fail "verification template missing matrix"
grep -q 'Loop Doctor Report' SKILL.md || fail "SKILL.md missing doctor report template"
grep -q 'Command or check' SKILL.md || fail "SKILL.md missing matrix report template"
grep -q 'loop-engineering-workflow' install.sh || fail "install.sh missing canonical install path"
grep -q 'loop-engineering-workflow' README.md || fail "README.md missing canonical install path"
grep -q 'scripts/check.sh' AGENTS.md || fail "AGENTS.md missing self-test command"
grep -q 'scripts/check.sh' verification.md || fail "verification.md missing self-test command"

bash -n install.sh
bash -n scripts/check.sh

if grep -nE '[[:blank:]]$' "${required_files[@]}" scripts/check.sh >/tmp/loop-check-trailing-whitespace.txt; then
  cat /tmp/loop-check-trailing-whitespace.txt >&2
  fail "trailing whitespace found"
fi

printf 'All checks passed.\n'

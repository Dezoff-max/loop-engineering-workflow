# Verification

## Commands

- Self-test: `scripts/check.sh`
- Whitespace check: `git diff --check`
- Shell syntax: included in `scripts/check.sh`

## Manual Checklist

- `SKILL.md` frontmatter keeps `name: loop`.
- Every operating mode appears in both `SKILL.md` and `README.md`.
- Every mode has clear edit boundaries.
- `templates/` includes all generated Loop files.
- `README.md` examples match the current modes.
- `CHANGELOG.md` includes user-facing changes under `Unreleased`.
- `install.sh` default path matches README compatibility docs.
- No instruction weakens secret handling, destructive-action approval, or publishing approval.

## Success Criteria

- `scripts/check.sh` passes.
- `git diff --check` passes.
- New behavior is documented in `README.md` and `CHANGELOG.md`.
- The active local skill can be fast-forwarded cleanly from this repo.

## If Checks Fail

1. Fix only failures caused by the current change.
2. Re-run `scripts/check.sh`.
3. Re-run `git diff --check`.
4. Do not commit until both checks pass.

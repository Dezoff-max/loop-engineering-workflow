# Contract Example

```md
# Contract

## Task

- ID: TASK-004
- Title: Add missing validation for exported reports
- Mode: continue

## Planner Notes

- Why this task now: users can generate invalid reports without a clear failure.
- Expected value: fewer broken exports and easier debugging.
- Main risk: touching unrelated export behavior.

## Builder Scope

- Allowed files: `src/export/*`, `tests/export/*`
- Allowed commands: `npm test -- export`
- Out of scope: UI redesign, dependency changes, release work
- Dependencies allowed: no
- Destructive actions allowed: no

## Evaluator Checklist

- Done criteria: invalid report input returns a clear validation error.
- Required verification: `npm test -- export`
- Manual checks: review error text for user clarity.
- Evidence to collect: test output and touched files.

## Restart Signals

Restart or shrink the task if the fix requires changing unrelated report rendering.

## Result

- Status: pending
- Verification result:
- Notes:
```

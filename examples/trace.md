# Trace Example

```md
# Trace

## 2026-06-29 - TASK-004 - Add missing validation for exported reports

- Symptom: export tests fail after the second patch with the same schema error.
- Expected behavior: invalid input returns a validation error before rendering.
- Actual behavior: invalid input reaches rendering and fails with a generic exception.
- Divergence point: contract allowed only export validation files, but the fix needs shared schema normalization.
- Evidence: `npm test -- export` fails in `schema-normalize.test.ts`.
- Decision: restart with a smaller contract focused on schema normalization.
- Next action: update `contract.md`, keep current changes uncommitted until scoped.
```

# Verification Matrix Example

```md
## Verification Matrix

| Area | Command or check | When to run | Success signal | Fallback |
| --- | --- | --- | --- | --- |
| Node app | `npm run build` | After app code, routing, or bundling changes. | Build exits 0. | Run the narrowest available script and document the missing build script. |
| TypeScript | `npm run typecheck` | After typed source changes. | Typecheck exits 0. | Run `npx tsc --noEmit` if TypeScript is configured. |
| Tests | `npm test` | After behavior or logic changes. | Test command exits 0. | Run the closest focused test command and document missing coverage. |
| Documentation | Manual markdown review | After docs-only changes. | Links, headings, and examples match the repo. | Document unchecked links if no tooling exists. |
```

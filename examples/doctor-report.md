# Doctor Report Example

```md
## Loop Doctor Report

Status: warn

| Check | Result | Evidence | Recommendation |
| --- | --- | --- | --- |
| Required files | pass | All Loop files are present. | Continue. |
| Project rules | pass | `AGENTS.md` includes project-specific safety and verification rules. | Continue. |
| Project analysis | warn | Commands are documented, but the analysis has not been refreshed after recent config changes. | Run `repair`. |
| Roadmap quality | pass | Tasks are small and include scoring fields. | Continue. |
| Progress evidence | pass | Latest entry includes checks and result. | Continue. |
| Verification matrix | warn | Matrix exists, but one test command is stale. | Run `matrix`. |
| Safety | pass | No unsafe publish, delete, or secret-handling instructions found. | Continue. |

Next mode: matrix
```

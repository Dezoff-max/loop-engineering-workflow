# Doctor Report Example

```md
## Loop Doctor Report

Status: warn

| Check | Result | Evidence | Recommendation |
| --- | --- | --- | --- |
| Required files | pass | All Loop files are present. | Continue. |
| Project rules | pass | `AGENTS.md` includes project-specific safety and verification rules. | Continue. |
| Project analysis | warn | Commands are documented, but the analysis has not been refreshed after recent config changes. | Run `repair`. |
| Contract quality | pass | `contract.md` defines done criteria, allowed files, and restart signals. | Continue. |
| Roadmap quality | pass | Tasks are small and include scoring fields. | Continue. |
| Progress evidence | pass | Latest entry includes checks, result, bottleneck, and handoff. | Continue. |
| Trace quality | pass | Prior restart is recorded with divergence evidence. | Continue. |
| Verification matrix | warn | Matrix exists, but one test command is stale. | Run `matrix`. |
| Harness weight | warn | Two workflow notes duplicate verification instructions. | Prune in `repair`. |
| Safety | pass | No unsafe publish, delete, or secret-handling instructions found. | Continue. |

Next mode: matrix
```

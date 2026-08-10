# Stable Rule Catalog

Use these IDs when discussing adoption and updates. They identify behavior, not exact wording. The final user-owned `AGENTS.md` may use different prose.

| ID | Reference rules | Behavior | Applicability |
|---|---:|---|---|
| START-001 | 1 | Confirm Shell, working directory, task scope, and Git status/branch/HEAD before project work | General project work |
| START-002 | 2 | Re-read applicable instructions and recovery notes at each project-work turn; update them at meaningful checkpoints | General project work; requires readable notes when present |
| GIT-001 | 3 | Confirm a valid recovery point before risky, accepted, multi-file, stateful, media, configuration, or rework changes | Git repositories |
| GIT-002 | 4 | Prefer a task-scoped local commit; otherwise create an external binary patch or equivalent exact backup; do not push without authority | Git repositories; policy-specific |
| GIT-003 | 5 | Exclude unrelated work, avoid whole-worktree stash, prohibit unauthorized destructive resets, and verify rollback targets | Git repositories |
| SUB-001 | 8 | Give each subagent one bounded task with explicit input, output, stop condition, and exclusions | Requires subagent support |
| SUB-002 | 8-9 | Limit delegation depth and concurrency, keep exploration read-only, centralize final acceptance, and close completed agents | Requires subagent support |
| SUB-003 | 7 | Select model and reasoning capability according to the user-approved routing strategy | Requires exposed controls or fallback policy |
| SUB-004 | 6 | Escalate after a finite precheck when scope, uncertainty, lifecycle complexity, media/browser work, or failed rework crosses the selected threshold | Requires subagent support |
| SUB-005 | 7 | Route throughput, browser/write, review, and high-risk work only to verified capabilities; named models are examples, not assumed availability | Capability- and preference-specific |
| SUB-006 | 9 | Retry an inadequate subagent at most once, then return control to the primary agent and summarize evidence and risk | Requires subagent support |
| MEDIA-001 | 10 | Preserve originals and send compressed, bounded review copies; use lossless crops for transparency or pixel detail and never place image base64 in the thread | Visual/media workflows |
| ENV-001 | 11 | Assume mainland China and Windows only when selected | Environment-specific |
| SHELL-001 | 11 | Detect the current shell and use its supported syntax | General; wording is shell-specific |
| SHELL-002 | 11 | Quote command paths, especially paths with spaces or non-ASCII characters | General |
| NET-001 | 12 | Use command-scoped mirrors/proxies and require approval for new tools or broader configuration changes | Preference-specific |
| FILE-001 | 13 | Preserve encoding, BOM, line endings, structure, and existing Chinese | General |
| FILE-002 | 13-14 | Keep edits scoped and ask before destructive, broad, uncertain, or subjective changes | General |
| WRITE-001 | 7-8,13 | Keep write ownership explicit; reviewers and exploration remain read-only unless a verified role is explicitly authorized | Capability- and preference-specific |
| RES-001 | 15 | Apply the selected per-command worker policy only where the tool supports it | Tool- and preference-specific |
| RES-002 | 15 | Avoid concurrent heavy work, announce resource-heavy commands, stop leftover processes, and reduce load when the user reports lag | Preference-specific |
| COMM-001 | 15 | Protect the primary context, avoid raw logs/base64, and follow the selected response language and detail level | Preference-specific |
| NOTES-001 | 2 | Read applicable development memory before acting, then apply a separate write gate without creating ceremonial notes | Requires installed Skill |

## Semantic Comparison Rules

- An exact text difference is not automatically a behavioral conflict.
- A shorter local rule may already cover several reference rules.
- Environment-specific examples must not become unconditional global requirements.
- A user-selected value always overrides the reference sample for that preference.
- Unsupported platform capabilities must be omitted or expressed as conditional behavior.
- Named models such as `luna`, `terra`, or `sol` must be detected and user-mapped before adoption; preserve the role semantics when exact names are unavailable.
- Never use stable IDs as justification to replace locally customized text without approval.

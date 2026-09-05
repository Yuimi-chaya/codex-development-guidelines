# Stable Rule Catalog

Use these IDs when discussing adoption, updates, and translations. They identify behavior rather than exact wording. A user-owned `AGENTS.md` may use different prose, and a localized reference must preserve the same active ID set.

| ID | Reference rule | Behavior | Applicability |
|---|---:|---|---|
| START-001 | 1 | Confirm Shell, working directory, task scope, and Git status/branch/HEAD before project work | General project work |
| START-002 | 2 | Re-read applicable instructions and recovery notes at each project-work turn and update them at meaningful verified checkpoints | General project work; requires readable notes when present |
| NOTES-001 | 2 | Read relevant development memory before acting and maintain it only when a durable change is worth recording | Requires the notes Skill or an equivalent process |
| GIT-001 | 3 | Confirm a valid recovery point before risky, accepted, multi-file, stateful, media, configuration, or rework changes | Git repositories |
| GIT-002 | 4 | Prefer a task-scoped local commit; otherwise create an external binary patch or equivalent exact backup; do not publish without authority | Git repositories; policy-specific |
| GIT-003 | 5 | Exclude unrelated work, avoid whole-worktree stash, prohibit unauthorized destructive operations, and verify rollback targets | Git repositories |
| SUB-001 | 8 | Give each delegation a bounded task and prevent overlapping writes | Requires subagent support |
| SUB-002 | 8 | Honor user-selected delegation depth, concurrency, and ownership limits; keep review/exploration read-only by default | Requires subagent support |
| SUB-003 | 7 | Select concrete models and reasoning levels only from the capabilities the harness actually exposes and the user approves | Requires exposed controls or an explicit fallback |
| SUB-004 | — | **Deprecated:** mandatory numeric escalation thresholds that can force ceremonial delegation | Retained only for upgrade/conflict detection; do not adopt automatically |
| SUB-005 | 7 | Map stable work roles to verified model, reasoning, and tool capabilities without prescribing provider-specific names | Capability- and preference-specific |
| SUB-006 | 9 | Retry an inadequate subagent at most once, then return control to the primary Agent and summarize evidence and risk | Requires subagent support |
| SUB-007 | 6 | Delegate when it materially improves throughput, isolation, tool access, or review quality; do not delegate simple work merely to satisfy a rule | Requires subagent support |
| MEDIA-001 | 10 | Preserve originals and send optimized, bounded review copies; use lossless copies or crops when fidelity requires them and never place media base64 in the thread | Visual/media workflows |
| ENV-001 | 11 | Detect platform, shell, network constraints, and capabilities rather than assuming the maintainer's environment | Environment-specific |
| SHELL-001 | 11 | Detect the current shell and use syntax it supports | General; wording is shell-specific |
| SHELL-002 | 11 | Quote command paths safely, especially paths with spaces or non-ASCII characters | General |
| NET-001 | 12 | Use command-scoped mirrors/proxies and require approval for new tools or broader configuration changes | Preference-specific |
| FILE-001 | 13 | Preserve encoding, BOM, line endings, permissions, structure, and existing user content | General |
| FILE-002 | 14 | Keep edits scoped and ask before destructive, broad, uncertain, or subjective changes | General |
| WRITE-001 | 8, 14 | Keep write ownership explicit; reviewers and exploration remain read-only unless a verified role is authorized | Capability- and preference-specific |
| RES-001 | 15 | Apply selected worker and tool-specific parallelism only where supported | Tool- and preference-specific |
| RES-002 | 15 | Respect selected heavy-task and background-process limits, announce heavy work, and react to lag | Preference-specific |
| COMM-001 | 15 | Protect the primary context and follow the selected response language and detail level | Preference-specific |

## Semantic comparison rules

- An exact text difference is not automatically a behavioral conflict.
- A shorter local rule may already cover several reference rules.
- Environment-specific examples must not become unconditional global requirements.
- A user-selected value always overrides a reference sample for that preference.
- Unsupported platform or harness capabilities must be omitted or expressed as conditional behavior.
- Concrete model names, reasoning labels, browser tools, and write routes must be detected and user-mapped before adoption; preserve role semantics when an exact choice is unavailable.
- Fixed media numbers, worker counts, and tool flags are examples or user-selected parameters, not universal requirements unless the user explicitly adopts them.
- Never use stable IDs as justification to replace locally customized text without approval.

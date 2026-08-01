# Stable Rule Catalog

Use these IDs when discussing adoption and updates. They identify behavior, not exact wording. The final user-owned `AGENTS.md` may use different prose.

| ID | Reference rules | Behavior | Applicability |
|---|---:|---|---|
| ENV-001 | 1 | Assume mainland China and Windows only when selected | Environment-specific |
| SHELL-001 | 2-4 | Detect the current shell and use its supported syntax | General; wording is shell-specific |
| SHELL-002 | 7 | Quote command paths, especially paths with spaces or non-ASCII characters | General |
| NET-001 | 5-6 | Use temporary mirrors and require approval for broader tool/config changes | Preference-specific |
| FILE-001 | 8-10 | Preserve encoding, BOM, line endings, structure, and existing Chinese | General |
| FILE-002 | 11-13 | Keep edits scoped and ask before destructive, uncertain, or subjective changes | General |
| COMM-001 | 14-15 | Respect language preference and protect the main context from raw noise | Preference-specific |
| SUB-001 | 16-17 | Give subagents bounded tasks and concise outputs | Requires subagent support |
| SUB-002 | 18-19 | Limit delegation depth/concurrency and close completed work | Requires subagent support |
| SUB-003 | 20 | Select subagent capability/reasoning according to user strategy | Requires exposed controls or fallback policy |
| WRITE-001 | 21 | Keep final write ownership explicit and exploration read-only by default | General |
| RES-001 | 22 | Apply the user-selected per-command worker policy only to supported tools | Tool- and preference-specific |
| RES-002 | 23-26 | Limit simultaneous heavy work, reuse compatible caches, and clean up processes | Preference-specific |
| NOTES-001 | 27 | Read applicable development memory before acting, then apply a separate write gate without creating ceremonial notes | Requires installed Skill |

## Semantic Comparison Rules

- An exact text difference is not automatically a behavioral conflict.
- A shorter local rule may already cover several reference rules.
- Environment-specific examples must not become unconditional global requirements.
- A user-selected value always overrides the reference sample for that preference.
- Unsupported platform capabilities must be omitted or expressed as conditional behavior.
- Never use stable IDs as justification to replace locally customized text without approval.

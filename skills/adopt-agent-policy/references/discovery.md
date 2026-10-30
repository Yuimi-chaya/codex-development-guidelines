# Read-Only Configuration Discovery

Use this pass after a request to install/configure the guidelines, before collecting preferences. The goal is enough verified information to recommend a configuration, not a complete machine audit. Read the selected language's bundled policy asset and existing instructions while inspecting the environment.

## Locate the effective target

- Resolve the actual Codex home from `CODEX_HOME`, falling back to `~/.codex`. Default guideline installation to its `AGENTS.md`; use a project target only when requested.
- Inspect `AGENTS.override.md` as well as `AGENTS.md`. At global scope, Codex uses the first non-empty override or ordinary file, not both. Do not write a shadowed file and claim it became effective. Preserve an existing override and propose the appropriate target or minimal resolution explicitly.
- Inspect relevant project instructions along the actual project-root-to-working-directory path. They may narrow the global guidance. Do not move project build commands, local paths, or one repository's conventions into user-wide defaults.
- Inspect target existence, content, language, encoding/BOM, line endings, permissions, size, and hash. Read applicable recovery notes. In a Git target, check status, branch, HEAD, and task-scoped recovery; do not include unrelated changes.
- Inspect the applicable instruction-loading budget, including `project_doc_max_bytes` where relevant. Account for the contributing instruction chain after overrides and the installed version's loading rules, not just the target file. Measure the proposed merged text in the loader's byte units, including separators where applicable; characters and tokens are not file bytes. Check before preview and after editing. If the effective limit or chain is unavailable, disclose that load completeness is unverified.
- Prefer the existing target language; for a new file, propose the user's conversation language unless requested otherwise. Show scope/path/language as a recommendation rather than spending a turn reconfirming them.

Codex instruction discovery and precedence are documented in [Custom instructions with AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md), checked October 31, 2026. Recheck official guidance when the installed version or configuration differs. User-level and project instruction files configure behavior; they do not expose tools or change model/provider settings.

## Inspect relevant settings without disclosing secrets

Use the current host's structured configuration/status and model-inventory tools when available. Check the installed Codex version with an available supported command if useful. Do not assume the CLI and desktop app are the same version or use identical settings.

Where file inspection is necessary, read only relevant configuration files in the resolved Codex home and applicable project scope. Extract a small allowlist through an existing TOML parser or a bounded targeted read: selected model/provider/profile, reasoning controls, instruction discovery settings and byte limits, relevant agent definitions, and proactive-question feature state. Resolve applicable overrides where observable; otherwise label effective state unknown. File presence is not proof that the current session loaded its values.

Never dump an entire configuration file or environment. Do not open authentication stores, credential files, session transcripts, private prompts, unrelated MCP settings, or browser profiles. Do not print/search keys, bearer values, private endpoints, or nonpublic deployment identifiers. Keep local paths needed to identify the target in the local proposal; keep secrets and unnecessary machine details out of public research and saved records.

## Inspect the working environment

| Area | Useful observations | Recommendation boundary |
|---|---|---|
| Platform and shell | OS, active shell/version, terminal host if known, relevant encoding behavior | Do not confuse the terminal with its shell or impose the maintainer's platform |
| Tools and Git | Availability/version of relevant installed tools; repository state only where applicable | Recommend a useful missing tool, never auto-install, initialize Git, or change global identity |
| Permissions and resources | Exposed write/network/tool limits and task-relevant CPU/memory facts | Capacity is not consent to high concurrency; no unrelated hardware/network survey |
| Interaction | Available question/assistance tools, actual mode/input limits, observable feature state | A config key does not prove session tool exposure or notification delivery |
| Models and agents | Exact exposed IDs/providers, reasoning choices, per-agent controls, actual visual/tool/session access | Configured, cached, public, and currently selectable are different evidence levels |

Use shell-appropriate, read-only commands. For example, PowerShell can inspect `$PSVersionTable` and use `Get-Command` for an installed tool; an available Git can provide `--version` and repository status. Do not invent a model-enumeration command, install a parser, or launch an inference call just to inspect settings. An inaccessible inventory stays unknown.

## Research before asking the user to choose

For the exposed public model identities, follow [model-selection.md](model-selection.md). Check official release/model/capability documentation and the actual provider's public pricing where available. Cover relevant candidates, grouping aliases with a verified common identity; avoid an exhaustive market survey. Prepare a short role-based recommendation with sources/check date and explicit missing release, price, or speed data.

If a role mapping is already explicit and valid, retain it; check facts that could invalidate it without turning research into a replacement vote. If the user requests a specific model, preserve that exact choice in the research. Do not substitute a newer model or use a public listing as proof of account access.

If tools, documentation, or networking are unavailable, complete other checks, report the limitation once, and propose retaining existing choices or a clearly conditional fallback. Stop a blocked discovery route rather than repeatedly switching tools. Never fabricate evidence, pay for benchmarks, or make installation depend on learning an unpublished price.

## Prepare one recommendation

Separate observed facts, reused choices, proposed defaults, and unknowns. Present only actionable findings. Suggest a complete baseline configuration; do not ask the user which catalog entries they want.

The normal remaining choices concern model/delegation strategy, proactive interaction, resource/installation authority, and genuine conflicts with existing rules. Combine related decisions, explain the recommended option and keep-current alternative, and leave optional numeric limits unset with a visible conservative fallback when appropriate. If a necessary target or permission ambiguity blocked inspection, ask only that blocking question, then resume the pass.

If the proposed merged chain exceeds its verified loading budget, present a concrete remedy: deduplicate equivalent rules, propose a smaller complete policy retaining necessary safeguards, or request a specifically scoped limit/configuration change. Do not silently truncate, delete unrelated text, move scope, or increase the limit. A valid file hash does not prove that every instruction will load.

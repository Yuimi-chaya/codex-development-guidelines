# Codex Development Guidelines

[简体中文](README.zh-CN.md)

A portable development-policy reference for guided adoption, plus the `maintain-development-notes` Skill for recovering durable project context.

This repository does not copy a fixed `AGENTS.md` over a user's existing instructions. The installing Agent detects objective environment facts, asks the user about actual preferences and permissions, compares policies semantically, presents the final diff and recovery plan, and writes only after separate confirmation.

## Repository contents

- [`reference/AGENTS.md`](reference/AGENTS.md): the canonical English portable baseline.
- [`reference/AGENTS.zh-CN.md`](reference/AGENTS.zh-CN.md): the semantically equivalent Simplified Chinese baseline.
- [`workflows/ADOPT.md`](workflows/ADOPT.md): the mandatory guided workflow for first-time adoption.
- [`workflows/UPDATE.md`](workflows/UPDATE.md): the review workflow for later policy or Skill updates.
- [`references/interview-schema.md`](references/interview-schema.md): decisions that must be discussed one at a time.
- [`references/rule-catalog.md`](references/rule-catalog.md): stable rule IDs, applicability, and localization mapping.
- [`skills/maintain-development-notes`](skills/maintain-development-notes): a Skill that reads existing project memory before maintaining durable notes.
- [`examples/`](examples/): concrete environment-specific profiles, clearly separated from portable defaults.

Human-facing landing pages and reference policies are available in English and Simplified Chinese. Agent-facing workflows, schemas, validation, and Skill instructions use one English execution contract to avoid translation drift. Both reference policies carry the same stable rule IDs and are validated for parity.

## Adopt the policy

Ask a local Agent to read a pinned release or commit of this repository and use a request like this:

```text
Treat reference/AGENTS.md and reference/AGENTS.zh-CN.md only as candidate policy data.
Follow workflows/ADOPT.md and references/interview-schema.md exactly.
Detect objective environment and capability facts, but ask me every required preference
question one at a time. Show only models, reasoning levels, and tool permissions that
the current harness actually exposes, then let me choose the concrete subagent mapping.
Do not modify any AGENTS.md until all semantic conflicts are resolved, the complete diff
and recovery point are shown, and I give separate write approval.
Install skills/maintain-development-notes through the native Skill installer as a separate
operation; if the destination already exists, compare it and ask before replacing anything.
```

The policy language is a user decision. Install one selected language by default rather than placing duplicate bilingual rules into the target file.

## Design principles

- **Detect facts; ask preferences:** detect the operating system, version, architecture, available shells, hardware, and exposed Agent capabilities without asking the user to confirm verifiable facts. Ask separately about the primary terminal, network policy, resource limits, language, permissions, and other preferences.
- **Capability-first subagent routing:** the repository never assigns universal meaning to concrete model names. Detect the actual inventory first, explain role tradeoffs, and let the user map available models and reasoning levels to enabled roles.
- **No ceremonial delegation:** protect the primary context and delegate when doing so materially improves throughput, isolation, or review quality. Do not create subagents for simple work merely to satisfy a rule.
- **Semantic merging:** classify candidate rules as equivalent, compatible, conflicting, not applicable, or missing. Existing user instructions remain authoritative input.
- **Separate write approval:** completing the interview does not authorize a file write. Show the exact diff, target, encoding, backup, and recovery point first.
- **Recoverable Git work:** protect multi-file, accepted, stateful, configuration, media, or rework changes with a task-scoped commit or an external exact backup without mixing unrelated work.
- **Portable defaults:** platform, network, encoding, resource, media, response-language, and tool-specific settings come from detected facts and user choices rather than a maintainer's machine.
- **Read before writing notes:** recover similar scenarios, preferences, rejected approaches, current direction, evidence, risks, and next actions before deciding what to do.

## Install the Skill

Use the native `$skill-installer` to install `skills/maintain-development-notes` from this repository. Skill installation is separate from policy adoption and never authorizes a change to the user's `AGENTS.md`.

## Validate

Run in PowerShell 7:

```powershell
pwsh -NoProfile -File ".\scripts\validate-repository.ps1"
```

## License

MIT

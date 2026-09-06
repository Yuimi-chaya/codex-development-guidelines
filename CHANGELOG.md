# Changelog

## Unreleased

- Separate runtime guidance, modular rationale, and first-adoption configuration. Ordinary threads and read-only reviews do not start the adoption interview.
- Add the independently installable `adopt-agent-policy` Skill, with bundled adoption/update workflows, a reusable question bank, and an optional non-authoritative provenance record.
- Reuse explicit preferences rather than asking them again. Quick/standard/full describe interview depth, not weaker or stronger safety profiles.
- Add dedicated browser-routing, environment-resistance, and verification rules while retaining existing stable IDs and the default one-directed-retry boundary.
- Keep direct-browser fallback and new installations within actual authorization; unavailable subagents or a user-required method do not grant extra permissions.
- Expand bilingual README guidance and six rationale modules with boundaries, examples, transfer/process costs, recovery completeness, and adoption procedures.
- Keep generated instructions self-contained; persistent choices belong in effective instructions, not only in an optional profile. Update note-reading guidance to honor adopted cadence without removing the read-before-act gate.
- Replace exact paragraph-count/phrase validation with catalog/reference relations, local-link and isolated Skill checks, and focused validator regression tests. Keep behavioral scenario review separate from static validation.
- Detect the operating system, version, architecture, and related platform facts automatically instead of asking installers to confirm them.
- Keep primary-terminal and network/mirror policy as explicit user decisions.
- Make the public entry point English-first with a maintained Simplified Chinese companion and a bilingual reference-policy pair.
- Remove provider-specific model names and fixed media/resource numbers from the portable baseline; let the installer map verified capabilities and user-selected budgets.
- Replace mandatory numeric delegation thresholds with a task-sensitive, user-selected delegation policy.

## 0.2.0 - 2026-08-10

- Synchronize the reference policy with the current 15-rule `AGENTS.md`.
- Add per-turn preflight and note-reading decisions, Git recovery checkpoints and rollback safety, capability-aware subagent escalation/routing/retry policies, and visual review transfer budgets.
- Extend adoption and update workflows with Git state inspection, recovery-point planning, capability fallbacks, and media constraints.
- Strengthen cross-file validation so outdated catalogs, interviews, workflows, or reference blocks cannot silently pass.
- Require the development-note Skill to re-read current instructions and recovery notes at the start of every project-work turn.

## 0.1.1 - 2026-08-01

- Split development-note behavior into independent read and write gates.
- Require reading relevant project memory before diagnosis, planning, solution selection, implementation, resumption, or direction changes.
- Require targeted recovery of similar scenarios, user preferences, rejected approaches, overall direction, authoritative state, evidence, risks, and next actions.
- Add validation coverage to prevent regressions to write-only behavior.

## 0.1.0 - 2026-07-16

- Add the reference `AGENTS.md` policy.
- Add guided adoption and update workflows with mandatory user interviews.
- Add the `maintain-development-notes` Skill.
- Add repository validation and CI.

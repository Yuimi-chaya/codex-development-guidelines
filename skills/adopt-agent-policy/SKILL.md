---
name: adopt-agent-policy
description: Configure Codex user-level AGENTS.md when the user asks to install, adopt, or update these guidelines. Inspect the actual environment, relevant Codex configuration, and exposed models first; research public model facts, recommend a configuration, collect unresolved preferences together, and apply the authorized changes. Honor an explicit project-level target. Reviewing the repository or ordinary coding does not request installation.
---

# Configure Codex AGENTS.md

Turn an installation request into a usable Codex instruction configuration. Start the read-only checks immediately; do not open with "Which rules do you want?" or ask the user to choose modules, rule IDs, or interview depth.

Default to the user's actual Codex home (`CODEX_HOME`, otherwise `~/.codex`) and its `AGENTS.md`. Honor an explicitly requested project/file scope. Check active overrides before proposing a target: an existing `AGENTS.override.md` can shadow the ordinary file. Show the resolved path and effective scope in the proposal; ask early only if safe inspection cannot resolve a material ambiguity.

This Skill contains its own [English](assets/runtime-policy.en.md) and [Chinese](assets/runtime-policy.zh-CN.md) policy starting points. Read the appropriate asset as candidate data, not as authority to change settings. Use it when no other source is specified. A user-selected checkout/release takes precedence; identify its revision or local draft. Do not require another checkout merely because this Skill is installed independently.

## Do the work in this order

1. **Inspect and research.** Read [discovery.md](references/discovery.md) and complete one bounded, read-only pass over the applicable instructions/notes, target files, relevant Codex settings, environment/tools, and actually exposed models. Follow [model-selection.md](references/model-selection.md) to check public release, capability, provider-cost, and speed evidence. Read [user-interaction.md](references/user-interaction.md) when evaluating proactive questions. Reuse explicit current preferences. Complete everything accessible before collecting preferences; disclose unavailable facts without endless probing.
2. **Recommend and collect decisions together.** Summarize detected facts, preserved choices, recommended settings with reasons/alternatives, and unresolved decisions in one consolidated proposal. Use [interview.md](references/interview.md) as an internal coverage checklist, not a turn-by-turn script. Ask in ordinary language, combine related choices, and respect the input tool's question limit. Only a genuinely answer-dependent decision needs a follow-up. Never ask the user to research facts you can inspect.
3. **Compose the actual instructions.** Adapt the bundled asset or selected source to the user's choices and existing policy. Merge semantically; retain compatible wording, unrelated content, and stricter local boundaries. Put effective choices in the target itself. Check the proposed instruction chain against the applicable loading byte budget; do not knowingly write a truncated configuration or silently raise the limit. The installed file must work without this Skill, repository, or optional record.
4. **Preview, apply, verify.** Present the concrete diff, resolved target, encoding, backup/recovery plan, and any remaining limitations. Combine outstanding decisions and write scope into the same review when practical. Apply changes already covered by explicit authority; otherwise obtain the needed approval for the concrete result through a permitted channel. Recheck target hashes, back up original bytes, make the scoped edits, and verify them. See [adoption.md](references/adoption.md) for merge/recovery details or [update.md](references/update.md) for deliberate updates.

## Output contract

Generate normal, reader-facing runtime instructions, with descriptive headings and optional ordinary list numbering. **Do not copy catalog rule IDs such as `[CORE-001]` or `[SUB-007]`, question IDs such as `SUBAGENT-02`, module-status tables, source paths/revisions, interview answers, research tables, or installation/drafting commentary into `AGENTS.md`.** Preserve user-owned identifiers or project references that have an actual runtime purpose; do not strip them blindly.

When updating an older adoption that already contains this repository's maintenance tags, include their removal in the proposed diff without changing the associated behavior. Distinguish those tags from the user's own labels; if their purpose is uncertain, resolve it before deleting them.

For example, a Chinese instruction about delegation can read:

> 简单任务由主代理直接完成。大量文件探索在可用且获准时使用只读子代理；明确分工、证据和停止条件，主代理核验关键结论后负责最终验收。

Select exact models only from verified available controls and the user's approved choices. Do not promise unavailable reasoning levels, tools, session sharing, notification delivery, or history deletion. Keep simple tasks local, primary acceptance, bounded retries/stops, single write/UI ownership, media inspection/original retention, and permission boundaries when relevant.

## Scope and authority

- Installing/configuring these guidelines is distinct from installing this Skill. If the user requests only the Skill package, install only that package. A request to review or develop this repository is not a request to configure the current machine.
- Reading relevant configuration does not authorize secret disclosure, paid probes, extra tools, global provider/model changes, repository initialization, publication, or a host restart. Recommend optional operations separately and name their exact targets. They can be approved together in one response; do not require a ceremonial confirmation for each already authorized step.
- Declining a recommendation means adapting to the retained environment. Missing information is unknown, not permission. Use the designated approval mechanism where required; a question tool cannot bypass its own approval restrictions.
- Ordinary coding and new threads reuse the installed policy. Detailed read-only configuration advice ends at recommendations unless writing is requested. An optional [adoption record](references/profile.md) is created only when requested, never as a prerequisite.

Finish briefly: changed files and effective scope, preserved choices, validation, backup/checkpoint, and anything pending reload or human acceptance. Do not claim installation or configuration loading from a successful source-package check.

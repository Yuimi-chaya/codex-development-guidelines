# Proactive Questions and Assistance

Read this when the user is adopting or deliberately changing runtime interaction preferences, including whether to enable an optional question tool. Ordinary tasks reuse that choice. Do not launch a configuration interview merely because a task needs one clarification.

## Discover, explain, then ask

Check which question or reminder tools the current environment exposes, their supported modes and input formats, and any restrictions on approval or notification use. Distinguish a configuration key existing from the tool actually being available in this session. Do not inspect unrelated private settings.

Explain the tradeoff: timely questions can prevent a long task from drifting and make requests for human help visible, but unnecessary prompts interrupt other work. Offer enabling necessary proactive questions/assistance, retaining the current behavior, or deferring the decision. Reuse a stated preference; record unsupported capabilities as such rather than promising them.

Resolve `COMMUNICATION-02` from [interview.md](interview.md). Optional enablement is not consent to write configuration, and declining it does not authorize guessing important facts or bypassing approvals. If declined or unsupported, preserve clear necessary questions through an allowed channel and hold dependent work pending.

## Runtime behavior to adopt

- Ask a specific short question only when the missing answer materially affects the task and cannot reasonably be inferred from available context. Offer useful alternatives where the tool supports them.
- For human assistance, state the required action and why it is needed. Do not assume the user is watching commentary or has performed an action because a prompt was sent.
- Continue independent work while waiting if the tool and runtime allow it; wait for the answer or verified action before dependent steps. A timeout or unanswered prompt is not approval.
- Respect tool restrictions, including mode and approval boundaries. Use the designated mechanism for permissions; do not repurpose clarification as approval when prohibited.
- Avoid empty calls, repetitive requests for the same unresolved action, and dialogs for progress, apologies, or promises to stop misuse. Correct misuse directly instead of creating another prompt about it.

Put approved behavior in the effective instructions, including its fallback, not only in a provenance record. Notification delivery depends on the host, operating system, and user settings; do not guarantee a system notification or that the user saw it. A tool that supports text questions does not automatically support file upload or screenshot input.

## Codex configuration example

For a Codex version that supports the feature, the proposed configuration is:

```toml
[features]
default_mode_request_user_input = true
```

If `[features]` already exists, add or update its single key; do not duplicate the table or append a conflicting value. The feature enables the request tool in Default mode in supported versions; it does not make every tool call appropriate or override higher-priority instructions.

Before recommending a write, verify the installed version's support, current effective value, target configuration scope, and existing user choice. Show the minimal diff and explain the benefit, interruption cost, backup, rollback, and any restart requirement. Only apply the specifically authorized configuration change. Policy adoption, recommendation, and actual enablement are separate outcomes.

The referenced post describes an experimental opt-in and restarting the Codex App. Save or finish active work before a user-approved restart; do not restart automatically or claim an already-running task has acquired the tool. Verify tool availability in an appropriate new/resumed session after the host reloads configuration. If unsupported, leave configuration intact and report the fallback.

## Evidence and limits

Checked on October 12, 2026:

- [Maintainer's usage note](https://x.com/heyiwei233/status/2109408871941034316): the enablement example, assistance scenarios, and empty/repetitive-call observations. These are reported usage experiences, not model-wide measured defect rates.
- [Official Codex configuration schema](https://developers.openai.com/codex/config-schema.json): `features.default_mode_request_user_input` accepts a boolean. This establishes the key's schema presence, not availability in every installed version, default enablement, or notification delivery.
- [Official configuration reference](https://developers.openai.com/codex/config-reference): configuration scopes and feature context. Recheck documentation and installed support when proposing an actual change; do not freeze time-sensitive assumptions in runtime rules.

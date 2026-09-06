# Delegation and Tools

Scope: protecting the primary thread without outsourcing judgment. Related IDs: `WRITE-001`, `SUB-001`, `SUB-002`, `SUB-003`, `SUB-005`, `SUB-006`, `SUB-007`, `BROWSER-001`.

## Why

In a tiered setup, the primary model may be more expensive and slower to begin or stream responses than an execution model. Repeated browser observation, clicks, DOM snapshots, and screenshots can occupy that primary thread with low-level interaction. Persistent tool history may also create storage and responsiveness pressure, depending on the harness.

This is a reason to route work deliberately, not a claim that any named model is always faster or cheaper. Delegation adds coordination cost and may not isolate all persisted artifacts. Measure what the harness exposes; do not promise savings from model names alone.

Interactive execution also tests whether a model can connect the user's intent, visual state, tool parameters, and the consequences of an action. A low per-call price is not useful if the executor repeatedly misidentifies controls. Conversely, a stronger model is not automatically the best choice for a stable repetitive operation. Use evidence for the actual task/tool combination, not a universal "cheap clicks" or "strong model only" rule.

## Boundary

Prefer a supported, authorized structured tool, API, or CLI for equivalent work. Do not bypass a required UI test, permission boundary, or tool instruction through a different interface. A simple text lookup is not automatically a browser session, and a simple code edit does not need delegation.

Separate responsibility from model and context. The primary Agent owns final acceptance; an executor may use the same or a stronger model. High-interaction UI work normally goes to an isolated authorized execution role only if it has the necessary visual input, tools, permissions, and session access. The same model name does not prove equivalent execution capabilities.

No suitable isolation or excessive handoff loss: choose an allowed structured route, use a previously authorized bounded direct-use fallback, or ask for one specific exception. Short work may be done directly under applicable authority when delegation adds no material benefit. Respect explicit browser bans; neither unavailable subagents nor model superiority overrides them.

## Four separate decisions

| Decision | Evidence to consider |
|---|---|
| Interaction method | Required outcome, supported structured access, visual inspection needs, permitted action batching |
| Execution model | Relevant visual/tool competence, reliability, reasoning controls, provider cost and measured latency |
| Execution context | Expected output volume and duration, delegation overhead, tool/session parity, handoff loss |
| Resource policy | Remaining task budget, useful progress, media fidelity, request size, retention controls |

Optimize the complete task subject to capability, authorization, risk, and user preferences. Compare model response time, tool/page waits, transport, number of rounds, coordination, recovery, and verification. Time to first token and output throughput are separate measurements; neither is complete-task latency. Do not infer pricing, latency, or success rate from model size or release order.

Make a proportionate routing decision at task/stage entry and revisit it only when meaningful evidence, progress, risk, or capability changes. This is not a requirement to calculate a score, poll telemetry, interview the user, or rerank models before every click. Existing approved mappings and useful task observations should carry most ordinary decisions.

Illustrative arithmetic only: 30 rounds at 3 seconds cost 90 seconds of round time; 8 at 8 seconds cost 64. If both need 8 rounds, the faster executor wins that component. These are not benchmark results and omit other costs. Unknown estimates should remain unknown, not be presented as measured savings. Avoid a synthetic score with weights the user never selected.

| Task signal | Suggested route within approved choices |
|---|---|
| Stable, repetitive, low-ambiguity operation | Proven adequate fast executor or authorized deterministic automation |
| Unfamiliar interface, visual ambiguity, complex state | Capable interactive executor directly; no mandatory weak-model trial |
| Long workflow or large tool returns | Isolated executor with suitable capability, possibly a premium model |
| Very short operation with costly handoff | Bounded primary execution if already permitted |
| Required session/tools unavailable outside primary | Allowed alternative or scoped direct-use exception; do not simulate delegation |

## Keep the interaction loop with its owner

Delegate a bounded stage such as "apply these filters, export the report, verify the downloaded file; stop before any purchase or account change." Let that executor observe, decide, act, and check progress within the contract. Do not make the primary Agent review each screenshot and translate each click for a cheaper executor.

If a difficult stage needs stronger execution, transfer that stage with the goal, verified current page/state, artifact identities, pending actions, permission limits, and remaining budget. A plan produced earlier does not replace observing current state. Batch only actions the tool supports and whose intermediate states do not require a new decision; do not blindly replay a click sequence through unexpected UI changes.

Only one operator may control a mutable session at a time. Stop the previous operator before handing off. Reconcile uncertain side effects before repeating an action. Separate independent sessions may run concurrently within the user's concurrency policy, provided they do not mutate the same underlying resource.

## Delegation contract

Specify objective, permitted reads/actions, exact write scope if any, output size, evidence needed, progress boundary, and stopping condition. Add relevant time, step, or cost limits using available measurements; do not invent unavailable price telemetry. Use a conservative bounded stage when no numeric budget is configured. Exceeding it calls for reassessment, not an automatic new allowance.

A useful browser deliverable is a conclusion, source/page identity, decisive observed state, relevant artifact paths, uncertainty, and remaining budget, not an entire interaction transcript. Verify that the recipient can access referenced files; otherwise transfer the necessary optimized evidence through an allowed channel. Never hand off credentials or an entire private session history as routine context.

The primary Agent remains responsible for decisions and acceptance even when writes are delegated. Check decisive file locations, source excerpts, test outcomes, or artifact identity. Independent verification should target the claim's risk; it need not replay every click or download every screenshot.

## Stop and take over

Default: at most one directed retry after inadequate delivery. If the premise is wrong or improvement unlikely, take over immediately. Agree on a task-appropriate progress boundary; use bounded waits rather than rapid unchanged polling. Delay alone is not proof of incompetence.

Repeatedly misidentified controls, unchanged state, deviations from the goal, or high cost without useful progress are reassessment signals. Diagnose the cause before choosing the next action:

| Observed blocker | Response |
|---|---|
| Model cannot understand a sufficiently observed interface | End the failed delegation; use an approved more capable executor if viable |
| Tool cannot expose the necessary state or action | Change to a supported authorized observation/action method |
| Page, dependency, authentication, or environment is blocked | Resolve the actual condition or ask for necessary authority |
| Budget exhausted, action risk exceeds permission, or outcome uncertain | Stop; report state and obtain the missing decision before continuing |

Taking over means taking responsibility for the next decision, not necessarily using the primary browser. A new agent/model does not reset the failed stage's retry count or resource budget. A justified authorized reroute is a changed approach, not permission to start an indefinite ladder of models.

Example: a reviewer claims the failing test is fixed but supplies no relevant diff and discusses another package. Ask once for the exact file and reproduction, or take over immediately if the wrong scope is clear. Do not spend several turns tutoring the same agent or start another agent to continue the same unbounded loop.

## Configuration

Adoption or requested detailed configuration consultation may research actual model/reasoning controls for throughput/discovery, ordinary implementation/verification, advanced interactive execution, and high-risk architecture/review. See the bundled [model selection procedure](../../skills/adopt-agent-policy/references/model-selection.md). The user selects the mapping and fallback, including direct-use exceptions and budget preferences. Reuse them in future tasks; recheck affected availability when it matters, not the entire market at every thread start.

Isolation primarily limits what flows back to the primary context. It does not establish request-size reduction, history deletion, or total cost savings. Apply [media](media.md) and [resource](validation-and-resources.md) safeguards independently.

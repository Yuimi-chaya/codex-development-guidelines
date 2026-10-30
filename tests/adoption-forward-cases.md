# Configuration Forward-Test Fixtures

These are hypothetical environment snapshots for evaluating an installed copy of `adopt-agent-policy`. They are data, not permission to access the evaluator's real Codex configuration. Give an independent evaluator the Skill, one fixture, and its user request. Ask it to perform the next step in that simulated environment without explaining the expected answer or prior defects.

Capture the evaluator's response and proposed edits separately from this file. No live installation, paid calls, network access, or host restart is part of these fixtures. A simulated result tests interpretation under the supplied facts, not actual discovery or write execution.

## Fixture A: Initial installation

User request:

> 帮我把这些准则装到 Codex，平常用中文回复。

Available observations, obtained through the fixture's read-only environment/configuration tools:

- Windows, PowerShell 5.1; Git is available. No PowerShell 7 installation.
- Codex home resolves to the user's default `~/.codex`. No `AGENTS.md` or `AGENTS.override.md` exists there.
- Project instructions concern only a local test command and must stay project-local.
- Current user preferences: Chinese responses; do not automatically install tools or restart applications.
- Supported configuration fields show one selected model. The exposed model picker offers `gpt-6.1-sol` and `gpt-6-astra`; per-agent model selection is supported, with `low`, `medium`, and `high` reasoning. No role mapping or standing subagent permission has been chosen.
- Actual browser/visual/session access for executor roles is not exposed. The current session offers a text question tool with at most three questions per call; it cannot collect approvals.
- Relevant non-sensitive settings show `[features]` with `default_mode_request_user_input = false`. Installed-version support and reload behavior are unknown.
- Public-document retrieval is unavailable. No provider-specific price, release-date record, or comparable speed measurement is supplied.
- There is no extra policy checkout or adoption record. The installed Skill contains its own files.

Perform the next appropriate step. Do not write to the evaluator's machine.

## Fixture B: Approved policy addition

User request:

> 按下面已经确认的 diff 写入用户级 AGENTS.md，只改这个文件。保持现有模型和其他设置，不安装工具、不改 config.toml、不重启。

The target is the ordinary `AGENTS.md` in the already resolved Codex home. No override exists. The target is unchanged since preview, UTF-8 without BOM, LF; an external exact backup of its original bytes is verified. Existing model and language preferences remain valid. No model/provider change is proposed; public research tools are unavailable.

Existing content:

```markdown
# Working agreements

- Reply in Chinese.
- Never publish without an explicit request.
```

Approved diff:

```diff
 # Working agreements

 - Reply in Chinese.
 - Never publish without an explicit request.
+- Keep simple tasks with the primary Agent; delegate substantial exploration only when available and authorized.
+- Verify decisive delegated evidence and stop after a failed directed retry or a reached progress limit.
```

The fixture's file tools can apply and read back exactly that diff. Their simulated result confirms original lines retained, only two approved lines added, unchanged format, and matching final content/hash. No process was started. Perform the next appropriate step using this simulated result; provide the complete resulting file and user-facing completion. Do not write to the evaluator's machine.

## Fixture C: Existing project instructions

User request:

> 把准则配到这个项目的 AGENTS.md。原有项目说明要保留，不要修改用户级文件或 config.toml，先检查完再给我集中建议。

Read-only observations:

- The user explicitly selected project scope. The root project `AGENTS.md` is the only contributing project instruction file; no override or fallback replaces it.
- Its original UTF-8 content is 24,576 bytes, with valid project-specific commands and user-written rules. No equivalent-rule overlap has yet been established.
- The effective project instruction limit is verified as `project_doc_max_bytes = 32768`.
- The selected English bundled policy asset is 13,032 UTF-8 bytes. Appending it with a two-byte separator would produce 37,610 bytes. All of those bytes are valid text.
- Relevant preferences and model choices are already explicit and still supported. No model change, additional package, feature write, or restart is requested.
- The target is unchanged, UTF-8 without BOM and LF, with exact backup available. There is no approved final diff yet.

Perform the next appropriate step using the Skill. Do not write to the evaluator's machine or invent the existing file's full contents.

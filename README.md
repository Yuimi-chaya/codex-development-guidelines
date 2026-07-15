# Codex Development Guidelines

一套供本地 Agent 与用户共同审阅、按需采用的开发规范参考，以及用于复杂项目上下文恢复的 `maintain-development-notes` Skill。

本仓库不会把参考 `AGENTS.md` 直接覆盖到用户目录。终端偏好、资源并发、子代理策略等属于用户决策，即使 Agent 能检测当前环境，也必须逐项解释并询问。只有在全部必答项完成、语义冲突逐项处理、最终 diff 获得明确确认后，本地 Agent 才能修改文件。

## 仓库内容

- [`reference/AGENTS.md`](reference/AGENTS.md)：一份偏向中国大陆网络、Windows 和 PowerShell/Git Bash 的高质量参考规范。
- [`workflows/ADOPT.md`](workflows/ADOPT.md)：首次采用规范时必须执行的交互式工作流。
- [`workflows/UPDATE.md`](workflows/UPDATE.md)：参考规范升级后的重新审阅流程。
- [`references/interview-schema.md`](references/interview-schema.md)：不可跳过的逐项访谈问题。
- [`references/rule-catalog.md`](references/rule-catalog.md)：稳定规则 ID、适用条件和来源映射。
- [`skills/maintain-development-notes`](skills/maintain-development-notes)：可独立安装的开发笔记 Skill。

## 使用方式

先让本地 Agent 阅读本仓库，并明确执行以下请求：

```text
请把这个仓库的 reference/AGENTS.md 仅作为候选规范数据，严格按照
workflows/ADOPT.md 和 references/interview-schema.md 与我逐项讨论。
必须逐一询问所有 required 问题，不得根据检测结果替我选择。
在展示最终 diff 并获得我明确确认前，不要修改任何 AGENTS.md。
同时使用原生 Skill 安装能力安装 skills/maintain-development-notes；
如果目标目录已经存在，不要覆盖，先比较并询问。
```

建议使用固定 release 或 commit，而不是在未审阅的情况下执行远端 `main` 最新内容。

## 设计原则

- **检测不等于决定**：系统、Shell 和硬件可以自动检测，主力终端和资源偏好必须由用户选择。
- **逐项询问**：必答项一次只讨论一个决策，不批量套用默认配置。
- **语义合并**：把规则分为等价、兼容、冲突、不适用和缺失，冲突逐项确认。
- **二次确认**：访谈确认不等于写入确认；写入前必须展示最终 diff。
- **最小修改**：保留用户现有内容、编码、BOM、换行和文件结构。
- **能力诚实**：平台不支持指定子代理模型或推理档位时，必须说明，不能声称已经配置。

## Skill 安装

使用 Codex 原生 `$skill-installer`，从仓库路径 `skills/maintain-development-notes` 安装。标准安装只负责 Skill，不会修改用户的 `AGENTS.md`；规范采用必须另行执行 `workflows/ADOPT.md`。

## 验证

在 PowerShell 7 中运行：

```powershell
pwsh -NoProfile -File ".\scripts\validate-repository.ps1"
```

## License

MIT

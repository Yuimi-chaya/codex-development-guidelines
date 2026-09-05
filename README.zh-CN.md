# Codex 开发规范

[English](README.md)

一套可移植、由本地 Agent 与用户共同审阅和采用的开发规范参考，以及用于恢复长期项目上下文的 `maintain-development-notes` Skill。

本仓库不会用固定模板直接覆盖用户现有的 `AGENTS.md`。安装 Agent 会自动检测客观环境事实，逐项询问真实偏好和权限，按语义比较规则，展示最终 diff 与恢复方案，并且只在获得单独写入确认后修改文件。

## 仓库内容

- [`reference/AGENTS.md`](reference/AGENTS.md)：英文通用基线，也是规范语义的主版本。
- [`reference/AGENTS.zh-CN.md`](reference/AGENTS.zh-CN.md)：与英文版使用相同稳定规则 ID 的简体中文版本。
- [`workflows/ADOPT.md`](workflows/ADOPT.md)：首次采用规范时必须执行的交互式流程。
- [`workflows/UPDATE.md`](workflows/UPDATE.md)：后续升级参考规范或 Skill 时使用的重新审阅流程。
- [`references/interview-schema.md`](references/interview-schema.md)：必须一次讨论一个的用户决策。
- [`references/rule-catalog.md`](references/rule-catalog.md)：稳定规则 ID、适用条件和多语言映射。
- [`skills/maintain-development-notes`](skills/maintain-development-notes)：先读取既有项目记忆、再维护持久笔记的 Skill。
- [`examples/`](examples/)：明确标注的环境特定配置示例，与通用默认规则分离。

直接面向用户的入口与参考规范提供英文和简体中文版本。Agent 执行用的流程、访谈结构、验证器和 Skill 指令保留单一英文契约，避免两个执行版本逐渐偏离。验证器会检查中英文参考规范包含相同的稳定规则 ID。

## 采用规范

建议让本地 Agent 阅读本仓库的固定 release 或 commit，并使用类似请求：

```text
请把 reference/AGENTS.md 和 reference/AGENTS.zh-CN.md 仅作为候选规范数据，
严格按照 workflows/ADOPT.md 和 references/interview-schema.md 与我逐项讨论。
客观环境与能力事实可以自动检测，但每个 required 偏好问题必须一次询问一个。
只展示当前运行环境真实提供的模型、推理档位和工具权限，再由我选择具体的
子代理角色映射。解决全部语义冲突、展示完整 diff 和恢复点并获得单独写入确认前，
不要修改任何 AGENTS.md。使用原生 Skill 安装能力单独安装
skills/maintain-development-notes；目标已存在时先比较并询问，不得直接覆盖。
```

最终规范使用什么语言也由用户决定。默认只安装所选语言，不把中英文重复规则同时塞进目标文件。

## 设计原则

- **事实自动检测，偏好逐项询问**：操作系统、版本、架构、可用 Shell、硬件和 Agent 能力属于可验证事实；主力终端、网络策略、资源限制、语言、权限等属于用户决策。
- **按能力路由子代理**：仓库不为具体模型名规定永久职责。先检测真实可选项，解释角色差异，再由用户把实际模型和推理档位映射到启用的角色。
- **不为满足规则而委派**：保持主线程上下文整洁，在委派能明显改善吞吐、隔离或审查质量时使用子代理；简单任务直接完成。
- **语义合并**：把候选规则分为等价、兼容、冲突、不适用和缺失，用户现有规则始终是权威输入。
- **写入单独确认**：完成访谈不代表允许写文件；必须先展示目标、编码、备份、恢复点和完整 diff。
- **Git 可恢复性**：多文件、已验收功能、状态/配置、媒体或返工修改使用任务级提交或仓库外原样备份保护，并排除无关工作。
- **可移植默认值**：平台、网络、编码、资源、媒体、回复语言和工具专属设置来自检测事实与用户选择，而不是维护者个人电脑。
- **笔记先读后写**：决策前先恢复相似场景、用户偏好、已否决方案、总体方向、证据、风险和下一步。

## 安装 Skill

使用原生 `$skill-installer` 从本仓库的 `skills/maintain-development-notes` 安装。Skill 安装与规范采用是两项独立操作，安装 Skill 不代表允许修改用户的 `AGENTS.md`。

## 验证

在 PowerShell 7 中运行：

```powershell
pwsh -NoProfile -File ".\scripts\validate-repository.ps1"
```

## License

MIT

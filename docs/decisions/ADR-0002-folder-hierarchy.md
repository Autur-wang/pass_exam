# ADR-0002: 文档四层分级 + 顶层入口收敛

- **Status**: accepted
- **Date**: 2026-07-26
- **Deciders**: 用户

## 背景 / Context and Problem

教学项目最早由四个文件(`README.md` / `CLAUDE.md` / `AGENTS.md` / `SOUL.md`)启动,后续又陆续追加 `RULES.md` / `FILETREE.md` / `WORKING-CONTEXT.md` / `../../docs/HARNESS.md` / `../../docs/CONTEXT_RULES.md` / `../../docs/FEATURE_INTAKE.md` / `../../workflow/ai-workflow.md` 等。新加入的 Agent(包括 Codex / Claude Code / skill)很难一眼分清"哪些是项目身份定义 / 哪些是协作规则 / 哪些是 harness 工作流 / 哪些是操作工具"。

## 评估的选项 / Considered Options

1. 全部塞在 root,文档命名靠前缀 — 难分,目录会继续膨胀。
2. 拆为 L1-L4 四层 + 项目地图文档 — 责任清晰,新文档归属一眼可定。
3. 全部沉到 `../../docs/`,root 只剩 README — 教学工作的"心跳文档"被埋没。

## 决策 / Decision Outcome

采用选项 2:

| 层 | 位置 | 责任 | 例子 |
| --- | --- | --- | --- |
| L1 项目身份 | `README.md` `SOUL.md` `map.md` `SECURITY.md` | "这个仓库是什么" | `README.md` |
| L2 协作规则 | `AGENTS.md` `CLAUDE.md` `CONTRIBUTING.md` `RULES.md` `FILETREE.md` `WORKING-CONTEXT.md` | Agent / 协作者如何接入与维护 | `AGENTS.md` |
| L3 Harness 工作流 | `../../docs/HARNESS*` `CONTEXT_RULES.md` `FEATURE_INTAKE.md` `TRACE_SPEC.md` `COURSES.md` `decisions/` | 学习任务强制流程 + 决策档 | `../../docs/HARNESS.md` |
| L4 操作层 | `../../scripts/` `../../workflow/` `harness-records/` `tasks/` | 校验脚本 / 流程 SOP / session 痕迹 | `../../scripts/verify-scaffold.ps1` |

新增文档各归各位;`../../docs/` 不再放项目身份或协作规则,root 不再放 trace / friction。
AGENTS.md 与 CLAUDE.md 内容去重,权威以 AGENTS.md 为准;CLAUDE.md 仅放人设。

## 权衡 / Consequences

- **正面**:新 Agent 加入按 L1→L2→L3→L4 顺序读 5 个文件即上手。
- **负面**:存量 `../../docs/` 中无归属的页面要逐个判别分类。
- **不可逆**:一旦定为权威的 L1/L2 文档,后续 Agent 看到不一致内容会按权威优先级处理。

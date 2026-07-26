# ADR-0001: 引入 harness 自动校验脚本

- **Status**: accepted
- **Date**: 2026-07-26
- **Deciders**: Claude / Codex / 用户

## 背景 / Context and Problem

教学项目从期末复习迁移到面试准备后,出现了多份相对路径失效的引用、两套重复的 teach 脚手架、文档里 `teach/MISSION.md` 这种抽象词散落各处。手工审计跟不上文件增长。需要把"哪些文档是过期的""哪些 path 是 broken""哪些痕迹丢失"这些事实交给自动化脚本,作为 harness 体系的强制收口。

## 评估的选项 / Considered Options

1. 不做自动化,继续手工检查 — 不可扩展,失败模式已知。
2. 一个大型复合脚本 — 维护成本高,出错时无法定位。
3. 分三类独立脚本 + 一个 verify-self 串行入口 — 单一职责、可并行扩展、退出码独立。

## 决策 / Decision Outcome

采用选项 3。在 `../../scripts/` 下建立 3 个独立校验器 + 1 个聚合入口:

- `verify-scaffold.ps1` — 每门课程 `<course>/teach/` 脚手架完整。
- `verify-paths.ps1` — markdown / ps1 中所有相对路径引用指向真实文件。
- `verify-harness.ps1` — traces / ADRs / friction / backlog 痕迹合规。
- `verify-self.ps1` — 串行调用前三者并报告。

## 权衡 / Consequences

- **正面**:任何 PR 都能在 30 秒内定位"哪个文档路径坏了";新增课程时 verify-scaffold 给出明确缺件列表。
- **负面**:路径白名单(`原始资料/` / `skills/` 等)会在新增"只读外部材料"时失效,需要更新脚本。
- **关联任务**:此 ADR 落地后,各课程脚手架的真实缺口会在 verify-self 中显现。

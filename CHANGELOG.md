# Changelog

> 本仓库的演进记录。每条按 ADR/历史影响聚合。
> 与 `docs/HARNESS_BACKLOG.md` 互为补充:CHANGELOG 是"成功变更",BACKLOG 是"待办/摩擦"。

## 2026-07-26 — Harness 化与全面改造落地

### 文档四层分级(L1-L4,ADR-0002)

L1 项目身份 / L2 协作规则 / L3 Harness / L4 操作 四层定位明确。

### harness 自动化校验(ADR-0001)

新增 `scripts/`: `verify-scaffold.ps1` / `verify-paths.ps1` / `verify-harness.ps1` / `verify-self.ps1` / `courses-stats.ps1`。

### 教脚手架统一规范(ADR-0003)

`teach/` 必备 9 件 + 3 子目录,`verify-scaffold` 校验。

### OS 双份脚手架收敛(ADR-0004)

`operating_systems/` 根目录 `MISSION.md` `NOTES.md` `GLOSSARY.md` `RESOURCES.md` 内容已并入 `teach/`,根 4 件 `git rm`。

### teach 缺件最小兜底(ADR-0006)

`learn-code` `skill开发` `多媒体` 各补 MISSION / NOTES / GLOSSARY / RESOURCES 至 verify-scaffold 5/5 PASS。

### 决策记录(ADR-0001 ~ ADR-0006)

详见 `docs/decisions/`。

### 文档修复

`FILETREE.md` `WORKING-CONTEXT.md` `SOUL.md` `CONTRIBUTING.md` `AGENTS.md` 重写为四层文档结构。
`workflow/ai-workflow.md` 内链路径修正。
多课程 `learning-records/*.md` 相对路径错位统一加 `../`。

### baseline(2026-07-26)

| 校验 | 状态 |
| --- | --- |
| `verify-scaffold.ps1` | **PASS** 5/5 |
| `verify-paths.ps1` | 4 broken(均为课程内容 backlog,tasks/ 已排除) |
| `verify-harness.ps1` | **PASS** |

## 历史(2026-06 ~ 2026-07-17)

教学项目从期末复习迁移到面试准备;各课程 teach/ 脚手架被植入。

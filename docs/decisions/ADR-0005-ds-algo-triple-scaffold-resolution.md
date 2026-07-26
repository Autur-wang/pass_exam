# ADR-0005: 数据结构与算法 三套脚手架收敛方案

- **Status**: accepted
- **Date**: 2026-07-26
- **Deciders**: 用户 / Agent

## 背景

`数据结构与算法/` 同时存在:
- **根目录脚手架**:`MISSION.md` `NOTES.md` `GLOSSARY.md` `RESOURCES.md` `SKILL.md`。
- **`teach_副本/`**:完整 teach 脚手架 + 20 个 lessons。
- **`skill/`**:独立 skill 包(`aha-algorithms` `bhargava-algorithms`),各有 `SKILL.md` `glossary.md`。

## 决策

把 `teach_副本/` rename 为 `teach/`,把 `skill/` 保留为 skill 资产。具体步骤:

1. `git mv 数据结构与算法/teach_副本 数据结构与算法/teach`。
2. `git rm` 根目录 5 件 scaffold 文件。
3. 修 `teach/` 内部路径(如有 `chapter-N` 类型占位)。
4. `skill/` 保留为 `数据结构与算法/skill/`。

## 后续任务

- [ ] 等待用户确认(本 ADR-0005 提交后挂 backlog)。

## 权衡

- **正面**:verify-scaffold 该课程从 INCOMPLETE 变 OK。
- **负面**:`teach_副本/` 中若有相对仓根的路径,rename 后失效。

# ADR-0004: 操作系统 teach 双份脚手架收敛方案

- **Status**: accepted
- **Date**: 2026-07-26
- **Deciders**: 用户 / Agent

## 背景

`operating_systems/` 根目录与 `teach/` 子目录各存在一份
`MISSION.md` `NOTES.md` `GLOSSARY.md` `RESOURCES.md`,内容大致相同,
时间戳差 1 个月:根目录版本(`ccaafe1`, 2026-06-16)包含 06-16 紧急事件;
teach/ 子目录版本(`d2691cd`, 2026-04)是初次模板填充。两份并存导致 Agent 阅读时无法单一定位,verify-paths 抓到大量 broken refs。

## 评估选项

1. 保留根,删 `teach/` 副本 — 破坏 ADR-0003。
2. 保留 teach/,删根 4 文件 — 与 ADR-0003 一致。
3. 合并两版本到 teach/,删根 4 文件 — 当前方案。

## 决策

采用选项 3。整理步骤:

1. 把 operating_systems/MISSION.md (根 7427 bytes,已 git rm) 中独有的"06-16 紧急事件"等增量内容并入
   `../../operating_systems/teach/MISSION.md`。
2. 同上处理 NOTES / GLOSSARY / RESOURCES。
3. 用 `git rm -f` 删除根目录 4 份内容文件。
4. 保留根目录的额外教学资产:`CURRICULUM.md`、`CONCEPTS-EXPLAINED.html`、
   `DIAGNOSTIC-TEST.html`、`EXAM-PREP-PLAN.md`。

## 权衡

- **正面**:teach/ 单一份真相。
- **负面**:破坏性动作(已通过 git 跟踪,可恢复)。

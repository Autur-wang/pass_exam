# ADR-0003: 课程 teach 脚手架统一规范

- **Status**: accepted
- **Date**: 2026-07-26
- **Deciders**: 用户

## 背景 / Context and Problem

历史中各课程 teach 目录存在:
- 文件缺失(`learn-code/teach/` 缺 `NOTES.md` `GLOSSARY.md`)
- 方向不一致(`operating_systems/` 双份)
- 三套并存的极端(`数据结构与算法/` 根目录 + `teach_副本/` + `skill/`)

## 决策 / Decision Outcome

每门课程的所有 teach 元数据只允许一个位置:`<course>/teach/`。

```
teach/
├── MISSION.md
├── MISSION-FORMAT.md
├── NOTES.md
├── GLOSSARY.md
├── GLOSSARY-FORMAT.md
├── RESOURCES.md
├── RESOURCES-FORMAT.md
├── LEARNING-RECORD-FORMAT.md
├── SKILL.md
├── learning-records/
├── lessons/
└── reference/
```

校验:`../../scripts/verify-scaffold.ps1`。

## 权衡

- **正面**:一处真相、auto-verifiable、未来新课程不再需要"先确认放哪里"。
- **负面**:对老仓库的破坏性改动(OS 双份、数据结构与算法 三套);整理由 HARNESS_BACKLOG 接管。

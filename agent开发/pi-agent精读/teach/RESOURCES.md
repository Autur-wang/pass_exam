# RESOURCES · Pi-Agent SDK 深度精读

> 一手来源与延伸材料。本课**主源**是冬瓜教程(已作只读快照落盘),**根源**是 pi SDK。

## 主源(grounding · 已落盘只读快照)

- **冬瓜《Pi-Agent SDK 深度教程》** —— `../原始资料/dg-ai-notes/`(clone 自 https://github.com/buchidonggua/dg-ai-notes,去 `.git` 快照)
  - TS 版 10 章:`pi-agent/docs/typescript/第1章…第10章*.md`(**本课主线依据**)
  - Python 版 10 章:`pi-agent/docs/python/`(对照参考)
  - 配图:各 `docs/*/assets/*.svg`(每章架构/流程图)
  - 在线版:https://dg-ai-notes.pages.dev · 授权:文档 CC-BY-SA-4.0 / 代码 MIT

## 根源(教程所拆的对象)

- **pi(Agent SDK 本体)** —— https://github.com/earendil-works/pi(作者 Mario Zechner;本课基于 `v0.80.2`;仓库曾从 `badlogic/pi-mono` 迁移)
- **官网** —— https://pi.dev(含 "What we didn't build" 减法哲学章节)
- **agent-loop notebook** —— `../原始资料/dg-ai-notes/pi-agent/notebooks/agent-loop.ipynb`(第 3 章 Agent Loop 的可执行实验场)

## 课程内导航

- 章节地图(脊椎):[`reference/chapter-map.html`](./reference/chapter-map.html)
- 术语口径:[`GLOSSARY.md`](./GLOSSARY.md)
- 为什么学 / 边界:[`MISSION.md`](./MISSION.md) · 教学纪律:[`NOTES.md`](./NOTES.md)

## 使用约定

- 引用代码/行号时,标注**教程口径**(如「教程 §5.1」「agent.ts:166」),不自称亲自读过 pi 源码。
- 上游快照 `原始资料/` **只读**,不修改。

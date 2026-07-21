---
name: pi-agent-sdk-deep-read
description: Pi-Agent SDK 深度精读课的索引入口——约 32 节以冬瓜《Pi-Agent SDK 深度教程》为源的 HTML 微课,按 10 章逐层拆解一个生产级 Agent SDK 的源码设计(TypeScript 轨)。
---

# Pi-Agent SDK 深度精读课

以冬瓜《Pi-Agent SDK 深度教程》(拆解 earendil-works 开源的 `pi` SDK,v0.80.2)为真实源,
生成的一套 **约 32 节微课**。体裁是**源码精读**:每节回答「是什么 / 怎么做 / 为什么这样设计」三层。

## 怎么用
- **通读**:从 [`index.html`](./index.html) 门户(Phase 4 建)或 [`reference/chapter-map.html`](./reference/chapter-map.html) 按 0001 → 0032 顺序走,每课末有上/下课导航。
- **速览**:时间有限先走**前 6 章**(0001–0020),它们是理解 Pi 运行机制的核心;第 7 章起(进阶)可按需跳读。
- **查术语**:概念口径以 [`GLOSSARY.md`](./GLOSSARY.md) 为准。
- **为什么学**:见 [`MISSION.md`](./MISSION.md);一手来源见 [`RESOURCES.md`](./RESOURCES.md);教学与写作纪律见 [`NOTES.md`](./NOTES.md)。

## 课程结构(= 教程 10 章)

| 部分 | 编号 | 章 | 主题 | 难度 |
|---|---|---|---|---|
| 一 · 全局观 | 0001–0003 | ch01 | 三重身份与减法哲学 · 四包三层架构 · 运行模式与 models.json | 入门 |
| 二 · 骨骼 | 0004–0006 | ch02 | 三层架构:类型演进 · 层边界与依赖方向 | 入门 |
| 三 · 引擎 | 0007–0010 | ch03 | **Agent Loop**:洋葱内核 · stopReason 状态机 · steering vs followup · 流式与 trace 嵌套 | ★核心 |
| 四 · 调模型 | 0011–0013 | ch04 | 模型调用:统一 API 翻译公司 · provider 格式与五步翻译 · thinking 档位 | ★核心 |
| 五 · 手脚 | 0014–0017 | ch05 | 工具系统:五步管道 · 定义/注册/校验 · 并行vs串行 · 错误防线 | ★核心 |
| 六 · 记忆 | 0018–0020 | ch06 | 消息系统:内外两层消息 · 消息管道 | ★核心 |
| 七 · 神经 | 0021–0023 | ch07 | 事件驱动:为什么要事件+同步屏障 · 事件嵌套 · text-delta 旅程 | 进阶 |
| 八 · 装窗口 | 0024–0026 | ch08 | 上下文工程:总览 · 完整管道与 CLAUDE.md 递归 · 截断策略 | 进阶 |
| 九 · 压对话 | 0027–0029 | ch09 | 上下文压缩:为什么要压 · 切点选择 · 压缩流程 | 进阶 |
| 十 · 存会话 | 0030–0032 | ch10 | 会话管理:会话树 · 条目分类 · 存储/恢复/分叉 | 进阶 |

> 各节确切标题在**设计扇出阶段**按章内容定;上表为固定编号分配。

## 与本工作区其它课的关系
`agent开发/` 板块的**第四门子课**。另三门:[`../book-course/`](../book-course/index.html)(《深入理解 AI Agent》书精读 57)、
[`../from-zero/`](../from-zero/index.html)(入门 14)、[`../lessons/`](../index.html)(四支柱进阶 18)。
与 [`../../learn-code/`](../../learn-code/teach/reference/chapter-map.html)(读 xv6 内核)是同一种**源码精读**体裁,对象从操作系统内核换成 Agent SDK。

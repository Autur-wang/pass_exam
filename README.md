# 学习工作区

这是一个面向**技术面试**的系统性复习工作区。

底层方法论是"类比教学 + 清单核查"：用直觉类比建立直觉，用清单确保不漏，用逐项验证确认真懂。这套方法论最初服务于期末考试，现在同样服务于面试准备——两者都需要"把模糊的'好像懂了'变成能独立输出"。

误判性质会导致整个工作方向错误，务必注意：
- 目标**不是**刷算法题库或背八股文，而是真正理解核心概念，能用自己的话讲清楚。
- 不要把内容一次性讲满；每节课只解决一个关键概念或一类问题。

## 当前主题

| 目录 | 主题 | 说明 |
|------|------|------|
| `面试/` | 技术面试主战场 | 涵盖工程领导力、编程、OOP、面向对象等 |
| `操作系统/` | OS 知识点 | 期末积累，面试同样高频 |
| `advanced_oop/` | 面向对象设计 | 已有教学脚手架 |
| `数据结构与算法/` | 算法与数据结构 | 已有教学脚手架 |
| `learn-code/` | 编程入门 | 已有教学脚手架 |
| `个人情况与简历/` | 简历与定位 | 进行中 |

其他目录（`agent开发/`、`skill开发/`、`docs/`、`多媒体/` 等）是辅助工具或历史积累，暂无优先级。

## 核心方法论

每节课只解决一个窄问题，节奏是：

**类比直觉 → 关键定义 → 小表格/步骤 → 自测验证**

用开放式问题或选择题考，确认答对才算过。清单持续更新，记录哪些点已验证、哪些还薄弱。

## 架构：可复用的 `teach/` 元结构

每门课各自带一套**完全同构**的教学脚手架：

| 课程目录 | 主题 |
|--------- |------|
| `面试/` | 技术面试 |
| `operating_systems/` | 操作系统 |
| `advanced_oop/` | 面向对象高级编程 |
| `learn-code/` | 零基础编程入门 |
| `数据结构与算法/` | 数据结构与算法 |

每门课的 `teach/` 包含：

- `MISSION.md` / `MISSION-FORMAT.md` — 为什么学、范围、成功标准
- `NOTES.md` — 教学偏好与工作区说明
- `GLOSSARY.md` / `GLOSSARY-FORMAT.md` — 标准术语
- `RESOURCES.md` / `RESOURCES-FORMAT.md` — 教材、课件、外部资源
- `learning-records/` + `LEARNING-RECORD-FORMAT.md` — 学习记录
- `lessons/` — 已生成的微课
- `SKILL.md` — 该课程作为技能的索引入口

理解一套即理解全部。

## 新建知识子目录的自动 Scaffold 规则

每当在根目录或任何课程目录下新建一个**知识子目录**（如 `面试/某方向/`）时，**必须同时创建完整的 `teach/` 脚手架**：

```
<new-dir>/
└── teach/
    ├── MISSION.md          # 来自 MISSION-FORMAT.md 模板
    ├── MISSION-FORMAT.md
    ├── NOTES.md
    ├── GLOSSARY.md
    ├── GLOSSARY-FORMAT.md
    ├── RESOURCES.md
    ├── RESOURCES-FORMAT.md
    ├── LEARNING-RECORD-FORMAT.md
    ├── SKILL.md             # 来自同级 SKILL.md 模板
    ├── learning-records/    # 空目录
    ├── lessons/            # 空目录
    └── reference/          # 空目录
```

格式文件（`*-FORMAT.md`）从同级已有的 `teach/` 中复制。Agent 在创建新知识子目录时必须同步完成这个 scaffold，不得遗漏。

## AI 代理入口

先读：
1. `CLAUDE.md` — 项目入口（含 Harness 上下文）
2. `AGENTS.md` — 行为规范
3. `SOUL.md` — 核心原则
4. `RULES.md` — 规则汇总
5. 当前主题的 `teach/MISSION.md`
6. 当前主题的 `teach/NOTES.md`
7. 当前主题的最新学习记录
8. 与当前任务相关的教材章节或算法速查表

完整工作流见 `workflow/ai-workflow.md` 和 `docs/HARNESS.md`。

## 目录结构

```
.
├── CLAUDE.md                    # Claude Code 主入口 + scaffold 规则
├── AGENTS.md                    # AI 行为规范
├── SOUL.md                      # 核心原则 + Agent 编排
├── RULES.md                     # 项目规则汇总
├── SECURITY.md                  # 安全策略
├── CONTRIBUTING.md               # 协作指南
├── FILETREE.md                  # 文件地图
├── WORKING-CONTEXT.md           # 当前状态与进度
├── README.md                    # 本文件
├── map.md                       # 学习路线图
│
├── docs/                        # Harness 文档体系
│   ├── HARNESS.md             # Harness 轻量版工作流
│   ├── FEATURE_INTAKE.md     # 任务分类
│   ├── CONTEXT_RULES.md       # 按阶段读文档
│   └── HARNESS_BACKLOG.md    # 摩擦记录
│
├── workflow/
│   └── ai-workflow.md          # AI 工作流与交接规则
│
├── harness-records/
│   ├── traces/                 # 会话 trace 记录
│   └── friction/              # 教学摩擦记录
│
├── skills/                      # 通用教学技能
│   ├── caveman/              # 粗暴类比风格
│   ├── grill-me/             # 追问式校验
│   └── teach-you/            # 循序教学
│
├── 面试/                        # 【主线】技术面试
│   ├── 技术面试手册/teach/   # 含 MISSION/NOTES/GLOSSARY/RESOURCES/SKILL
│   ├── 编程面试大全/teach/
│   ├── 面向对象面试问答/teach/
│   └── 工程领导力资源/teach/
│
├── operating_systems/           # 操作系统
│   ├── teach/                 # 含 MISSION/NOTES/GLOSSARY/RESOURCES/SKILL
│   ├── lessons/              # 88+ HTML 微课
│   ├── learning-records/      # 16+ 学习记录
│   ├── textbook/              # 教材原文
│   ├── operating_systems_tangxiaodan/
│   └── 1~6_章节/
│
├── advanced_oop/teach/          # 面向对象设计
├── learn-code/teach/            # 编程入门
├── 数据结构与算法/teach_副本/  # 数据结构与算法
│
├── 个人情况与简历/
├── agent开发/
├── skill开发/
├── 多媒体/
├── reference/
└── tasks/
```

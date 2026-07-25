# Working Context

> Last updated: 2026-07-17
> 当前状态：仓库定位从"期末复习"迁移到"面试准备"，harness 体系刚建立

---

## 项目定位

技术面试系统性复习工作区。底层方法论是"类比教学 + 清单核查"，最初服务于期末考试，现在服务于面试准备。

## 主题状态

| 目录 | 主题 | 状态 |
|------|------|------|
| `面试/` | 技术面试 | **主线，进行中** |
| `面试/技术面试手册/` | 技术面试手册 | 有 teach/，内容待填 |
| `面试/编程面试大全/` | 编程面试 | 有 teach/，内容待填 |
| `面试/面向对象面试问答/` | OOP 面试 | 有 teach/，内容待填 |
| `面试/工程领导力资源/` | 工程领导力 | 有 teach/，内容待填 |
| `operating_systems/` | 操作系统 | 已有积累（88+ 微课，16+ 学习记录） |
| `advanced_oop/` | 面向对象设计 | 已有 teach/ |
| `learn-code/` | 编程入门 | 已有 teach/ |
| `数据结构与算法/` | 数据结构与算法 | 有 teach_副本/ |

## 已建立的文档体系

| 文件 | 用途 |
|------|------|
| `CLAUDE.md` | Claude Code 主入口 + scaffold 规则 |
| `AGENTS.md` | AI 行为规范 |
| `SOUL.md` | 核心原则 + Agent 编排 |
| `RULES.md` | 规则汇总 + 新建子目录规范 |
| `docs/HARNESS.md` | Harness 轻量版工作流 |
| `docs/FEATURE_INTAKE.md` | 任务分类（学概念/做题/复盘） |
| `docs/CONTEXT_RULES.md` | 按阶段读文档 |
| `docs/HARNESS_BACKLOG.md` | 教学摩擦记录 |
| `harness-records/traces/` | 会话 trace 记录 |
| `FILETREE.md` | 本文件 |

## 核心方法论

每节课只解决一个窄问题，节奏：
**类比直觉 → 关键定义 → 小表格/步骤 → 自测验证**

用开放式问题或选择题考，确认答对才算过。清单持续更新。

## 当前约束

- 不以背八股文为目标，要真正理解核心概念
- 不一次塞入过多知识，每节课一个窄主题
- 解释面向面试标准答案，不是口语随意发挥
- 计算题必须给步骤，不只给答案

## 下一步（候选）

1. 填 `面试/` 下 4 个子目录的 `teach/MISSION.md`、`teach/NOTES.md`、`teach/RESOURCES.md`
2. 为 `面试/` 各子目录创建 `learning-records/`、`lessons/`、`reference/` 子目录（已建立 teach/ 但缺子目录内容）
3. 迁移 `operating_systems/` 已有的学习记录格式到面试主题
4. 同步更新根目录 CLAUDE.md 中的 AGENTS.md 引用路径

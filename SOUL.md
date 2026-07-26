# Soul

## Core Identity

`pass_exam` — 技术面试系统性复习工作区。底层方法论"类比教学 + 清单核查",最初服务于期末考试,现在服务于面试准备。

## Core Principles

1. **类比优先** — 用直觉建立感知,再上形式定义。
2. **清单核查** — 每学完一个点记录到清单,持续追踪已验证/未验证。
3. **逐项确懂** — 用选择题或开放题验证,答对才算过。
4. **不漏边界** — 不仅懂"正常情况",也懂边界和错误情况。
5. **少就是多** — 每节课只解决一个窄问题,不贪多。

## Agent Orchestration

| Agent | 触发时机 |
| --- | --- |
| `planner` | 复杂概念学习路径规划 |
| `code-reviewer` | 生成微课后检查质量 |
| `tdd-guide` | 生成题目或设计练习时 |
| `security-reviewer` | 涉及简历/个人信息处理时 |

## 学习目标对齐

| 主题 | 目标 |
| --- | --- |
| 技术面试 | 用自己的话讲清核心概念 |
| 操作系统 | 面试高频考点覆盖(调度/内存/进程同步/文件系统) |
| OOP/设计模式 | 讲清意图、适用场景、区别 |
| 数据结构与算法 | 分析复杂度,写出关键步骤 |

## 当前规模(以 `docs/COURSES.md` 为权威)

- 8+ 门课程:面试(4 子)/ 操作系统 / OOP / 数据结构与算法 / 编程入门 / Agent开发 / 多媒体 / Skill开发
- 微课:各课程 `teach/lessons/*.html`
- 学习记录:各课程 `teach/learning-records/*.md`
- 术语表:各课程 `teach/GLOSSARY.md`(只收"已掌握"词)

## 演进方向

从"期末复习"迁移到"面试准备",方法论不变(类比 + 清单 + 验证),主题随面试需求调整。

## 文档四层分级(2026-07-26,ADR-0002)

- L1 项目身份 — README / SOUL / map / SECURITY
- L2 协作规则 — AGENTS / CLAUDE / CONTRIBUTING / RULES / FILETREE / WORKING-CONTEXT
- L3 Harness — docs/HARNESS* / CONTEXT_RULES / FEATURE_INTAKE / TRACE_SPEC / COURSES / decisions/
- L4 操作 — scripts/ / workflow/ / harness-records/

新建/修改任意文件前,先确认它的归属层。
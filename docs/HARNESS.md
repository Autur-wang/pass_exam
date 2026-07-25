# Harness

> 本项目使用 Harness 工作流——人-Agent 协作的操作系统。
> 这是一个学习工作区，不是软件项目，harness 用于确保学习不漏、不偏、不跳过验证。

## Mental Model

```
------------------+
| Human intent    |
+------------------+
         |
         v
+------------------+
| Feature intake   |  ← 每个学习任务前分类
+------------------+
         |
         v
+------------------+
| Study packet    |  ← Normal/High-risk 创建学习包
+------------------+
         |
         v
+------------------+
| Agent work loop  |  ← 按 Context Rules 读文档
+------------------+
         |
         v
+------------------+
| Validation       |  ← 做题/复述/选择题验证
+------------------+
         |
         v
+------------------+
| Record trace     |  ← 记录到 harness-records/traces/
+------------------+
         |
         v
+------------------+
| Harness growth   |  ← 摩擦记录到 docs/HARNESS_BACKLOG.md
+------------------+
```

## Every Task Has Two Outputs

1. **Learning delta**: 微课、题库、学习记录、术语表更新
2. **Harness delta**: 文档、模板、验证期望、决策记录，让下一次更容易

## New Knowledge Sub-Directory Rule

每当新建知识子目录时，**必须同步创建完整的 `teach/` 脚手架**。详见 `CLAUDE.md` 和 `RULES.md`。

## Lane Definitions

| Lane | Use when | Requirements |
|---|---|---|
| **Tiny** | 低风险：查术语、纠正错字、更新链接 | 记录 intake，直接完成，保持 docs 最新 |
| **Normal** | 有界学习目标：学一个概念、做一个题型 | 创建 study packet，链接相关 docs，实现最小验证 |
| **High-Risk** | 方向模糊、主题重大调整、多知识点交叉 | 请求确认，记录 durable decision |

## Source Hierarchy

```
User-provided topic or prompt
  → input material for first buildout

docs/MISSION.md, docs/NOTES.md, teach/GLOSSARY.md
  → current learning contract

harness-records/traces/*
  → session-to-proof records

docs/decisions/*
  → why the learning path changed
```

## Done Definition

一个学习任务完成当且仅当：
- 所学概念能用自己话复述，或能做出相关题目
- 相关 docs、stories、test matrix 保持最新
- 学习记录已更新（清单打勾）
- trace 已记录到 `harness-records/traces/`
- 遇到的教学摩擦记录到 `docs/HARNESS_BACKLOG.md`

## Growth Rule

当 Agent 感到困惑、重复手动推理、需要新的验证方式、发现缺少规则、或看到反复失败模式时：
- 直接改进 harness（如果修复简单）
- 记录摩擦到 `docs/HARNESS_BACKLOG.md`（如果修复超出范围）

## 验证阶梯

```
validate:quick
  术语背诵、概念复述

validate:normal
  选择题、填空题、简答题

validate:hard
  计算题、算法推导、综合应用题
```

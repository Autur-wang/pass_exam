# Feature Intake

> 每个学习任务在开始前先经过 intake gate。

## Intake Flow

```
User prompt
    |
    v
Classify input type
    |
    v
Restate as work item
    |
    v
Find affected docs and learning records
    |
    v
Run friction checklist
    |
    v
Choose lane: tiny, normal, or high-risk
```

## Input Types

| Type | Use when | Typical artifact |
|---|---|---|
| **New concept** | 用户提出要学某个概念 | 微课 + 学习记录 |
| **Practice** | 做某类题目、题型训练 | 题库更新 + 学习记录 |
| **Review** | 复习已学内容、查漏补缺 | 更新学习记录清单 |
| **New topic** | 添加全新主题 | 需请求确认，milestone doc |
| **Maintenance** | 更新已有内容（纠正、更新链接） | 直接 patch |
| **Harness improvement** | 改进人-Agent 协作方式 | 直接更新 docs |

## Lanes

### Tiny（微车道）

用于低风险：纠正错字、更新链接、查术语、补充说明。

**要求：**
- 记录 intake 行
- 直接完成
- 保持受影响 docs 最新

### Normal（标准车道）

用于有界学习目标：学一个概念、做一个题型训练、复习一块内容。

**要求：**
- 创建或更新一个 study packet（简化为单个 markdown 文件）
- 链接相关 docs（MISSION.md、GLOSSARY.md 等）
- 实现最小验证（出一道题或复述检查）
- 更新学习记录清单

### High-Risk（高风险车道）

当方向模糊、主题重大调整、涉及多门课程交叉时使用。

**要求：**
- 请求人类确认
- 记录 durable decision
- 创建 milestone doc

## Friction Checklist

每个检查项标记：

| Friction flag | 适用情况 |
|---|---|
| New concept | 概念从未在学习记录中出现过 |
| Cross-subject | 涉及多门课程（OS/OOP/算法） |
| Difficult analogy | 难以找到直观类比 |
| Weak definition | 教材定义不清楚，需要自己组织语言 |
| No exercise | 没有现成题目，需要自己编 |
| Low confidence | 用户反馈多次不理解此点 |

## Classification

```
0 flags:
  tiny

1-2 flags:
  normal

3+ flags or direction unclear:
  high-risk, ask for confirmation
```

## Output

intake 结束时 Agent 应能说出：

```
Lane: normal
Reason: 涉及进程同步，需要跨概念联系。
Docs: MISSION.md, GLOSSARY.md, learning-records/
Study: operating_systems/learning-records/001X-xxx.md
Validation: 选择题验证 + 复述检查
```

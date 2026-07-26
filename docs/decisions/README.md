# Architecture Decision Records — 决策记录

> 本目录以 ADR (Architecture Decision Record) 形式记录对本工作区有约束力的结构性决策。
> 由 `../../scripts/verify-harness.ps1` 自动校验。

## ADR 模板

```markdown
# ADR-NNNN: <决策标题>

- **Status**: proposed | accepted | deprecated | superseded by ADR-XXXX
- **Date**: YYYY-MM-DD
- **Deciders**: <谁能改这个决策>

## 背景 / Context and Problem

<为什么需要这个决策>

## 评估的选项 / Considered Options

1. <选项 A>
2. <选项 B>
3. <选项 C>

## 决策 / Decision Outcome

<选了什么,什么时候生效。>

## 权衡 / Consequences

<好与坏 / 不可逆后果 / 关联任务。>
```

## 现有 ADR 索引

- [ADR-0001](ADR-0001-harness-automated-verifiers.md) — harness 自动校验
- [ADR-0002](ADR-0002-folder-hierarchy.md) — 文档四层分级
- [ADR-0003](ADR-0003-course-scaffold.md) — 教脚手架统一规范
- [ADR-0004](ADR-0004-os-dual-scaffold-resolution.md) — OS 双份脚手架收敛
- [ADR-0005](ADR-0005-ds-algo-triple-scaffold-resolution.md) — 数据结构与算法三套收敛
- [ADR-0006](ADR-0006-teach-minimal-scaffold.md) — teach 缺件最小兜底

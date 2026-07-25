# Context Engineering Rules

> 上下文规则帮助 Agent 决定读什么、什么时候读、什么时候停。
> 目标是最大化正确信息的投放，而不是最大化上下文。

## Context Phases

### Intake Phase

读来分类请求、找到受影响的 surface、选择车道。

| Document | Tiny | Normal | High-Risk |
|---|---|---|---|
| `CLAUDE.md` | Must | Must | Must |
| `AGENTS.md` | Should | Must | Must |
| `SOUL.md` | Should | Must | Must |
| `RULES.md` | Skip | Should | Must |
| `docs/FEATURE_INTAKE.md` | Skip | Must | Must |
| `docs/HARNESS.md` | Skip | Should | Must |

### Planning Phase

读来决定最小安全学习路径和验证方式。

| Document | Tiny | Normal | High-Risk |
|---|---|---|---|
| Current topic's MISSION.md | Must | Must | Must |
| Current topic's NOTES.md | Skip | Should | Must |
| Current topic's GLOSSARY.md | Skip | Should | Must |
| Latest learning record | Skip | Must | Must |
| Relevant textbook section | Skip | Should | Must |

### Implementation Phase

读来执行学习任务。保持此阶段局限于直接相关的文件。

| Document | Tiny | Normal | High-Risk |
|---|---|---|---|
| Files being updated | Must | Must | Must |
| Adjacent learning records | Skip | Should | Must |
| Relevant lesson HTML | Skip | Should | Must |
| Algorithm cheat sheet | Skip | Should | Must |

### Validation Phase

读来证明学习效果。

| Document | Tiny | Normal | High-Risk |
|---|---|---|---|
| Learning record checklist | Should | Must | Must |
| Quiz/exercise | Should | Must | Must |
| GLOSSARY.md definition | Should | Must | Must |

### Trace Phase

读来为下一次留下有用的证据。

| Document | Tiny | Normal | High-Risk |
|---|---|---|---|
| `docs/TRACE_SPEC.md` | Should | Must | Must |
| Changed-file list | Must | Must | Must |
| Validation evidence | Should | Must | Must |

## Retrieval Triggers

| Trigger | Action |
|---|---|
| 任务涉及新课程主题 | 读对应课程的 MISSION.md |
| 任务涉及新概念 | 检查 GLOSSARY.md 是否已有，必要时新增 |
| 用户反复在同一点出错 | 记录到 HARNESS_BACKLOG.md，考虑增加类比 |
| 任务需要编新题目 | 使用 tdd-guide agent |
| 任务涉及简历/个人信息 | 使用 security-reviewer agent |

## Token Budget Guidance

| Lane | Target | Read Shape |
|---|---|---|
| Tiny | ~1K tokens | CLAUDE.md + 变更的文件 |
| Normal | ~3K tokens | CLAUDE.md + MISSION.md + 最新学习记录 + 相关章节 |
| High-Risk | ~5K tokens | Full intake + 所有相关 docs |

## Review Checklist

学习任务结束前：
- [ ] Lane 已从 `docs/FEATURE_INTAKE.md` 选择
- [ ] 相关 docs 已识别
- [ ] 验证已完成（做题或复述）
- [ ] 学习记录已更新
- [ ] Trace 已记录

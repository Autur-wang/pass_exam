# Contributing Guide

> 本仓库是**学习工作区**,不是软件项目。贡献目标是确保学习不漏、不偏、不跳过验证。
> 本文档给 AI Agent / 协作者提供入口;以 L3 harness 为强制流程。

---

## 项目性质

一个面向**技术面试**的系统性复习工作区。方法论:类比教学 + 清单核查 + 逐项确懂。

---

## 1. 强制流程(每次任务)

| 阶段 | 必读 | 输出 |
| --- | --- | --- |
| 启动 | `WORKING-CONTEXT.md` + `harness-records/traces/` 末尾 1-2 条 | 任务 Lane 选择 |
| 分类 | `docs/FEATURE_INTAKE.md` | tiny / normal / high-risk |
| 读 docs | `docs/CONTEXT_RULES.md` | 必读文件列表 |
| 学 | 当前课程 `<course>/teach/{MISSION,NOTES,GLOSSARY}.md` + 最新 2-3 条 `learning-records/*.md` | 范围与边界 |
| 输出 | 一节 HTML / 一道题 / 一个补丁 | |
| 验证 | 用户复述 / 做题 / `pwsh -File scripts/verify-self.ps1` | 校验证据 |
| 收尾 | 写 `harness-records/traces/<date>-<slug>.md`(参考 `docs/TRACE_SPEC.md`) + 必要时登记 `docs/HARNESS_BACKLOG.md` | 下次会话可接力 |

---

## 2. 文档四层规则(ADR-0002)

新增/修改文档前,**先归层**:

| 层 | 例子 |
| --- | --- |
| L1 项目身份 | `README.md` `SOUL.md` |
| L2 协作规则 | `AGENTS.md` `CLAUDE.md` `RULES.md` |
| L3 Harness | `docs/HARNESS.md` `docs/decisions/` |
| L4 操作 | `scripts/` `harness-records/` |

新建 ADR 必须含 status / date / context / decision / consequences 章节(脚本 `verify-harness.ps1` 校验)。

---

## 3. 教脚手架(ADR-0003)

每门课程 `<course>/teach/` 必须包含 9 件 + 3 子目录。新建课程**必须同时建完整 scaffold**。
校验:`pwsh -File scripts/verify-scaffold.ps1`。

最小兜底模板见 `docs/decisions/ADR-0006-teach-minimal-scaffold.md`。

---

## 4. 文件维护边界

### 可以新增或修改
- L1/L2 / L3 `docs/` / L4 `scripts/` `workflow/`。
- 各课程 `teach/{lessons,learning-records,reference}/*`。
- `harness-records/{traces,friction}/*`。

### 谨慎修改(默认只读)
- `textbook/` `reference/` `skills/` 第三方原始资料。

### 不参与 verify-* 校验
`textbook/` `reference/` `skills/` `个人情况与简历/` `原始资料/`
`.superpowers/` `docs/superpowers/` 第三方 upstream 镜像
`tasks/todo.md` 用户维护。

---

## 5. 学习内容格式

### 微课
- `<course>/teach/lessons/NNNN-dash-case-topic.html`
- 必含:直觉类比 + 关键定义 + 小表格 + ≥1 道自测题 + 答案解释
- 独立可读,不依赖对话

### 学习记录
- `<course>/teach/learning-records/NNNN-dash-case-topic.md`
- 记录用户反馈 / 错因 / 下一步策略(不流水账)

### 题库
- 各课程对应 `exams/` 目录
- 注明章节 / 难度 / 来源

---

## 6. 内容优先级

1. `面试/`
2. `operating_systems/`
3. `advanced_oop/`
4. `数据结构与算法/`
5. `learn-code/`

---

## 7. 提交规范

Conventional Commits:
- `feat:` 新增微课 / 学习记录 / 题目
- `fix:` 修错
- `docs:` 文档更新(包括 ADR)
- `refactor:` 重构脚手架 / 脚本
- `chore:` 工具 / 技能更新

每次提交前必跑 `pwsh -File scripts/verify-self.ps1` 看 baseline。

---

## 8. 教学人设

> "你是睿智且极其高效的老师。确保她真正理解本次会话的内容。用开放式问题或选择题考她,打乱答案顺序。终极目标:会话不能结束,直到她理解清单上的每一项内容。"

详细见 `CLAUDE.md`。所有 AI 教学会话遵守此约束。
# Project Filetree

> **单一真相**:本表是仓库当前真实目录的逐项说明。
> 所有内容不得脱离 `scripts/verify-self.ps1` 的 green 报告单独声称"现状如此"。

## L1 — 项目身份层

- `README.md`
- `SOUL.md`
- `map.md`
- `LICENSE`
- `SECURITY.md`
- `CHANGELOG.md`
- `AGENTS.md` `CLAUDE.md` `CONTRIBUTING.md` `RULES.md` — L2,见下

## L2 — 协作规则层

- `AGENTS.md` — **AI 行为权威**(权威优先于 `CLAUDE.md`)
- `CLAUDE.md` — Claude Code 入口 + 教学人设
- `CONTRIBUTING.md` — Agent 协作指南
- `RULES.md` — 项目规则 + 新建子目录规范
- `FILETREE.md` — 本文件
- `WORKING-CONTEXT.md` — 当前状态(time-sensitive)

## L3 — Harness 工作流层

- `<HARNESS.md>` — Harness 主编排
- `<CONTEXT_RULES.md>` — 按阶段读文档
- `<FEATURE_INTAKE.md>` — 任务分类
- `<HARNESS_BACKLOG.md>` — 摩擦累积
- `<TRACE_SPEC.md>` — trace 写作格式
- `<COURSES.md>` — **项目课程全景**
- `decisions/`
  - `<README.md>` — ADR 模板
  - `ADR-0001` ~ `ADR-0006`(详见 `docs/decisions/README.md`)

> 注:上述 `< >` 文件实际位于 `docs/` 子目录中。

## L4 — 操作层

- `scripts/`
  - `verify-self.ps1` — 一键 verify-scaffold + verify-paths + verify-harness
  - `verify-scaffold.ps1` — 每门课程的 teach 脚手架完整
  - `verify-paths.ps1` — 相对路径引用合规
  - `verify-harness.ps1` — traces/decisions/friction/backlog 合规
  - `courses-stats.ps1` — 各课程 lessons / learning-records 计数
- `workflow/ai-workflow.md` — AI 工作流 SOP
- `harness-records/`
  - `traces/` — 会话 trace
  - `friction/` — 摩擦记录
- `tasks/todo.md` — 用户维护(不属 harness 校验)

## 课程区

主线(详见 `<COURSES.md>`):

- `面试/<子>/teach/` — 4 个面试子课(技术面试手册/编程面试大全/面向对象面试问答/工程领导力资源)
- `operating_systems/teach/` — OS 主线
- `advanced_oop/teach/`
- `learn-code/teach/` — xv6
- `数据结构与算法/<teach_副本>/` — 待 ADR-0005 整理
- `agent开发/`
- `多媒体/teach/`
- `skill开发/teach/`

## 工具区

- `skills/` — 教学 skill
- `reference/` — 第三方只读

## 不参与校验

`textbook/` `reference/` `skills/` `个人情况与简历/` `原始资料/`
`.git/` `.superpowers/` `docs/superpowers/` `.playwright-mcp/`
第三方镜像目录(完整清单见 `scripts/verify-paths.ps1`)

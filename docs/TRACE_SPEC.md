# Trace Spec — 会话轨迹记录规范

> 本文件是 harness-records/traces/ 下任何 `*.md` 的写作约定。
> 由 `../scripts/verify-harness.ps1` 自动校验。

## 命名

- `YYYY-MM-DD-<short-slug>.md`
- 一会话一条 trace;多个相关会话可在文件名加 `-partN`

## 必须包含的字段(头部)

```markdown
- **Date**: 2026-07-26
- **Lane**: tiny | normal | high-risk
- **Topic**: <涉及的课程 / 系统>
- **Outcome**: pass | fail | partial — 一句话讲明本会话结论
```

## 必须包含的章节

1. **Goal** — 本次开始时用户给的原话意图,不复述修辞。
2. **Actions** — Agent 关键动作清单(每条一行,可带命令或文件路径)。
3. **Validation** — Agent 如何确认结果(运行脚本 / 浏览器自检 / 用户复述)。
4. **Trace Evidence** — 可重现的关键链接或路径(供 harness growth 反查)。
5. **Open Threads** — 留在下一会话的待办(可由 harness 后续启动诊断)。

## 反例

- 长流水账(无 Lane / Outcome)
- "我学到了什么" 而不写 Goal / Validation
- 把 trace 当成学习笔记(应写入对应课程的 `learning-records/`)

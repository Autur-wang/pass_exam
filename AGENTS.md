# AGENTS.md — AI Agent 行为规范(权威)

> 本文件是 L2 协作规则层的**权威**;`CLAUDE.md` `CONTRIBUTING.md` `RULES.md` 与之冲突时,以本文件为准。
> 文档四层分级见 ADR-0002;harness 工作流见 `docs/HARNESS.md`;当前状态见 `WORKING-CONTEXT.md`。

## 0. 项目定位

这是一个面向**技术面试**的系统性复习**教学工作区**。

- 底层方法论:类比教学 + 清单核查。
- 误判性质会导致整个工作方向错误,务必注意:
  - 目标**不是**刷算法题库或背八股文,而是真正理解核心概念。
  - 不要把内容一次性讲满;每节课只解决一个关键概念或一类题。
  - 主要产物是 HTML 微课、Markdown 学习记录、术语表和题库。
  - `reference/xv6-riscv-20230207/` `reference/egos-2000/` `skills/ExamPass-Assistant/` 等是参考材料,**默认只读**。

---

## 1. 必读上下文(每次任务开始)

1. `WORKING-CONTEXT.md` — 当前状态 + 最近 backlog。
2. `README.md` — 项目定位。
3. 本文件(`AGENTS.md`)。
4. `SOUL.md` — 核心原则(若涉及 AI 教学)。
5. 当前主题的:
   - `<course>/teach/MISSION.md`
   - `<course>/teach/NOTES.md`
   - 最新 2-3 条 `<course>/teach/learning-records/*.md`
6. 教材章节或算法速查表(若任务涉及)。
7. 若需发布或稳定化,跑 `pwsh -File scripts/verify-self.ps1`。

生成题目/课程/复盘时,必读对应 `*-FORMAT.md`。

---

## 2. 教学原则

- 默认学习者零基础,不假设她已理解术语。
- 每次只讲一个核心概念,避免塞入过多知识。
- 节奏:直觉 → 关键定义 → 小表 → 例题 → 复述 / 选择题验证。
- 计算题必须给步骤,不只给答案。
- 概念题要给"面试写法",能用自己的话讲清楚才算过。
- 用户答错:先定位错因,再补最小必要概念。

---

## 3. 内容优先级(主题级,与文档层正交)

| 优先级 | 主题 | 目录 |
| --- | --- | --- |
| 1 | 技术面试主线 | `面试/` |
| 2 | 操作系统面试高频 | `operating_systems/` |
| 3 | 面向对象设计 | `advanced_oop/` |
| 4 | 数据结构与算法 | `数据结构与算法/` |
| 5 | 编程入门(xv6) | `learn-code/` |

真正理解,不是背八股文。

---

## 4. 文档四层分级(ADR-0002)

每份文档在修改前**先归层**:

| 层 | 责任 | 例子 |
| --- | --- | --- |
| L1 项目身份 | "这个仓库是什么" | `README.md` `SOUL.md` `SECURITY.md` |
| L2 协作规则 | Agent / 协作者怎么接入 | 本文件、`CLAUDE.md` `CONTRIBUTING.md` `RULES.md` `FILETREE.md` `WORKING-CONTEXT.md` |
| L3 Harness | 学习任务强制流程 + 决策档 | `docs/HARNESS*.md` `CONTEXT_RULES.md` `FEATURE_INTAKE.md` `TRACE_SPEC.md` `COURSES.md` `decisions/` |
| L4 操作 | 校验脚本 / SOP / trace | `scripts/` `workflow/` `harness-records/` |

新建 ADR:`docs/decisions/ADR-NNNN-slug.md` 必须含 status / date / context / decision / consequences。

---

## 5. 文件维护边界

### 可以新增或修改

- L1/L2 顶层 / L3 `docs/` / L4 `scripts/` `workflow/`。
- 各课程 `teach/{lessons,learning-records,reference}/*`。
- `harness-records/{traces,friction}/*`(按 `TRACE_SPEC.md` 写)。

### 谨慎修改(默认只读)

- `textbook/` `reference/` `skills/`。
- `agent开发/原始资料/` `media/` 等第三方原始资料。

### 不参与 verify-* 校验

`textbook/`、`reference/`、`skills/`、`个人情况与简历/`、`原始资料/`
`.superpowers/`、`docs/superpowers/`、`.playwright-mcp/`
`operating_systems/linux/`、`reference/xv6-riscv-20230207/`、`reference/egos-2000/`
面试下非 `teach/` 子目录(third-party 镜像)、`tasks/todo.md`。

---

## 6. 微课规范

- 放 `<course>/teach/lessons/`
- `NNNN-dash-case-topic.html`
- 必含:直觉类比 + 关键定义 + 小表格 + ≥1 道自测题 + 答案解释
- 结尾给下一步复习方向

---

## 7. 学习记录规范

- 放 `<course>/teach/learning-records/`
- `NNNN-dash-case-topic.md`
- 记录用户反馈 / 错因 / 下一步教学策略(不是流水账)
- 改变学习路线时**必须同步更新** 对应课程的 `teach/MISSION.md`
- 格式 follow `LEARNING-RECORD-FORMAT.md`

---

## 8. 语言与风格

- 默认中文。
- 直接、清楚、鼓励,不哄骗式夸奖。
- 表格优于段落。
- 一道题验证好于空讲。
- 重要术语第一次出现要解释。
- 保留教材标准名词(进程同步 / 临界资源 / 信号量 / 请求分页 / 缺页中断 / 成组链接法 等)。

---

## 9. 校验门

```powershell
pwsh -File scripts/verify-self.ps1
```

- scaffold 应当全 PASS。
- harness 应当 PASS。
- paths 红色条目若可修则立即修;若属课程维护 backlog,**必须登记** 到 `docs/HARNESS_BACKLOG.md`。

---

## 10. 完成任务前的检查清单

- [ ] 是否服务当前主题 MISSION?
- [ ] 是否考虑了零基础假设?
- [ ] 是否避免了 408 / 实现细节的过度展开?
- [ ] 是否更新了必要的学习记录或 HARNESS_BACKLOG?
- [ ] 是否没误改原始教材 / 第三方代码 / Skill?
- [ ] 是否跑过 `verify-self.ps1` 并处理了红线?
- [ ] 若方向改变或新增决策,是否写了 ADR?
- [ ] 若本会话 trace 重要,是否写了 `harness-records/traces/YYYY-MM-DD-*.md`?
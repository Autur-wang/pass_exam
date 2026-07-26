# Working Context

> Last updated: 2026-07-26
> 当前状态:Harness 化 + 自动化校验 + 四层文档分级落定;OS / 数据结构与算法 仍遗留脚手架整理待办。

---

## 1. 项目定位

技术面试系统性复习工作区。方法论:类比教学 + 清单核查 + 逐项确懂;主题随面试需求调整。

## 2. 主题状态(高层速览;权威在 `docs/COURSES.md`)

| 目录 | 主题 | 状态 | 备注 |
| --- | --- | --- | --- |
| `面试/` | 技术面试 | 主线,4 子目录并行 | 多数 teach 仅骨架,内容待填 |
| `operating_systems/` | OS | ADR-0004 已合并双份 | 88+ lessons + 16 learning-records |
| `advanced_oop/` | OOP | teach/ 完整 | RESOURCES / GLOSSARY 内 broken refs 待修 |
| `learn-code/` | xv6 | ADR-0006 兜底补 NOTES / GLOSSARY | |
| `数据结构与算法/` | 算法 | ADR-0005 已写,等用户确认后执行 rename | |
| `agent开发/` | Agent | 含 from-zero + book-course + lessons | |
| `多媒体/` | 多媒体 | ADR-0006 补 2 子目录 | |
| `skill开发/` | Skill | ADR-0006 兜底 | 无新投入 |

## 3. 文档体系(2026-07-26 经 ADR-0001 ~ ADR-0006 落定)

| 层 | 责任 | 重要文件 |
| --- | --- | --- |
| L1 项目身份 | "这是什么仓库" | `README.md` `SOUL.md` |
| L2 协作规则 | Agent / 协作者怎么接 | `AGENTS.md` `CLAUDE.md` `CONTRIBUTING.md` `RULES.md` `FILETREE.md` `WORKING-CONTEXT.md` |
| L3 Harness | 学习任务流与决策 | `docs/HARNESS*.md` `CONTEXT_RULES.md` `FEATURE_INTAKE.md` `TRACE_SPEC.md` `COURSES.md` `decisions/ADR-*.md` |
| L4 操作 | 脚本 / 流程 / trace | `scripts/*.ps1` `workflow/ai-workflow.md` `harness-records/{traces,friction}/` |

## 4. 校验基线(2026-07-26 实测)

| 校验 | 状态 | 说明 |
| --- | --- | --- |
| `verify-scaffold.ps1` | 5/5 PASS | |
| `verify-paths.ps1` | 4 broken | 均为课程内容 backlog,已文档化 |
| `verify-harness.ps1` | PASS | traces/decisions 写入后自动验收 |

一键跑:运行 `pwsh -File scripts/verify-self.ps1`。

## 5. 当前约束

- 学习工作区,不是软件项目;构建/测试/lint 工具链不存在。
- 每次会话只增加 1 个 track;不并发多个 session。
- 解释面向面试标准答案,不是口语随意发挥。
- 计算题必须给步骤,不只给答案。

## 6. 历史 backlog 摘要(详见 `docs/HARNESS_BACKLOG.md`)

- 2026-07-17 初始 HARNESS_BACKLOG
- 2026-07-26 verify-scaffold 首跑识别 teach 缺件 → 已被 ADR-0006 修复
- 2026-07-26 OS 双份已落地整理(ADR-0004)
- 2026-07-26 ADR-0006 已落地 teach 兜底

## 7. 下一步

1. 等用户批准 ADR-0005(数据结构与算法 三套收敛)
2. 修 advanced_oop teach/RESOURCES.md、GLOSSARY.md、MISSION.md 中残留 broken refs
3. 修 learn-code teach/RESOURCES.md `xv6-riscv-20230207` 外部子模块问题
4. 修 agent开发 / 多媒体 课程内 broken refs(登记 in HARNESS_BACKLOG)

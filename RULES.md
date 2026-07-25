# Rules — pass_exam

## 项目规则汇总

本文件汇总所有规则及优先级。

---

## 规则加载顺序（冲突时后者覆盖前者）

1. `~/.claude/rules/ecc/common/` — 全局通用规则
2. `~/.claude/rules/ecc/zh/` — 全局中文对话规则
3. `.claude/rules/ecc/common/` — 本项目通用规则
4. `.claude/rules/ecc/zh/` — 本项目中文扩展规则

---

## 核心学习规则

### 必须遵守

- 每节课只解决一个窄问题，不贪多
- 用直觉类比建立感知，再用形式定义
- 每学完一个点立即用题验证，答对才算过
- 学习记录持续更新清单（已验证/薄弱/未接触）
- 用开放式问题或选择题确认理解，不跳过验证环节
- 解释要面向面试标准答案，而不是口语随意发挥

### 禁止

- 一次塞入过多知识（超过一个窄主题的分量）
- 只给答案不给步骤（计算题必须有步骤）
- 用"好像懂了"跳过验证
- 把 408 难题或系统实现细节当作主要内容
- 修改原始教材、第三方参考代码、旧提示文件

---

## 内容优先级

1. 技术面试主战场（`面试/`）
2. 操作系统面试高频（`operating_systems/`）
3. 面向对象设计（`advanced_oop/`）
4. 数据结构与算法（`数据结构与算法/`）
5. 编程入门（`learn-code/`）

---

## 新建知识子目录规范

每当新建一个知识子目录（如 `面试/某方向/`）时，**必须同步创建完整的 `teach/` 脚手架**：

```
<new-dir>/
└── teach/
    ├── MISSION.md          # 从 MISSION-FORMAT.md 填充
    ├── MISSION-FORMAT.md  # 从同级已有 teach/ 复制
    ├── NOTES.md
    ├── GLOSSARY.md
    ├── GLOSSARY-FORMAT.md
    ├── RESOURCES.md
    ├── RESOURCES-FORMAT.md
    ├── LEARNING-RECORD-FORMAT.md
    ├── SKILL.md            # 从同级已有 teach/ 复制
    ├── learning-records/   # 空目录
    ├── lessons/            # 空目录
    └── reference/          # 空目录
```

格式文件从同级已有的 `teach/` 中复制。不得只建目录而不建 scaffold。

## 新增内容规范

### 新增微课

- 放在 `<course>/teach/lessons/` 或 `<course>/lessons/`
- 命名为 `NNNN-dash-case-topic.html`，编号递增
- 必须包含：直觉类比、关键定义、小表格/步骤、≥1 道自测题及答案解释
- 能独立打开阅读，不依赖当前对话
- 结尾给下一步复习建议

### 新增学习记录

- 放在 `<course>/teach/learning-records/` 或 `<course>/learning-records/`
- 命名为 `NNNN-dash-case-topic.md`，编号递增
- 记录：用户反馈、错因、下一步教学策略
- 不写流水账

### 新增题库

- 放在 `bank/` 或对应课程的 `exams/`
- 注明考点、难度、来源（期末/面试/408）

---

## 校验清单

完成任务前检查：

- [ ] 是否服务面试复习目标？
- [ ] 是否考虑了零基础假设？
- [ ] 是否避免了过度展开 408/实现细节？
- [ ] 是否更新了必要的学习记录或索引？
- [ ] 是否没有误改原始教材、第三方代码？

---

## Agent 编排规则

| Agent | 触发时机 |
|---|---|
| `planner` | 复杂概念学习路径规划 |
| `code-reviewer` | 生成微课后检查质量 |
| `tdd-guide` | 生成题目或设计练习时 |
| `security-reviewer` | 涉及简历/个人信息处理时 |

---

## 提交规范（针对文档更新）

使用 Conventional Commits 格式：
- `feat:` — 新增微课/学习记录
- `fix:` — 修正错误内容
- `refactor:` — 重构文档结构
- `docs:` — 文档更新
- `chore:` — 工具/技能更新

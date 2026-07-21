# 备考教学工作区（考试 + 面试）

这是一个**多学科的考试 / 面试备考教学工作区**，不是传统软件工程仓库。主要产物是 HTML 微课、Markdown 学习记录、术语表和题库——不是可运行的程序。

它起源于一门《操作系统》学校自命题期末复习（`operating_systems/`，至今仍是内容最成熟的板块），现已扩展为覆盖**多门学校考试课**与**多个面试方向**的教学平台。当前最活跃的板块是 `面试/`。

## 这不是什么（避免误判性质）

- 不是开发任何软件 / 操作系统，产物是**教学材料**。
- 不是刷 408 统考难题；学校自命题、面试通关才是目标。
- 各板块下的 `原始资料/`、克隆的第三方仓库、`reference/` 源码默认**只读**。
- 不要把内容一次讲满；每节微课只解决一个关键概念或一类题。

## 板块总览

> 体量为 `du -sh` 磁盘占用；「微课」指 `lessons/` 下可独立打开的 HTML。

| 板块 | 体量 | 内容 |
|---|---|---|
| **`面试/`** | 55M | 当前最活跃。6 门建成面试精读课：编程面试大全(52)、前端面试知识库(46)、生成式AI学习指南(31)、大模型算法面试资料(31)、工程领导力资源(30)、面向对象面试问答(26)；LightRAG知识图谱RAG(37，含克隆代码库)。另有克隆仓+中文知识分支：Agentic-RAG新手教程、Agent全栈36章教程、Coding Agent运行时工程笔记、前端系统设计案例索引。`技术面试手册/` 目前只是空脚手架。 |
| **`operating_systems/`** | 6.8M | **起源板块**。94 节微课 + 6 章教材/PPT/测试 + `textbook/`(总框架、算法速查表、考点) + `exams/`(7 份测试卷) + `linux/`(Linux/xv6 源码精读 6 课)。 |
| **`agent开发/`** | 146M | 4 门课：`from-zero/`(入门 14) + 顶层 `lessons/`(进阶「四支柱」18，源自 mino_server) + `book-course/`(《深入理解 AI Agent》精读 57) + `pi-agent精读/`(Pi-Agent SDK 源码精读 32，源自克隆的冬瓜教程 `dg-ai-notes`)。体量主要来自 140M 的克隆书仓 `原始资料/`。 |
| **`数据结构与算法/`** | 95M | `teach_副本/`(19 课) + `skill/`(《算法图解》《啊哈！算法》两本书的分章知识库) + 94M PDF 原始资料。 |
| **`多媒体/`** | 32M | 《多媒体系统导论》期末课：`teach/`(22 课，主线是计算题) + `exam-review/`(冲刺主页/速查/真题) + 克隆原始资料。 |
| **`advanced_oop/`** | 496K | Effective Java 条款「过线型」期末复习课(11 课) + 章节复习 Markdown。 |
| **`learn-code/`** | 88K | 按 OS 教材章节精读 **xv6 内核源码**的教学课（起步阶段，4 课：Ch1 接口 → Ch2 组织 → Ch3 页表）。 |
| **`reference/`** | 676K | 参考代码。当前仅 `xv6-riscv-20230207/`（MIT xv6 源码**快照**，非 git 克隆），其内嵌一套 `teach/`(13 课) 用于源码精读。 |
| **`skills/`** | 1.5M | 本地轻量教学技能：`teach-you/`(循序教学)、`grill-me/`(追问校验)、`caveman/`(极简类比)。另有从第三方仓库 [yao-open-skills](https://github.com/yaojingang/yao-open-skills) 引入的完整技能包 `yao-positioning-skill/`(定位分析与报告生成，含脚本/模板)，默认只读，改动前看其自带 `SKILL.md`。 |
| **`book-to-skill/`** | 1.8M | 克隆的第三方工具（把技术书转成 agent skill），默认只读。 |
| **`个人情况与简历/`** | 20K | ⚠️ 15 个子目录目前**全是空占位**（内容未落盘），仅有一份 `AGENTS.md` 描述这些计划中的求职/简历项目。 |
| 其余 | — | `skill开发/`(空 teach 模板)、`docs/`(superpowers 计划/规格)、`tasks/`(todo)、`workflow/`(交接规范)。 |

## 核心架构：可复用的 `teach/` 元结构

多门课各自带一套**高度同构**的教学脚手架，理解一套即理解全部。每门课的 `teach/`（`operating_systems` 把同名文件同时放在课程根与 `teach/` 两处）包含**配对的内容文件 + 格式模板**：

- `MISSION.md` / `MISSION-FORMAT.md` — 为什么学、考试范围、成功标准
- `NOTES.md` — 教学偏好与工作区说明
- `GLOSSARY.md` / `GLOSSARY-FORMAT.md` — 标准术语
- `RESOURCES.md` / `RESOURCES-FORMAT.md` — 教材、课件、外部资源
- `learning-records/` + `LEARNING-RECORD-FORMAT.md` — 学习记录（带格式规范）
- `lessons/` — 生成的 HTML 微课
- `SKILL.md` — 该课程作为技能的索引入口

**关键模式**：每个 `*-FORMAT.md` 是对应内容文件的写作模板。新增学习记录、术语、资源前，先读对应 `-FORMAT.md` 再动笔。

## operating_systems/ 主工作区（起源板块）

- `1_操作系统引论/` ~ `6_文件管理/` — 各章原始教材 + PPT + 测试
- `textbook/` — 主教材结构与课件；`0_总框架.md` 是人工整理的快速定位入口（查老师口径优先看这里），另含算法速查表、考研高频考点
- `lessons/` — 94 节 HTML 微课，命名 `NNNN-dash-case-topic.html`，编号递增，一节一窄主题
- `exams/` — 章节测试卷 `chNN-test.html` 与 `final-test.html`
- `linux/` — Linux 0.11 / xv6 源码精读系列
- `learning-records/` — 学习记录与复盘（主体在 `teach/learning-records/`）
- `reference/szu-期末真题/` — 深大历年期末真题/回忆，是关键考点来源

## 常用命令

这里没有构建 / 测试 / lint 工具链，日常操作是导航与生成内容：

```bash
# 列出某门课的全部微课
find operating_systems/lessons -maxdepth 1 -type f | sort

# 数一下每门 teach 课的微课数量
find . -type d -name lessons -exec sh -c \
  'echo "$(find "$1" -maxdepth 1 -name "*.html" | wc -l | tr -d " ") $1"' _ {} \; | sort -rn

# 按考点搜索（rg 是主要工具）
rg "页面置换|FIFO|LRU|缺页" operating_systems/

# 在浏览器打开一节微课
open operating_systems/lessons/0006-page-replacement.html
```

## 给 AI 代理的快速入口

如果你是 AI 代理，先判断任务属于**哪一门课**，再按此顺序读：

1. `CLAUDE.md` — 仓库性质、必读上下文顺序、`teach/` 元结构、常用命令
2. `AGENTS.md` — 文件可改 / 不可改清单、新增课程与学习记录规范
3. 该课的 `teach/MISSION.md`、`teach/NOTES.md`
4. 该课最新 2–3 条 `learning-records/*.md`
5. 与任务相关的教材章节、术语表或速查表

更详细的接手 / 产出 / 交接流程见 `workflow/ai-workflow.md`。

## 已知漂移（本轮已校准部分，余项待处理）

本 README 与关键说明文档由逐板块只读测绘校准过。**本轮已处理**的内部漂移：

- ✅ `个人情况与简历/AGENTS.md` 已加「内容未落盘、目录为空占位」状态横幅，并把硬编码的 `/Users/wangzihao/template` 修正为本机路径（15 个空目录按约定保留）。
- ✅ `operating_systems/operating_systems_tangxiaodan/SKILL.md` 已注明「现仅存索引、12 章正文已缺失」。
- ✅ `operating_systems/build/*.py`、`operating_systems/NOTES.md`、`operating_systems/teach/NOTES.md`、`reference/README.html` 等**功能性文件**的旧机器路径 `/Users/wangzihao/Code/pass_exam` 已批量修正为 `/Users/bytedance/pass_exam`。
- ✅ `面试/` 已补板块级导航 `README.md`；`多媒体/teach/CURRICULUM.md` 课时数 21→22；`learn-code/teach/` 补齐 `NOTES.md`。

**仍待处理**（本轮按约定未动）：

- `operating_systems/` 的 `lessons/`(94) 与 `teach/lessons/`(25) 是双份镜像：接手时 **`lessons/` 以根目录(94)为准，`learning-records/` 以 `teach/`(16 条)为准**（根 `learning-records/` 仅 1 条）。本轮仅标注、未合并删除。
- `operating_systems/build/*.py` 的**结构性**漂移仍在：脚本假设模板在 `exams/_template.html`，实际在 `reference/_template.html`；`link_lessons.py` 链接指向 `../bank/`，测试卷实际在 `exams/`。属历史生成器，修正结构前不要盲跑（详见 `CLAUDE.md`）。
- ~22 个 lesson HTML 的「打开命令」展示文本仍含旧机器路径（无害，本轮按约定跳过）。

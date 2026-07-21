# Mission: 逐层读懂一个生产级 Agent SDK(Pi-Agent)

## Why
用户想真正搞懂「一个能上线的 Agent SDK 内部到底如何运转」——不满足于「会用 Claude Code / Cursor」,
而要看懂 harness(Agent 外壳)的设计,乃至基于 SDK 造自己的垂直 Agent。
Pi 是唯一能被「完整读完」的高质量样本:核心循环只有几百行、TerminalBench 排名第二,
同类产品(Claude Code / Cursor / Cline)的内部架构都能在它身上找到对应。看懂 Pi,等于看懂一个完整的 Agent SDK 应该怎么设计。

## Success looks like
- 给定 Pi 的任一子系统(Agent Loop / 模型调用 / 工具 / 消息 / 事件 / 上下文 / 压缩 / 会话),
  能讲清它「**是什么、怎么做、为什么这样设计**」三层,并指到教程对应的源码与行号。
- 能复述一条完整链路:用户输入 → Agent Loop → 模型调用 → 工具执行 → 消息回灌 → 下一轮,
  并说出中途每个「事件」是给谁看的。
- 能说出 Pi 的关键设计取舍(减法哲学:为什么不做 MCP / 子 Agent / 权限弹窗),并迁移到自己的 Agent 设计判断里。

## Constraints
- **语言轨:TypeScript**(pi SDK 本体语言;配图、类型、行号全部对得上原作)。
- 一节一**窄主题**,先建立「读得懂源码」的信心,再逐步加难度。
- 讲解必须**忠实转译教程**的真实内容与代码,不臆造数字/理由;引教程口径,不自称读过 pi 源码。

## Out of scope(暂不追)
- pi SDK 逐行精读(教程本身已是二次精读,我们**转译教程**,不复制整个 SDK)。
- Python 移植版的实现细节(除非 TS/Python 对照能帮助理解才点到)。
- `pi-orchestrator` 多 Agent 编排(实验性,v0.80.x 新增,非核心学习主线)。
- Astro 在线站(`web/`)的前端实现——那是教程的呈现层,不是学习对象。

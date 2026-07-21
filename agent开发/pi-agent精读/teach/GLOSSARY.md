# GLOSSARY · Pi-Agent SDK 深度精读

> 全课统一术语口径。第一次出现某术语时按此解释。随各章精读增补(设计扇出会补齐每章新术语)。

## 项目与整体

- **Pi / pi-agent** —— earendil-works 开源的极简、可扩展**终端编码 Agent 外壳**,TypeScript 编写,MIT 协议。本课基于 `v0.80.2`。
- **coding agent harness(编码 Agent 外壳)** —— 把 LLM 包装成能读写代码、跑命令的结对编程体的那层「壳」;Pi 就是一个 harness。
- **减法哲学 / "What we didn't build"** —— Pi 的设计立场:凡会污染上下文、降低可观察性、或制造安全表演的功能,一律不进核心,靠扩展补。
- **YOLO 模式** —— Pi 默认不经审批弹窗直接执行动作;论点是审批会造成「弹窗疲劳」沦为安全表演,应以容器化作安全边界。

## 四个核心包

- **pi-ai** —— 最底层,只管**调模型**:统一 30+ 供应商、流式输出、跨供应商上下文交接、token 成本追踪。不含任何 Agent 概念。
- **pi-agent-core** —— 中层,只管**跑循环**(Agent Loop)+ 工具系统 + 事件流。依赖 pi-ai,不依赖 coding-agent / tui。
- **pi-coding-agent** —— 顶层,把下两层组装成完整 CLI 产品,同时暴露 SDK 接口(`createAgentSession()`)。
- **pi-tui** —— **正交的**终端 UI 库(差分渲染 / 声明式组件),与 Agent 体系完全解耦,可单独复用。coding-agent 单向依赖它。

## 运行与配置

- **四种运行模式** —— 交互(`pi`)/ print-JSON(`pi -p`,脚本 CI)/ RPC(stdin-stdout 交换 JSON)/ SDK(嵌入自己应用)。
- **models.json** —— `~/.pi/agent/models.json`,声明第三方模型(baseUrl / api 协议 / 模型 id / 上下文窗口);启动时由 `ModelRegistry.create()` 自动读取。
- **KnownProvider** —— pi 源码里已知供应商枚举,v0.80.2 实际 35 个(含区域变体),独立品牌约 27 个。
- **树状会话(Session Tree / DAG)** —— 会话存成树而非线性日志;可用 `/tree` 跳到任意历史消息分叉出新分支,所有分支活在同一文件里。

## (后续章节术语——设计扇出阶段增补)

- Agent Loop / stopReason / steering / follow-up · 模型调用翻译层 / thinking levels · 工具五步管道 · 内外两层消息 · 事件同步屏障 / 发布订阅 · 上下文工程 / 压缩 compaction / 切点 cut-point …

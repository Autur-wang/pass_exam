# MCP vs Skill —— 面试怎么答

**关联**: 回答 `大模型算法面试资料/面试专题/agent相关.md` 问题 2「大模型的 skill 是什么?和 mcp 工具有什么区别」。那份第三方题库给的答案偏"怎么写一个 SKILL.md 模板",本篇笔记补的是"面试现场怎么把这个问题答出层次感"——两者可以对照着看。也可参考 `Agent全栈36章教程/chapter_10_mcp/10_mcp_deepdive.py`(MCP 协议本身的深度解析)与 `chapter_20_context_engineering`(提到 Skill.md 在 Context Engineering 中的位置)。

---

面试里最重要的不是分别背定义，而是先说清楚：

> **MCP 和 Skill 不是竞争关系。MCP 是能力接入层，Skill 是能力编排层。**
> MCP 解决"Agent 怎么连接外部系统"，Skill 解决"Agent 拿到能力后，应该按照什么流程把事情做好"。

## 60 秒面试回答

MCP 和 Skill 解决的是 Agent 系统中两个不同层次的问题。

MCP，也就是 Model Context Protocol，是一种标准化的上下文和工具接入协议。它采用 Host、Client、Server 的架构，MCP Server 可以向 Agent 暴露 Tools、Resources 和 Prompts，例如查询数据库、读取 GitHub 仓库、调用内部 API，或者获取文件内容。Client 和 Server 通常通过 JSON-RPC 通信，并在初始化时进行能力协商。([Model Context Protocol][1])

Skill 则更像一个可复用的任务工作流或者操作手册。它通常包含触发条件、执行步骤、输出格式、检查规则，也可以附带模板、参考资料和脚本。它解决的不是"系统有没有这个能力"，而是"面对某类任务时，Agent 应该怎样稳定地使用这些能力"。([OpenAI Help Center][2])

所以我会把 MCP 理解为 Agent 的接口标准或者工具总线，把 Skill 理解为 Agent 的 SOP 和能力编排。

例如，GitHub MCP 提供读取代码、搜索文件、创建 Issue 等能力；代码审查 Skill 则规定先读取项目说明，再查看改动范围，运行测试，检查安全风险，最后按照固定模板输出审查结果。Skill 在执行过程中可以调用 GitHub MCP。

适用场景上，需要连接数据库、飞书、GitHub、浏览器或者内部服务时，更适合使用 MCP；需要固化团队经验、规范多步骤流程、统一输出格式和降低结果波动时，更适合使用 Skill。实际工程中通常是两者结合，而不是二选一。

## 一句话类比

可以选择其中一个：

> **MCP 像 USB 接口标准，Skill 像插上设备以后怎么完成工作的操作手册。**

或者：

> **MCP 决定 Agent 有哪些手和工具，Skill 决定 Agent 用这些工具时先做什么、后做什么以及怎样验收。**

第二种更适合 Agent 工程岗位。

## 原理上的区别

| 对比维度     | MCP                              | Skill                            |
| -------- | -------------------------------- | -------------------------------- |
| 核心问题     | Agent 如何接入外部能力                   | Agent 如何稳定完成某类任务                 |
| 所处层次     | 协议与集成层                           | 工作流与行为层                          |
| 主要内容     | Tools、Resources、Prompts、通信和能力协商  | 指令、步骤、模板、规则、脚本、参考资料              |
| 工作方式     | Client 发现并调用 Server 暴露的能力        | Agent 根据任务匹配 Skill，加载并执行工作流      |
| 典型产物     | GitHub MCP Server、数据库 MCP Server | 代码审查 Skill、周报生成 Skill、故障诊断 Skill |
| 是否连接外部系统 | 通常是                              | 不一定                              |
| 是否规定业务流程 | 通常不负责                            | 主要职责                             |
| 关系       | 提供原子能力                           | 组合和约束这些能力                        |

## 适用场景怎么回答

### 适合用 MCP 的情况

当问题主要是"如何让不同 Agent 统一访问某个系统"时，优先考虑 MCP：

* 连接 GitHub、Slack、飞书、数据库、文件系统或者内部 API；
* 希望同一个服务能够被多个 MCP Host 复用；
* 外部系统的工具和数据可能动态变化，需要运行时发现；
* 需要明确的认证、授权、连接和调用边界；
* 希望减少不同 Agent 平台分别开发专用插件的成本。

例如：

> 公司有一套内部知识库 API，希望 Claude Code、IDE Agent 和桌面 Agent 都能查询，那么可以把它封装为 MCP Server，统一暴露搜索和读取能力。

### 适合用 Skill 的情况

当问题主要是"如何把某种做事方式固化下来"时，优先考虑 Skill：

* 团队有固定的代码审查、发布、排障或者汇报流程；
* 每次都需要重复输入相同提示词、模板和检查项；
* 任务包含多个步骤，而且容易遗漏；
* 希望不同成员和不同 Agent 的输出保持一致；
* 需要把专家经验、业务规则和团队规范沉淀下来。

例如：

> 团队规定排查线上问题时，必须先确认环境，再查看日志和监控，建立可复现用例，最后才能修改代码。这种流程适合做成故障诊断 Skill。

## 两者结合的完整例子

假设用户说：

> 帮我分析最近一次线上故障并生成复盘报告。

系统可以这样工作：

1. **事故复盘 Skill 被触发**，确定执行流程和最终报告格式。
2. Skill 调用 **监控 MCP** 获取指标和告警。
3. 调用 **日志 MCP** 查询异常日志。
4. 调用 **GitHub MCP** 查找相关提交。
5. Skill 按照时间线、根因、影响范围、修复措施和预防措施组织信息。
6. Skill 检查是否缺少证据、负责人和后续行动项。
7. 输出符合团队模板的复盘报告。

这里：

* MCP 提供数据和操作能力；
* Skill 负责流程、判断、编排和质量控制。

## 一个容易加分的细节

不要把两者简单说成：

> MCP 是工具，Skill 是提示词。

这不够准确。

MCP 除了 Tools，还可以暴露 Resources 和 Prompts；Skill 也不只是提示词，它还可以包含参考文件、模板、示例和可执行脚本。MCP 官方定义的三个核心 Server 原语就是 Tools、Resources 和 Prompts。([Model Context Protocol][1])

更准确的说法是：

> **MCP 标准化能力如何被暴露、发现和调用；Skill 标准化任务如何被理解、执行和验收。**

## 面试官继续追问：为什么不全部写在 Skill 里？

可以回答：

> 如果把数据库、GitHub 等系统的连接代码都直接写进 Skill，会导致工作流和底层集成强耦合。认证方式、接口变化或者 Agent 平台变化时，每个 Skill 都要重复修改。
> 把外部能力封装成 MCP 后，Skill 只依赖标准化的工具接口，可以专注于业务流程，也更容易复用和测试。

## 面试官继续追问：为什么不全部做成 MCP？

可以回答：

> MCP Server 更适合提供边界清晰的原子能力，例如查询日志、创建 Issue、读取文件。
> 但"先查什么、出现什么情况再查什么、最终怎样组织结果、有哪些验收规则"属于业务工作流。如果全部塞进 MCP 工具，工具会变得过重，而且难以针对不同团队灵活组合，所以这部分更适合放在 Skill 中。

## 最后的高分总结

> **MCP 标准化 Agent 与外部世界的连接，Skill 标准化 Agent 完成任务的方法。MCP 提供能力，Skill 编排能力；MCP 偏基础设施，Skill 偏业务工作流。简单任务可能只需要其中一个，复杂 Agent 系统通常需要二者结合。**

[1]: https://modelcontextprotocol.io/docs/learn/architecture "Architecture overview - Model Context Protocol"
[2]: https://help.openai.com/en/articles/20001066 "Skills in ChatGPT | OpenAI Help Center"

# 生成式 AI / AI 工程师面试 资源

本课知识**只从下列来源汲取**，不用参数化猜测。第一梯队是本仓库里的真实资料(两大真题库 + 101 指南 + free_courses)；第二梯队是这些资料反复引用的高信任一手来源。

## Knowledge · 本仓库真题与指南(课程主源)

- [`interview_prep/60_gen_ai_questions.md`](../interview_prep/60_gen_ai_questions.md) — **62 题**基础真题库(生成式模型 / LLM 与 Transformer / 多模态 / Embedding / 训练推理评估)。用于:基础与理论型题的骨架与标准答法。
- [`interview_prep/roles/ai-engineer/questions.md`](../interview_prep/roles/ai-engineer/questions.md) — **145 题** AI 工程师真题库(10 主题,2025-2026 时效)。用于:应用型题的骨架——RAG/Agent/评估/成本延迟/安全/系统设计/工程判断。
- [`interview_prep/roles/ai-engineer/rounds.md`](../interview_prep/roles/ai-engineer/rounds.md) / [`prep-plan.md`](../interview_prep/roles/ai-engineer/prep-plan.md) — 面试轮次结构与备考节奏。用于:课程排序与"面试怎么考"的场景化。
- [`resources/fine_tuning_101.md`](../resources/fine_tuning_101.md) — 微调 101(SFT/instruction/GRPO、RLHF/DPO/ORPO、PEFT: LoRA/QLoRA/adapter/prompt-tuning、选型矩阵、指标)。用于:微调与对齐两课。
- [`resources/agentic_rag_101.md`](../resources/agentic_rag_101.md) — Agentic RAG 概念(能力、单/多/分层三类型、挑战、客服例子)。用于:Agentic RAG 课。
- [`resources/agents_101_guide.md`](../resources/agents_101_guide.md) — agent = model + harness、四部件 harness、多智能体、评估维度。用于:Agent 基础课。
- [`resources/harness_engineering.md`](../resources/harness_engineering.md) — harness 工程(成熟度阶梯、context rot/clear-compact-offload、feed-forward/feedback、tool 设计=token 设计、生成者-评估者、blast radius、lethal trifecta)。用于:Agent 机制与可靠性两课。
- [`resources/mm_llms_guide.md`](../resources/mm_llms_guide.md) — 多模态 LLM 五部件架构 + MM-PT/MM-IT 训练 + 评估维度(**自标注为 2024 归档版**,教架构基本功但注明原生 omni-modal 是当下现状)。用于:多模态课。
- [`resources/securing_agentic_ai_systems.md`](../resources/securing_agentic_ai_systems.md) — Agentic AI 安全(5 大攻击向量、三支柱防御、检测/预防/缓解、OWASP/NIST/MITRE 映射、治理-遏制鸿沟)。用于:安全课。**引用其中具体数字/事件前须回读原文核实。**
- [`free_courses/ai_evals_for_everyone/`](../free_courses/ai_evals_for_everyone/) — 评估 10 章(认证课)。用于:评估两课深挖。
- [`free_courses/agentic_ai_crash_course/`](../free_courses/agentic_ai_crash_course/) — Agent 10 部分(agent/工具/RAG/MCP/规划/记忆/多智能体/真实系统)。用于:Agent 部分深挖。

## Knowledge · 真题库反复引用的一手来源(第二梯队,深挖用)

- [Attention Is All You Need (Vaswani et al., 2017)](https://arxiv.org/abs/1706.03762) — Transformer 与缩放点积注意力原文。
- [RAG 原始论文 (Lewis et al., 2020)](https://arxiv.org/abs/2005.11401);[Lost in the Middle (Liu et al.)](https://arxiv.org/abs/2307.03172);[HyDE (Gao et al.)](https://arxiv.org/abs/2212.10496);[GraphRAG (Microsoft)](https://arxiv.org/abs/2404.16130);[ReAct (Yao et al.)](https://arxiv.org/abs/2210.03629);[Judging LLM-as-a-judge (Zheng et al.)](https://arxiv.org/abs/2306.05685);[CoT (Wei et al.)](https://arxiv.org/abs/2201.11903);[Inverse Scaling in Test-Time Compute](https://arxiv.org/abs/2507.14417)。
- Anthropic 工程博客(真题库直接引用):[Building effective agents](https://www.anthropic.com/engineering/building-effective-agents)、[Effective context engineering](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)、[Contextual Retrieval](https://www.anthropic.com/news/contextual-retrieval)、[Multi-agent research system](https://www.anthropic.com/engineering/multi-agent-research-system)。
- [Chroma: Context Rot](https://research.trychroma.com/context-rot) 与 [Evaluating chunking](https://research.trychroma.com/evaluating-chunking);[Ragas 文档](https://docs.ragas.io/);[OWASP Top 10 for LLM](https://genai.owasp.org/llm-top-10/);[Simon Willison 提示注入系列](https://simonwillison.net/series/prompt-injection/)。

## Wisdom(社区)

- 源仓库本身:[awesome-generative-ai-guide](https://github.com/aishwaryanr/awesome-generative-ai-guide) — 持续更新的 journeys/topics/月度论文,面试后想扩展知识面回这里。
- [r/LocalLLaMA](https://reddit.com/r/LocalLLaMA)、[Latent Space](https://www.latent.space/) — 高信号的从业者社区/播客,用于:了解 2025-2026 生产实践与面试趋势。

## Gaps(源材料的空缺,答题时须知)

- **函数调用的具体线格式**(JSON schema/tool-call wire format)源里只有概念描述,无 API 语法——答"function calling 怎么工作"讲原理即可。
- **向量库/嵌入/分块的底层机制**在 agentic_rag_101 里停留在概念;底层细节靠 AI 工程师题库 Q34/Q35/Q49 与外部一手来源补。
- **多模态**只有 2024 归档文档覆盖;原生 omni-modal(GPT-4o/Gemini)是现状但源未详述——答题点到"现在是原生多模态"即可,勿编造细节。
- **扩散模型**在 60 题里几乎未展开(该库偏 GAN/VAE);只作生成式全景提及,勿深讲不在源里的扩散数学。

# 生成式 AI / AI 工程师面试 术语表

本课的标准语言。定义力求"面试能直接说出口"的精度——先说是什么，再点破常被问的"为什么/取舍"。术语按主题分组；同一概念有多种叫法时，选定一个主用词，其余列为 _避免_。

## 基础与 Transformer

**Token(词元)**：模型读写的最小单位，通常是子词片段(如 BPE 产生)，不是字符也不是词——上下文上限、延迟、成本都按 token 计。
_避免_：字、词

**Tokenization(分词)**：把文本切成 token 的过程；它解释了模型为何不擅长数字与字符级任务(数字/字母被切成不对齐的碎片)。

**Context window(上下文窗口)**：单次调用能关注的 token 上限(输入+输出)；越长越贵越慢，且质量常在触顶前就下降。

**Self-attention(自注意力)**：每个位置以"相关度"为权重、对所有位置的信息加权求和；Q/K/V 均来自同一段序列自己。核心公式 $\operatorname{softmax}(QK^\top/\sqrt{d_k})V$。

**QKV(Query/Key/Value)**：同一输入乘三套可学习权重得到的三种角色——Q 是"我要找什么"，K 是"每条信息的标签"，V 是"内容"。
_避免_：三个不同的输入

**Multi-head attention(多头注意力)**：并行跑多组注意力，各自在不同表示子空间里捕捉不同关系，再拼接。

**Positional encoding(位置编码)**：给自注意力补上"顺序"信息(自注意力本身位置无关)；现代常用 RoPE(旋转)、ALiBi(线性偏置)。

**KV cache**：生成时缓存已处理 token 的 K、V 张量，使后续每步只需增量计算——把请求分成计算密集的 prefill 与访存密集的 decode。

**MoE(Mixture of Experts，混合专家)**：用路由器为每个 token 只激活少数"专家"子网络，让总参数量增长而单 token 计算基本不变。
_避免_：MoE 更省显存(错：省的是计算，权重仍需全部加载)

**Distillation(蒸馏)**：训练小"学生"模型模仿大"教师"模型，换取更低的部署成本与延迟。

**Quantization(量化)**：把权重降到低精度(如 4/8-bit)以省显存、降延迟，代价是任务相关的精度损失——必须在自己的 eval 上验证。

## 生成式模型基础

**Generative vs Discriminative(生成式/判别式)**：生成式建模数据分布、能生成新样本(VAE、GAN)；判别式只学类间边界。

**GAN(生成对抗网络)**：生成器造假、判别器辨真假，二者对抗训练。

**Mode collapse(模式坍塌)**：GAN 生成器只产出少数几种样本、丧失多样性。

**VAE(变分自编码器)**：编码器把输入映到隐空间的概率分布(而非单点)，解码器从采样重建；隐变量带来可插值、可采样与不确定性。

**Diffusion(扩散模型)**：通过逐步去噪从随机噪声生成样本，现代图像生成主流(源材料侧重 GAN/VAE，扩散仅作全景提及)。

**Contrastive learning(对比学习)**：拉近相似样本、推远不相似样本的表示学习范式(CLIP、句嵌入常用)。

**Triplet loss**：让 anchor 到 positive 的距离比到 negative 至少小一个 margin，从而组织嵌入空间。

## 模型类型与训练

**Base / Instruction-tuned / Reasoning model**：base 只做下一 token 预测、不可靠听指令；instruct 经 SFT+偏好优化能听指令对话(产品默认用它)；reasoning 进一步训练成回答前先花 test-time compute 做内部思维链。

**Parametric vs Non-parametric knowledge(参数化/非参知识)**：参数化=固化在权重里、截止训练日、难溯源；非参=推理时经检索注入、可保鲜可溯源。RAG 就是注入非参知识。

**Pretraining objectives**：MLM(掩码语言建模，BERT)、CLM/自回归(GPT)、PLM(排列语言建模，XLNet)。

**Catastrophic forgetting(灾难性遗忘)**：模型学新知识时覆盖旧知识；微调持续学习的核心难题。

**SFT(Supervised Fine-Tuning，监督微调)**：用带标签的输入-输出对教模型做特定任务。

**PEFT(参数高效微调)**：只更新一小部分参数的微调家族(Adapter、LoRA、QLoRA、Prompt Tuning)。

**LoRA / QLoRA**：LoRA 用低秩矩阵近似权重更新、只训练这部分；QLoRA 在量化基座上做 LoRA，进一步省显存。

**RLHF / DPO / GRPO**：对齐三法——RLHF 用奖励模型+RL 对齐人类偏好；DPO 直接在偏好数据上优化、省去奖励模型；GRPO 用组内相对比较、面向可验证奖励(常见于推理训练)。

## 解码与推理控制

**Temperature / Top-p**：temperature 缩放采样分布(低=确定、高=多样)；top-p(核采样)只在累计概率达 p 的最小 token 集里采样。抽取/分类/工具调用用低温。

**Reasoning / thinking budget(思考预算)**：控制推理模型答前花多少 test-time compute 的旋钮——难题调高、常规调低。

**Self-consistency(自一致)**：对同一问题采样多条推理路径、取多数答案；对有可验证答案的任务有效，代价是多倍 token。

**Overthinking / inverse scaling(过度思考/逆向缩放)**：某些(尤其简单)问题上，更多推理反而让模型答得更差。

## Prompting 与上下文工程

**Context engineering(上下文工程)**：决定什么进入上下文窗口(指令、检索、工具结果、记忆、示例)、如何排序与格式化——常比措辞更关键。

**Context rot(上下文腐烂)**：输入变长时模型准确率下降，即便相关信息都在、窗口没满。长上下文不是免费升级。

**Compaction(上下文压缩)**：定期把累积的长上下文换成保留决策/事实/目标的短摘要，用于长程 agent 与多轮对话。

**Lost in the middle(中间迷失)**：模型对上下文首尾信息利用最好、中间最差；故要少而精、把最相关内容放两端。

**Few-shot / Zero-shot / CoT**：few-shot=给几个示例定格式；zero-shot=只给指令(能力强的模型默认足够)；CoT=让模型分步推理(推理模型内部已做，别再强加)。

**Structured output(结构化输出)**：用 provider 的 schema/工具调用约束模型产出合法 JSON，并在代码里校验——别用正则从散文里抠字段。

**Prompt injection(提示注入)**：输入文本覆盖你的指令、劫持应用行为。direct=用户直接输入；**indirect(间接)**=恶意指令藏在被模型摄入的外部内容里(检索文档、网页、工具结果)，更危险。

**Jailbreak(越狱)**：诱导模型违反自身安全训练、产出应拒绝的内容——目标是模型的护栏(与 injection 目标是你的应用不同)。

## RAG

**RAG(检索增强生成)**：把外部知识经检索注入上下文再生成，让答案保鲜、可溯源、可控。

**Chunking(分块)**：把文档切成检索单元；在召回与精度间权衡，优先结构感知切分+小重叠。

**Dense / Sparse / Hybrid retrieval**：dense(向量)按语义匹配；sparse(BM25/关键词)按词面匹配；hybrid 融合两者(如 RRF)，生产中通常最优。

**Reranker(重排器)**：二阶段模型(常为 cross-encoder)对候选与查询联合打分，精度远高于一阶段向量相似度。"多召回、后重排"。

**ANN / HNSW / IVF / flat**：flat=精确暴力(小库/基线)；HNSW=图索引(低延迟高召回、内存大)；IVF=倒排聚类(省内存、需训练调参)。

**Contextual retrieval(上下文检索)**：Anthropic 提出，嵌入前给每个 chunk 前置一段模型生成的定位描述，解决"chunk 脱离上下文"。

**Late chunking(晚分块)**：用长上下文嵌入模型先整篇编码、再池化成 chunk 向量，让每个 chunk 向量自带全文语境、无需加文本。

**HyDE / Query rewriting(查询改写)**：改写/扩展查询，或让模型先草拟一个假想答案再嵌入检索(HyDE)，对口语化/含糊查询有帮助。

**Query routing(查询路由)**：先给查询分类、送到合适的索引/数据源，是 RAG 通向 agentic 检索的边界。

**Agentic RAG**：让 agent 主导检索——决定是否检索、改写查询、迭代多轮、跨源选择——用于多跳/复杂问题。

**GraphRAG**：从语料建实体-关系知识图谱、在图结构上检索，擅长全局/多跳关系型问题。

**RAG triad(RAG 三元评估)**：context relevance(检索是否相关)、faithfulness/groundedness(答案是否忠于上下文)、answer relevance(是否答到点)——三者共同定位失败在哪一环。
_避免_：只看一个总分

**Faithfulness(忠实度)**：答案是否被检索到的上下文支持、无捏造；RAG 与幻觉治理的核心指标。

**Refusal / unanswerable(优雅拒答)**：语料覆盖不到时系统应说"我没有这个信息"而非幻觉；靠"只依据上下文作答"+检索分阈值实现，是 take-home 的关键信号。

## Agents

**Agent**：给 LLM 加上工具、记忆与循环，使其能行动、观察结果、迭代逼近目标——区别于单次调用。仅当任务确需多步动态控制时才用。

**Workflow vs Agent**：workflow=代码里预定的固定步骤序列(可预测、易测)；agent=运行时自行决定下一步(灵活但难保证)。能用 workflow 就别用 agent。

**ReAct**：思考→行动(调工具)→观察→循环，直到收尾；多数工具型 agent 的骨架，风险是空转与推理偏离观察。

**Function calling / Tool use(工具调用)**：把工具以 schema(名/描述/参数)描述给模型；模型只发出结构化调用请求，由你的代码执行并把结果喂回。

**MCP(Model Context Protocol)**：连接 agent 与外部工具/数据的开放标准——一次接入、处处复用，把"造工具"和"造 agent"解耦。

**A2A(Agent-to-Agent)**：agent 之间发现、委派、协作的协议(横向)；与 MCP(纵向连工具)互补。

**Agent memory(记忆)**：短期=当前上下文(近期消息、工具结果、草稿)；长期=跨会话持久、外部存储按需检索(事实、偏好、过往结果)。

**Orchestrator-worker / Sub-agent(编排者-工作者)**：编排者拆任务、委派给各带独立上下文的子 agent、再综合；隔离上下文是关键，子 agent 应回传"短结构化结果"而非原始轨迹。

**Autonomy-control tradeoff(自主-控制权衡)**：自主越高越灵活但越难保证；按"犯错代价+路径可指定性"给最小够用的自主，随 eval/监控证明可靠再放权。这常是 agent 设计的真正决策。

**Compounding errors(误差累积)**：每步 95% 可靠、20 步任务成功率仅 $0.95^{20}\approx36\%$——高单步准确率仍得低任务可靠率。故要少而可靠的步骤+逐步核验。

**pass^k**：agent 在同一任务 k 次独立尝试是否全部成功——衡量一致性/可靠性，比平均准确率更贴近生产要求。

## 评估

**LLM-as-judge**：用模型按 rubric 打分/比较，规模化评估；失败模式:位置偏差、冗长偏差、自我偏好、不一致——必须先对人工标注校准再信任。

**Calibration(校准)**：把 judge 对齐人工参考集、测一致率(常目标 85~90%)后再用它做门禁。

**Pointwise vs Pairwise**：pointwise 给单个输出按 rubric 打绝对分(适合 CI 门禁)；pairwise 两两比优劣(适合选型，需随机顺序防位置偏差)。

**Error analysis(错因分析)**：读一批真实失败、逐条打标、聚成失败模式分类——从业者公认最高杠杆的评估活动，直接指向该修哪。

**Eval-driven development(评估驱动开发)**：LLM 时代的 TDD——先定 eval 集与验收线，任何 prompt/模型/检索改动都先过 eval 才合并;接入 CI 阻断回归。

**Drift(漂移)**：质量缓慢下滑而基础设施指标(延迟/错误率)不变(provider 更新模型、输入分布变、语料变陈)；靠对线上流量抽样打分捕捉。

**Contamination / Saturation(污染/饱和)**：基准题泄进训练数据(污染)或前沿模型齐聚天花板(饱和)，都让榜单分数失去区分力——信自己数据上的私有 eval。

**Reward hacking / Eval gaming**：系统优化被测代理指标而非真实目标(如钻 judge 冗长偏差的空子)。

## 生产工程与安全

**延迟-吞吐-成本三角**：单请求快(latency)、每秒能服务多少(throughput)、每请求多少钱(cost)三者不可兼得，先定约束再调。

**TTFT vs Inter-token latency**：TTFT=首 token 出现前的时间(受 prefill/输入长度主导)；inter-token=其后每 token 的吐字速度(受 decode/访存主导)。

**Prompt caching / KV caching**：复用共享前缀的 KV 计算，让重复的长系统提示/工具 schema/上下文被大幅折扣——把稳定可缓存部分放前面。

**Semantic caching(语义缓存)**：新查询与历史查询语义相似即直接返回旧答案、完全免调用；风险是"近似命中"给出微妙错误答案，需调阈值。

**Speculative decoding(投机解码)**：小"草稿"模型先猜几个 token、大模型一次性校验，换取更低延迟且不改输出质量。

**Continuous batching(连续/在途批处理)**：token 级调度、随时加入新请求并退出已完成的，让 GPU 不空转、吞吐倍增。

**Model routing(模型路由)**：按任务难度把常规路径分给便宜快的模型、只把难例升级到强模型/推理模型。

**Guardrails(护栏)**：模型外的确定性校验层——输入护栏(检测注入/越狱、脱敏、限长)与输出护栏(schema/grounding 校验、PII/毒性过滤、拒绝执行不安全动作)。

**Excessive agency(过度自主)**：agent 拥有超出任务所需的能力/权限/自主，一旦出错或被注入危害巨大；靠最小权限、只读凭证、高危动作需人审来防。OWASP 命名风险。

**Tool poisoning(工具投毒)**：恶意 MCP server 在工具元数据(名/描述/参数文档)里藏指令，被 agent 当可信读取——一种危险的间接注入。

**OWASP Top 10 for LLM**：LLM 应用最关键安全风险的社区清单(注入、不安全输出处理、敏感信息泄露、过度自主、供应链/数据投毒等)，用作威胁建模的检查表。

**Observability(可观测)**：端到端追踪每次请求(拼装的上下文、检索命中与分数、每次工具调用、输出、token、各阶段延迟与成本)，并对质量指标漂移告警。

## 多模态

**VLM(Vision-Language Model，视觉语言模型)**：图像经编码器变成视觉 token、投影到与文本同一嵌入空间，模型对图文 token 一起做注意力。图像消耗大量 token。

**CLIP / DALL-E**：CLIP 用对比学习把图文对齐到共享嵌入空间;DALL-E 从文本描述生成图像。

**VLP(Vision-Language Pre-training)**：在大规模图文数据上预训练通用跨模态表示，再微调到具体视觉-语言任务。

## 通用评估指标

**Perplexity(困惑度)**：衡量模型预测文本的好坏，越低越好；但过度依赖会忽略连贯性、事实性等。

**BLEU / ROUGE**：BLEU 用于机器翻译、ROUGE 用于摘要，比对生成与参考的重叠。

**Hallucination(幻觉)**：模型产出流畅但不实的内容;因为它预测"像样的文本"、无内建真值观。无法根除，只能减少(grounding)、检测(eval/引用核验)、控制(显示来源、高风险转人工)。

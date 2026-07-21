# 大模型算法面试 Glossary

这门课的标准术语。所有微课、自测、学习记录都以此为准。术语保留通行英文原文,释义用一两句话说清"它是什么"。

## Transformer 与注意力

**Self-Attention(自注意力)**:
序列中每个位置用自己的 Query 去和所有位置的 Key 算相似度,再对 Value 加权求和得到新表示。Q、K、V 全部来自同一段输入。
_Avoid_:自关注、内部注意力

**QKV**:
由同一输入经三套可学习权重投影得到的 Query(要找什么)、Key(信息标签)、Value(信息内容)。

**Scaled Dot-Product Attention(缩放点积注意力)**:
$\operatorname{softmax}(QK^\top/\sqrt{d_k})V$。除以 $\sqrt{d_k}$ 是为了让点积方差回到 1 附近、避免 softmax 饱和导致梯度消失。

**Multi-Head Attention(多头注意力,MHA)**:
把 $d_{model}$ 切成 $h$ 份,各头在独立子空间做注意力再拼接投影;总算力与单头相当,但能并行学多种关系。

**MQA / GQA / MLA**:
注意力的省显存变体。MQA=所有头共享一组 K/V;GQA=分组共享(MHA 与 MQA 的折中);MLA=把 K/V 压成低维 latent 缓存、计算时解压(DeepSeek)。

**KV Cache**:
自回归推理时缓存历史 token 的 K、V 向量,避免每步重算前缀。是长上下文与高并发下的主要显存瓶颈。

**RoPE(Rotary Positional Embedding,旋转位置编码)**:
用与位置相关的旋转矩阵变换 Q、K,使注意力点积自然依赖相对位置 $m-n$,利于长度外推。
_Avoid_:旋转编码

**FlashAttention**:
一种 IO 感知的精确注意力实现:分块 + 在线 softmax,不落地完整 $n\times n$ 分数矩阵,减少 HBM 读写。数学等价、更快更省显存,不是近似。

**MoE(Mixture of Experts,专家混合)**:
用多个专家 FFN + Router 门控,每 token 只激活 Top-K 专家(稀疏激活),让总参数量与激活算力解耦。

**RMSNorm**:
LayerNorm 的简化:只做均方根缩放、去掉减均值项,更省算力,现代 LLM 常用。

## 预训练与架构

**Causal LM(因果语言模型)**:
只能看到左侧上下文、预测下一个 token 的单向语言模型(GPT 系)。
_Avoid_:自回归 LM(自回归指生成方式,不完全等价)

**MLM(Masked Language Model,掩码语言模型)**:
随机遮盖部分 token、用双向上下文预测被遮部分的预训练目标(BERT)。

**decoder-only**:
只保留 Transformer 解码器堆叠的架构,当今主流 LLM 的选择(训练高效、zero-shot 泛化好、KV Cache 友好)。

**BPE(Byte-Pair Encoding)**:
把高频字符对反复合并成子词单元的分词算法,平衡词表大小与未登录词问题。
_Avoid_:字节对编码(中文语境保留英文)

## 微调与对齐

**SFT(Supervised Fine-Tuning,监督微调)**:
用"指令→期望回答"的成对数据继续训练,只对回答部分算 loss,教模型"按指令输出"。

**PEFT(Parameter-Efficient Fine-Tuning,参数高效微调)**:
冻结绝大部分权重、只训练少量新增/低秩参数的一类方法(LoRA/Adapter/Prefix/P-Tuning)。

**LoRA**:
冻结原权重 $W_0$,把增量约束为低秩 $BA$:$W'=W_0+BA$。核心超参是秩 $r$ 与缩放 $\text{lora\_alpha}$;推理可合并回权重、不增延迟。

**QLoRA**:
在 4bit(NF4)量化的基座模型上训练 LoRA,配双重量化与分页优化器,让单卡也能微调大模型。

**RLHF(Reinforcement Learning from Human Feedback)**:
三阶段对齐:SFT → 训练奖励模型 RM → 用 RL(如 PPO)优化策略,使输出更"有用/无害/诚实"。

**RM(Reward Model,奖励模型)**:
用成对偏好数据(chosen/rejected)训练、给回答打分的模型,为 RL 阶段提供奖励信号。

**PPO(Proximal Policy Optimization)**:
actor-critic 的策略优化算法,用 clip 限制新旧策略比、加 KL 惩罚防跑偏,是经典 RLHF 的 RL 步。

**DPO(Direct Preference Optimization)**:
跳过显式奖励模型,直接用偏好对做分类式损失优化策略,等价于优化一个隐式奖励,更省更稳。

**GRPO**:
去掉价值网络,用同一 prompt 采样一组输出、以组内相对优势更新的策略优化(DeepSeek 用于推理模型)。

**灾难性遗忘(Catastrophic Forgetting)**:
在窄数据上微调后,模型原有通用能力显著退化的现象。可用混入通用数据、PEFT、小学习率缓解。

## RAG 与检索

**RAG(Retrieval-Augmented Generation,检索增强生成)**:
先从外部知识库检索相关片段、拼进 prompt 再生成,用于补时效/私域知识、降幻觉、可溯源。

**Chunking(分块)**:
把文档切成适合检索的片段。块太大稀释相关性、太小丢上下文;常用定长+重叠或按语义/结构切。

**Embedding(向量化)**:
把文本映射为稠密向量,使语义相近的文本在向量空间中距离相近,用于向量检索。

**Rerank(重排)**:
用 cross-encoder 对初步召回的候选做精排;召回追求"不漏"、精排追求"排得准",分工协作。

**BM25**:
经典词面检索打分:词频饱和(TF)× 逆文档频率(IDF)× 文档长度归一。常与向量检索融合成混合检索。

**混合检索(Hybrid Search)**:
同时用向量(语义)与 BM25(词面)召回并融合分数(如 RRF),弥补纯向量对稀有词/精确匹配的漏检。

**幻觉(Hallucination)**:
模型生成看似合理但与事实不符的内容。根因是概率式生成缺乏事实约束;靠 RAG 证据、约束、校验、对齐缓解。

## Agent 与工程

**Agent(智能体)**:
以 LLM 为大脑,叠加规划、工具调用与记忆,形成"感知—决策—行动"闭环的系统。

**ReAct**:
让模型交替进行推理(Reasoning)与行动(Acting)的 agent 范式:想一步、调一次工具、看结果再想。

**Function Calling / Tool Use**:
模型按预定义 schema 输出结构化的工具调用请求,由外部执行后把结果回灌给模型。

**MCP(Model Context Protocol)**:
标准化 agent 与外部工具/数据源连接方式的协议;与"Skill(可复用能力封装)"是不同层面的概念。

**DDP(Distributed Data Parallel)**:
多进程数据并行:每卡一份完整模型,各算各的梯度再 all-reduce 同步;比老式 DP 高效。

**ZeRO**:
DeepSpeed 的显存优化:阶段 1/2/3 依次切分优化器状态 / +梯度 / +参数,用通信换显存。

**量化(Quantization)**:
把高精度权重/激活映射到低比特整数(INT8/INT4)以省显存、提速。AWQ 激活感知保护重要通道;GGUF 是 llama.cpp 的权重格式。

**PagedAttention**:
像操作系统分页那样管理 KV Cache,消除显存碎片、提高利用率,是 vLLM 高吞吐的核心。

**Continuous Batching(连续批处理)**:
推理时动态地把新请求插入正在运行的 batch,提升 GPU 利用率与吞吐。

## 评估

**F1**:
精确率与召回率的调和平均 $F_1=2PR/(P+R)$,分类/抽取类任务的常用综合指标。

**LLM-as-Judge**:
用一个更强的 LLM 按评分标准对生成结果打分的评估方式,弥补 BLEU/ROUGE 对开放生成的不足。

**忠实度(Faithfulness)**:
RAG 场景下,答案是否严格由检索到的证据支撑(不外推、不编造),与"相关度"共同衡量 RAG 质量。

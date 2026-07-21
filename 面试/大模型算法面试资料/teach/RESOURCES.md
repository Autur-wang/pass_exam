# 大模型算法面试 Resources

策展的可信来源。微课的知识优先取自这里,而非凭空生成。分 Knowledge(知识)与 Wisdom(社区)。

## Knowledge — 本仓库一手材料(课程直接来源)

- **`../面试专题/`**(transformer相关 / 强化学习相关 / rag优化 / agent相关 / 微调相关 / 部署-推理加速)
  各主题最深、含公式与代码。用于:注意力变体、MoE、RoPE、PPO/DPO/GRPO、RAG 优化、Agent 范式的原始依据。
- **`../大模型基础/`**(Transformer模型结构 / GPT&Bert&T5 / 大模型的泛化能力 / 训练与推理 / 向量数据库 / CNN·RNN 基础)
  概念问答与 PyTorch 代码。用于:Transformer 结构、decoder-only、Tokenizer/BPE、SFT/RM 数据格式、量化取舍、向量库对比。
- **`../微调/`**(LoRA..ETC / 微调优化 / fine-tune参数解释)
  用于:LoRA/Adapter/Prefix/P-Tuning 原理、PEFT vs 全量、SFT 数据构建、微调超参。
- **`../综合题库/所有面试合并总结.md`**
  全库最有价值的"题库索引":RoPE 长文 + 面经七大类分类 + 24/25 年题目汇总。用于:定高频考点、串联主题。
- **`../公司面经/`(2024–2026,68 篇)**
  真实面试记录。用于:校准"面试怎么考"、提炼追问、感受不同岗位(通用/RAG/Agent/风控)的侧重差异。

## Knowledge — 经典一手论文(深挖时读,每节 `.paper` 框会点名)

- **Attention Is All You Need**(Vaswani et al., 2017)——Transformer 与缩放点积注意力原始论文。用于:0001–0005。
- **RoFormer: Enhanced Transformer with Rotary Position Embedding**(Su et al., 2021)——RoPE 原始论文。用于:0004。
- **GQA: Training Generalized Multi-Query Transformer**(Ainslie et al., 2023)——用于:0007。
- **FlashAttention**(Dao et al., 2022)——IO 感知注意力。用于:0008。
- **LoRA: Low-Rank Adaptation of Large Language Models**(Hu et al., 2021)与 **QLoRA**(Dettmers et al., 2023)——用于:0013–0014。
- **InstructGPT / Training LMs to follow instructions with human feedback**(Ouyang et al., 2022)——RLHF 范式。用于:0017、0019。
- **DPO: Direct Preference Optimization**(Rafailov et al., 2023)与 **DeepSeekMath(GRPO)**(Shao et al., 2024)——用于:0020。
- **Efficient Memory Management for LLM Serving with PagedAttention(vLLM)**(Kwon et al., 2023)——用于:0029。
- 说明:课程正文不写死这些论文的具体数字/结论,只作为深挖入口;引用前应自行核对。

## Wisdom — 社区

- **Hugging Face**(模型/数据集/`transformers`·`peft`·`trl` 文档)——用于:微调、PEFT、SFT/DPO 的工程实现与 API。
- **各家技术报告**(LLaMA / Qwen / DeepSeek / GLM 官方 report)——用于:架构对比的权威口径(0011),优于二手转述。
- **vLLM / SGLang 官方文档与仓库**——用于:推理部署、PagedAttention、continuous batching(0029)。

## Gaps(明确的缺口,驱动后续补充)
- **多模态 VLM**:源材料偏薄(`vlm相关.md` 仅问题+片段),尚不足以支撑成节;如要覆盖需另找一手材料。
- **具体 benchmark 数字**:面经与笔记多为定性,课程刻意不写死量化结论;需要时查各家 report/leaderboard。

# Mission: 生成式 AI / AI 工程师面试冲刺

## Why
在生成式 AI / AI 工程师岗位的面试里,当场把面试官真正会问的高频题——从 Transformer、embedding、prompting，到 RAG、Agent、评估、成本延迟、安全、系统设计——一簇一簇地答清楚、答得住追问，把"读过很多资料"变成"面试台上给得出工程师级别的答案"。

## Success looks like
- 面对基础题(自注意力为什么除以 √dₖ、GPT vs BERT、embedding 是什么、token 化为什么重要)能不打草稿地给出准确、有"为什么"的回答。
- 能完整讲一遍 RAG 链路(分块→向量化→dense/sparse/hybrid 检索→rerank→生成→引用核验)与每一步的取舍，并答得出"检索为什么反而更差""百万上下文是否淘汰 RAG""企业级权限怎么做"。
- 能讲清 Agent 与 workflow 的边界、ReAct/function-calling/MCP、记忆与 orchestrator-worker 编排、以及"为什么每步都对、整条链却失败"(误差累积)与 pass^k。
- 能就评估(LLM-as-judge 的偏差与校准、error analysis、eval-driven CI、drift、benchmark 污染)、成本延迟(TTFT vs inter-token、prompt/KV/语义缓存、model routing)、安全(direct/indirect injection、tool poisoning、excessive agency、guardrails、OWASP)给出有判断力的回答。
- 能用一套方法论现场拆一道系统设计题(客服 agent、千万文档企业 RAG、降 p95 延迟、幻觉检测系统)，并在每个选择处点出取舍。
- 能答好工程判断题:prompt/RAG/微调/agent 四选一、何时"别用 LLM"、build vs buy、如何衡量 AI 功能真实价值、prototype→production 的鸿沟。

## Constraints
- 载体是可离线打开的 HTML 微课，零外部依赖(样式与 KaTeX 均在本地 `assets/`)。
- 每节 10~12 分钟、只攻**一簇高频面试题**；体例:先回忆→直觉/原理→关键定义→🎯面试怎么考→⚠面试易错点→自测→📄延伸→上下课导航。
- 内容**锚定本仓库真实资料**:两大真题库(`interview_prep/60_gen_ai_questions.md` 62 题 + `interview_prep/roles/ai-engineer/questions.md` 145 题)为骨，`resources/*_101.md` 与 `free_courses/` 为肉；不编造 benchmark 数字、论文结论与不存在的题目。
- 数学用 LaTeX 由本地 KaTeX 渲染；本课偏应用，公式点到为止(注意力、triplet loss、误差累积 0.95²⁰ 之类)。

## Out of scope
- 软性面 / HR 话术、行为面、谈薪——`interview_prep/60_gen_ai_questions.md` 之外的软性 track 不进本课主线。
- 非 AI-Engineer 岗位专属内容(AI 产品经理、AI 策略师、Forward-Deployed 的产品/策略/商业题)——源仓库另有 `roles/` 目录，本课只借其技术交集。
- OpenClaw 个人助理 10 天搭建、外部课程目录(`courses.md`)、月度论文清单(`research_updates/`)——属导航/资讯，归 RESOURCES 与「📄延伸」，不做成课。
- 手撕代码题与传统机器学习(SVM/XGBoost/PCA)——不在本源材料范围。

# 生成式 AI / AI 工程师面试冲刺课建成并全量核验(31 节)

`面试/生成式AI学习指南/teach/` 作为一个**全新 teach workspace**(此前只有空脚手架:4 个 FORMAT + SKILL.md)已建成完整课程:31 节自成一体 HTML 微课(0001-0031)+ 门户 `index.html` + 自包含 `assets/style.css` + **本地内嵌 KaTeX**(`assets/katex/`,596K,只留 woff2,离线数学)+ MISSION/NOTES/GLOSSARY(约 90 词)/RESOURCES + 打印速查表 `reference/cheatsheet.html`。真实源 = 同级《生成式AI学习指南》(**awesome-generative-ai-guide**,Aishwarya Naresh Reganti,MIT)。10 部分:基础与 Transformer → Embedding 与向量检索 → Prompting 与上下文工程 → 微调与对齐 → RAG → Agents → 推理模型 → 评估 → 生产/幻觉/安全 → 多模态与系统设计。

**这改变未来会话的什么**:教「生成式 AI / AI 工程师面试」走这门课,**交互式授课不要重建**;加课从 0032 起。它与仓库内其他四门课([[llm-algo-interview-course]] 大模型算法面试、[[interview-prep-course]] 编程面试、[[eng-leadership-course]] 工程领导力、[[agent-dev-two-track-course]] agent 开发)互不共用装置与术语。用户决策已定:**主线=面试冲刺版**(以两大真题库为骨,AI 工程师岗为主骨)、**每课都落到面试**。

**关键设计:骨=真题库,肉=101 指南/free_courses。** 与 [[llm-algo-interview-course]] 的"概念为脊"不同,这门课的脊是**真实面试题**——`interview_prep/60_gen_ai_questions.md`(62 题,GAN/VAE/Transformer/多模态/Embedding/训练推理,偏理论)+ `interview_prep/roles/ai-engineer/questions.md`(**145 题**,10 主题,2025-2026 时效,偏应用)。两库互补(前者学术、后者工程),按主题**聚类**成课而非并列两份清单。每节课=一簇高频真题,深答到面试级。区别于 [[interview-prep-course]] 那种 README 链接农场:这里源是真材实料,策略="抽取+结构化+补为什么+落到答法"。

**建法(可复用于"为真实题库生成一套面试冲刺课")**:① 亲读两大题库全文(62+145 题)+ 子代理测绘 6 份深度指南 → 编排 10 部分 31 课;② **assets 直接复用** [[llm-algo-interview-course]] 的本地 KaTeX(596K)+ style.css(220 行、装置齐),省去重建;③ 手写并浏览器验收金标准 0002(自注意力+多头);④ **把每节 spec 的事实底座嵌进 fanout 脚本**——逐字源真题 + 我亲读题库后提炼的答案精髓,让 30 个并行 agent"组织给定要点"而非"回忆知识"(幻觉面大幅收窄);⑤ Workflow 扇出(30/30、0 error、0 skip、0 empty、1.4M token、约 12 分钟)。

**关键教训 · 扇出的事实底座决定正确性**:上门课(llm-algo)源是真笔记但 agent 仍需自找细节;这次把答案精髓写进 spec,配显式反幻觉纪律(ReAct 标注 Yao et al. 真实出处、安全数字须回读原文、绝对措辞给反例、源里没有的就说没有)。核验证实有效:0028 的安全统计(94.4% 注入脆弱、58-59% 监控 vs 37-40% 遏制)全部匹配源文件真实数字且正确 hedged;0021 的 agent 把我给的 `0.95²⁰≈36%` 种子**正确外推**成完整衰减表(5 步 77%、10 步 60%、50 步 8%,皆真为 0.95ⁿ);0025(成本延迟,最易编"降本 40%"的地方)**零百分比**、全程定性。"用编排换正确性":前期把事实喂准,后期少踩坑。

**关键教训 · KaTeX `<` 陷阱这次零发生**。上门课 8/31 中招(行内 `$a<b$` 的 `<` 被浏览器 HTML 解析器吃掉致不渲染、且不报 `.katex-error`,只有残留 `$` 暴露)。这次在 fanout spec 里**前置显式警告**"数学里任何 `<`/`>` 必须写 `&lt;`/`&gt;`",且本课偏应用、公式少,7 节数学重课(0001/0002/0006/0011/0012/0017/0021)DOM 实测残留 `$`=0、`.katex-error`=0、leaked entities=0。教训:把已知陷阱写进 spec 的成本极低、收益极高。

**Evidence(核验结论)**:结构 31/31 全绿(自成一体、link 一份 style + 本地 katex、装置齐、标签闭合)、**零死链**(用精确文件名 grounding,门户 31 链 + 各课 prev/next 全对);DOM/KaTeX 无头渲染实测——门户(10 卡片、31 链、0 缺失、0 溢出)+ 8 节抽验(math 0/4/6/7/11/14/40/58 渲染、error 全 0、残留 `$` 全 0、overflow 全 0、console error 0);反幻觉全量扫描——`N 倍`(仅 0003 的 O(n²) 正确推导)、所有百分比(0.95ⁿ 计算 / 源真实统计 / 教学举例)、ReAct 归因(6 课皆 Yao et al. 2022)均真实非编造;深色模式由 KaTeX currentColor 保证。上游源(两大题库/101 指南/free_courses/LICENSE)只读原封,课程全在 `teach/` 内。

相关:[[workflow-schema-side-effect-skip]](写文件的 fanout agent 不加 schema)、[[absolute-wording-hallucination-fingerprint]](绝对措辞是幻觉指纹,gotcha 里逐条给反例)、[[llm-algo-interview-course]](assets 与建法母本)。

# 大模型算法面试精读课建成并全量核验(31 节)

`面试/大模型算法面试资料/teach/` 作为一个**全新 teach workspace** 已从空脚手架建成完整课程:31 节自成一体 HTML 微课(0001-0031)+ 门户 `index.html` + 自包含 `assets/style.css` + **本地内嵌 KaTeX**(`assets/katex/`,离线数学渲染)+ MISSION/NOTES/GLOSSARY(约 45 词)/RESOURCES + 打印速查表 `reference/cheatsheet.html`。真实源是同级《大模型算法面试资料》——**真材实料的笔记 + 68 篇公司面经**(不同于"编程面试大全"那种链接农场)。9 部分:Transformer 精讲 → 注意力与架构进阶 → 预训练模型家族 → 微调 PEFT → 对齐与强化学习 → RAG → Agent → 训练推理工程 → 评估与数据。

**这改变未来会话的什么**:教「大模型算法/AI 工程师面试」走这门课,不要重建;它以**仓库真实资料**为源(每节锚定源笔记的真实内容 + 68 篇面经提炼的高频考点),与仓库内其他课([[interview-prep-course]] 编程面试、operating_systems、[[agent-dev-two-track-course]] agent开发)互不共用装置与术语。用户决策已定:范围=技术核心版 31 课(软性面/HR 话术、手撕算法、传统 ML、多模态 VLM **主动排除**,见 MISSION Out of scope);难度=均衡(前半直觉、后半面试要点);数学=**本地内嵌 KaTeX**。授课按仓库教学人设交互式推进(复述→补缺→AskUserQuestion 出题),不要一次讲满。加课从 0032 起。

**内容权重锚定面经真实频次**(非平均用力):项目深挖(~41)、微调数据(~37)、RAG(~31)、Agent(~30)、效果评估(~29)最高频;强化学习 PPO/DPO/GRPO 在 2025→2026 面经明显升温;纯理论(MoE ~6、KV Cache ~7)讲透即可不展开。

**建法(可复用于「为真实资料/仓库生成一套带公式的技术课」)**:① 子代理全量测绘源材料的形态/主题/面经高频度 → 编排 9 部分 31 课;② **KaTeX 本地化先行**:npm pack 下 KaTeX、只留 woff2(596K)、建同构 head 的测试页用无头浏览器验证 `file://`/`http://` 下离线渲染成立(查 `document.fonts` 确认字体真加载、非降级);③ 手写并浏览器验收金标准 0002(自注意力),锁定房屋风格 + 装置 + KaTeX 用法;④ 磁盘 spec(BRIEF + 每节 sources/prev-next)+ Workflow fan-out 克隆金标准。

**关键教训 · KaTeX 嵌 HTML 的 `<` 陷阱**:行内公式 `$a<b$` 里的 `<` 会被浏览器 HTML 解析器(在 KaTeX 运行前)当成标签起始吃掉,导致该公式不渲染——且不报 `.katex-error`、控制台无错,**只有"渲染后仍有残留 `$`"能暴露**。源材料/agent 写的 LaTeX 里凡有 `<`/`>` 关系符,HTML 源码必须写 `&lt;`/`&gt;`。本轮 8/31 课中招,已批量修复。**推论:核验数学必须三层并查——console 错误、`.katex-error`、残留 `$`;单看任一层都会漏。**

**关键教训 · 批量正则改数学/HTML 混排极危险**:修 `<` 陷阱的正则对 `$$` 收尾边界处理不严,把紧邻展示公式的真 `<em>` 标签误转义成 `&lt;em&gt;`(引入回归)。被一条**正交**的检查(数学区裸中文散文扫描)逮住——多角度核验的价值:一个检查的盲区被另一个覆盖。教训:改 HTML 里的数学定界符,`$` 配对边界必须严格,改完必须回渲染验证。

**关键教训 · 编排韧性再获印证**:Workflow 后台跑到一半随进程退出被中断(落盘 22/31),但**已落盘课在项目目录持久、Workflow transcript 在 .claude/ 持久**,恢复代价极小——重建 9 节脚本干净跑一遍即可([[workflow-resume-replays-writes]])。但 `/private/tmp` 的 scratchpad 会被跨进程清掉(脚本/BRIEF 全没),教训:spec 应写进项目目录而非 tmp。写文件的 workflow agent 不加 schema([[workflow-schema-side-effect-skip]])。

**Evidence(核验结论)**:31/31 结构齐全(自成一体、link 一份 style + 本地 katex、装置齐、标签闭合);prev/next 链 0001↔0031 全对、**零死链**(这次用精确 slug grounding,避免了上门课猜 slug 造 10 处死链的问题);数学 6 节多样化重课(0002/0004/0007/0016/0019/0023)无头渲染实测——公式全渲染、`.katex-error`=0、残留 `$`=0、控制台零错;深色模式由 KaTeX currentColor 机制保证(母版阶段已用 `getComputedStyle` 证明公式色继承容器色、非硬编码);反幻觉抽查——"16 倍显存"(混合精度 Adam 标准账)、"15%"(BERT 真实掩码率)、"99%"(类别不均衡教学举例)均属真实非编造。

相关:[[absolute-wording-hallucination-fingerprint]](绝对措辞是幻觉指纹,gotcha 里已逐条给反例:快排最坏 O(n²)、Dijkstra 不能负权、MoE 不省显存、量化并非总不掉精度)。

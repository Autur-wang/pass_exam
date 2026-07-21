# OOP 面试问答冲刺课建成并全量核验(26 节)

`面试/面向对象面试问答/teach/` 作为一个**全新 teach workspace**(此前只有空脚手架:4 个 FORMAT + SKILL.md)已建成完整课程:26 节自成一体 HTML 微课(0001–0026)+ 门户 `index.html` + 自包含 `assets/style.css` + MISSION/NOTES/GLOSSARY(约 70 词)/RESOURCES + 打印速查表 `reference/cheatsheet.html`。**本课无数学,不加载 KaTeX**(与姊妹 AI 课的最大结构差异)。真实源 = 同级 `README.md`《52 Important OOP Interview Questions in 2026》(Devinterview.io)。8 部分:四大支柱 → 类的机制 → 关系与耦合 → SOLID → 设计模式 → Python 机制与跨语言 → 进阶工程 → 答题方法论。

**这改变未来会话的什么**:教「面向对象 / OOP 面试」走这门课,**交互式授课不要重建**;加课从 0027 起。用户决策已定:**范围=面试全景版**(15 道源题为核心骨架 + SOLID/设计模式/语言机制 canon,共 26 节)、**语言=Python 为主**(关键差异处对照 Java/C++/C#)。它与仓库内其他课([[llm-algo-interview-course]]、[[genai-interview-course]]、[[interview-prep-course]]、[[eng-leadership-course]]、[[front-end-interview-course]]、[[agent-dev-two-track-course]])互不共用装置与术语。注意与仓库内《面向对象高级编程 advanced_oop》(编程进阶课,非面试问答)区分,勿混。

**关键设计:骨=真题、肉=canon,且诚实分层。** 源 README 只完整答了前 15 题(Q1–Q15),Q16–52 在 Devinterview 付费墙后、仓库无原文。经用户决策取"面试全景版":15 题聚类成核心骨架(封装/继承/多态/抽象/类与对象/访问修饰符/重载/内聚/耦合/构造/析构/组合vs继承/关联),补齐 OOP 面试必考 canon(SOLID 三节、设计模式三节、MRO、鸭子类型/ABC/Protocol、相等哈希、值引用语义、现代建类工具、范式对比、答题法)。**每节的"📚权威出处与延伸"诚实标注**哪些来自源 README、哪些来自 canon(GoF / Robert C. Martin / Barbara Liskov / Python 官方 / Oracle Java 文档),不把 canon 冒充成源。

**建法(可复用于"为半封闭真题源生成面试冲刺课")**:① 亲读源 README 全文(仅 15 题有答案)→ 分层规划 8 部分 26 课;② **assets 不复用 AI 课的 KaTeX**(本课零数学),只借 style.css 结构、删数学段、加 `.crosslang`(🐍跨语言对照)装置、把 `.paper` 标签从"论文"改"权威出处";③ 手写并浏览器验收金标准 0002(封装,含 Python name mangling 演示);④ **把每节 spec 的事实底座嵌进 fanout 脚本**——逐字源题 + 我提炼的答案要旨 + 明确的"来源层"标注,让 25 个并行 agent"组织给定要点"而非"回忆知识";⑤ Workflow 扇出。

**关键教训 · 会话额度上限致 5 个 agent"失败但已落盘"**。扇出 25 个,workflow 报 20/25 返回、5 个(0022–0026)因 "session limit" 失败。但磁盘上 26 节齐全且完整(都以 `</html>` 收尾、装置齐、体积正常)——**agent 是先 Write 写盘、再准备回确认时才撞上限流,副作用早已发生**。教训延续 [[workflow-partial-agent-failure-and-neighbor-refs]]:workflow 的 `<failures>` 报"agent 终态"、非"副作用是否发生";**报告只定位嫌疑,磁盘/DOM 才定论**。因此没有盲目 resume 补跑(那会重放覆盖 20 个已好的文件),而是直接对 5 个"失败"文件做完整性体检确认可用。

**关键教训 · KaTeX `<` 陷阱换成"代码区 `<`/`>` 转义"**。本课无数学、但代码密度高(`if a &lt;= b`、`-&gt;` 注解、C++ 对照的 `vector&lt;int&gt;`、`cout &lt;&lt;`),同一个"裸 `<` 被 HTML 解析器吞掉致代码残缺且不报错"的坑照样存在。fanout spec 里把它列为"头号铁律",核验证实:26 节代码区裸 `<` 全 0、DOM leaked entities 全 0。

**Evidence(核验结论)**:① 结构 verify.py 26/26 全绿(存在性/编号连续/样式link/装置齐/**无外部依赖**/**零死链**(精确文件名 grounding,门户 26 链 + 各课 prev/next 全对)/标签闭合/代码转义);② DOM 全 26 页 fetch 实测——leaked entities 0、katex 引用 0、外部 script/link 0、每节 recall+interview+gotcha+quiz 装置齐、2 处 inline SVG(0019 diamond 图 260×200 正常渲染);③ 渲染抽验(0019 SVG / 0023 最大页 / 门户)overflow 全 0、无超宽元素;④ 反幻觉全 26 扫描——绝对措辞皆定义性正确/正确建议/主动破除误区/有语境限定(如"在 Java 里……接口是唯一出路"),无编造 benchmark(仅 3 处"90%/99%"口语化修辞),版本号(Java 8 default 方法、Java 9 弃用 finalize、C# 8、Python 3.10+ slots)全真实且带限定;⑤ 深色模式由 CSS 变量翻转保证。上游源(README/LICENSE 若有)只读原封,课程全在 `teach/` 内。

相关:[[workflow-schema-side-effect-skip]](写文件的 fanout agent 不加 schema)、[[workflow-partial-agent-failure-and-neighbor-refs]](agent 失败≠副作用未发生)、[[genai-interview-course]] / [[llm-algo-interview-course]](assets 与建法母本)。

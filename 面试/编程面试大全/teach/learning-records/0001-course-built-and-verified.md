# 编程面试精读课建成并全量核验(52 节)

`面试/编程面试大全/teach/` 作为一个**全新 teach workspace** 已从空脚手架(原只有 SKILL + 4×FORMAT)建成完整课程:52 节自成一体 HTML 微课(0001-0052)+ 门户 `index.html` + 自包含 `assets/style.css` + MISSION/NOTES/GLOSSARY(48 词)/RESOURCES + 打印速查表 `reference/cheatsheet.html`。真实源是 jwasham《编程面试大学 / coding-interview-university》的 README-cn 学习大纲(链接农场式),按核心链条 `审题→选对数据结构→估复杂度→写对代码→说清取舍` 组织成 13 部分。

**这改变未来会话的什么**:教「通用 DS&A + 系统设计面试」走这门课,不要重建;它以**仓库大纲**为源(每节锚定 README 真实主题小节 + 引用该小节精选的真实一手视频/文章),与仓库内其他课(operating_systems 期末、agent开发三门)互不共用装置与术语。用户决策已定:范围=完整精读版 52 课(长尾冷门 FFT/van Emde Boas/HyperLogLog/凸包/线性规划**主动排除**);难度=均衡(每节前半建直觉、后半落面试要点)。授课按仓库教学人设交互式推进(复述→补缺→AskUserQuestion 出题),不要一次讲满。

**建法(可复用于「为一份大纲/仓库生成一套课」)**:① 摸 README `- ### 主题` 锚点得真实骨架 → 编排 13 部分;② 手写并浏览器验收金标准 0007(数组),锁定房屋风格 + 8 装置(recall/keydef/bigo 表/interview/gotcha/implement/quiz/nav);③ 磁盘 spec(每节 README 行号区间 + scope + prev/next)+ 子代理 fan-out 克隆金标准。

**关键教训 · 编排要匹配环境可靠性**:本轮后台 fire-and-forget Agent 在 API 抖动下 **3/3 卡死、零产出还烧了 token**(卡在写盘前)。换成 **Workflow** 同样的活儿一次成功 10/10、0 错 0 空——差别在 Workflow 把重试/失败隔离/缓存 resume 做进编排层。**底层不可靠时,可靠性必须由编排层提供**(见 [[workflow-schema-side-effect-skip]]:写文件的 workflow agent 不能加 schema,否则跳过落盘——本轮已规避)。

**Evidence(核验结论)**:52/52 结构齐全(自成一体、只 link 一份自包含样式表、装置齐、标签闭合);prev/next 链 0001↔0052 全对;**抓修 10 处死交叉链接**(agent 猜兄弟课 slug,按锚文本意图映射修复);**190 条外部一手链接逐条比对 README 零编造**;0007/0018/0045(深色)/0052 等 8+ 页 headless 渲染确认 SVG 树/字典树/一致性哈希环/bigo 表/cells/pipeline 在深浅色可读、控制台零报错。

相关:[[absolute-wording-hallucination-fingerprint]](复杂度声明「总是/唯一」类绝对措辞是幻觉指纹,已在 gotcha 里逐条给反例:快排最坏 O(n²)、哈希最坏 O(n)、Dijkstra 不能负权)。

# NOTES · 教学偏好与工作区约定

## 学习者画像与授课方式
- 学习者理解力强、要「为什么」讲透;授课按仓库教学人设**交互式推进**(先让其复述当前理解 → 补缺 → 用 AskUserQuestion 出选择题校验,打乱正确项位置,答前不公布答案)。
- 难度基线=**均衡**:每节前半建概念直觉(照顾复习/初见),后半落到面试怎么考、怎么答(照顾冲刺)。不从零讲变量,但也不默认深厚基础。
- **不要一次讲满**:一节课只攻一个窄主题;讲课时不要把整节 HTML 内容一口气念完,按阶段确认掌握再推进。

## 房屋风格(House Style)—— 每节课必须遵守
- 每节是**自成一体的 HTML**,放 `./lessons/`,命名 `NNNN-dash-case-topic.html`,编号递增。
- `<head>` 只 link **一个**样式表:`../assets/style.css`(自包含,零外部依赖);另加 `<link rel="icon" href="data:,">` 抑制 favicon 请求;`<html lang="zh-CN">`。
- **零外部资源**:不引 CDN、外部字体、远程图片、YouTube 内嵌。图示一律用内联 SVG 或 CSS 组件(见 style.css 的 `.cells`/`.pipeline`/`.flow`/`.bars`/`.dgm-*`)。外部一手资源只以**正文超链接**形式出现(面试时点开去看)。
- 每节结构(均衡版):`.meta` 页眉 → `h1` → `.lede` → `.recall`(先回忆,承上一课)→ 概念直觉+图 → `.keydef` 关键定义 → `table.bigo` 复杂度 → `.interview` 面试怎么考 → `.gotcha` 面试易错点 → `.implement` 自己写一遍 → `.quiz`(≥2 题,答案打乱位置)→ 主推资源(引 README 精选的**真实**一手链接)→ `footer.lesson-footer` + `.lesson-nav` 上下课导航。
- **教学法内建**:`.recall` 框实现检索练习(retrieval practice)、`.implement` 框对抗「看视频=会了」的 fluency 错觉、跨课 `<a>` 锚点实现交错(interleaving)。这是 skill 版 teach 的三条学习科学原则(见 SKILL.md「Fluency vs Storage Strength」)。

## 反幻觉纪律(本课的具体形态)
- DS&A 概念是教科书级共识,但**复杂度声明、算法性质(稳定性/原地/最坏情况)不能凭感觉写**——拿不准就对照 `../cheat-sheets/big-o-cheatsheet.pdf` 或权威源核。
- 引用的一手链接必须是 README-cn 里**真实收录**的那条,不要编造 URL。
- 「唯一/所有/总是」这类绝对措辞是幻觉指纹——写下前先想反例(例:快排不是「总是」O(n log n),最坏 O(n²);哈希表不是「总是」O(1),最坏 O(n))。

## 与其他 workspace 的边界
- 这门课以**仓库大纲**为源,教通用 DS&A + 系统设计面试。与 `agent开发/` 三门(agent 开发,mino/书为源)、`operating_systems/`(OS 期末)互不共用装置与术语,别混。

## 编号与进度
- lessons 编号 0001 起递增;学习记录 `learning-records/NNNN-*.md`;门户 `index.html`。
- 复选框:`todo.md` 里 `[ ]` = 素材已就绪,`[x]` = 已直播讲授并验证掌握——两者不同。

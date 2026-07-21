# Mission: 前端工程师面试准备

## Why

前端工程师岗位的技术面试,重心和通用软件工程面试不一样——算法题占比更低,HTML/CSS/JS 底层知识、UI 编程、前端系统设计、框架(React)细节的占比更高。这个仓库里已经克隆了 GreatFrontEnd 维护的《Front End Interview Handbook》中文翻译版全文(前端系统设计/综合面试手册/行为面试手册/React面试手册/quiz题库,共 38 篇正文 + 40 道高频问答题),但材料是按字母顺序平铺的目录,不是一条学习路径。本课程的目的,是把这些已经翻译好的真材料,重新组织成一条从"面试形式长什么样"到"简历与行为面试收尾"的可执行学习顺序。

*(这是基于仓库自身内容首次起草的第一版 Why,没有和用户当面确认过具体处境——比如是不是正在准备某场具体面试、目标岗位是前端 IC 还是全栈、还剩多久时间。下次真正开课时应先确认。)*

## Success looks like

- 能在几分钟内脱稿讲清楚前端面试常见的几道关卡(简历 → 行为面试 → trivia 问答 → 编码 → UI 编程 → 系统设计)分别考什么,以及自己目前卡在哪一关
- 拿到一道 HTML/CSS/JS 高频问答题,能先给出自己的思路框架,再对照参考答案查漏,而不是直接背答案
- 拿到一道前端系统设计题,能用 RADIO 框架五步(需求探索/架构/数据模型/接口/优化)走一遍,不遗漏任何一步
- 面对 React 状态设计/表单/Hooks/事件处理类问题,能说清楚背后的设计权衡,而不是复述 API 文档
- 面对协作/成长型思维/解决问题类行为面试问题,能用 STAR 结构给出一个具体、不空洞的回答
- 简历上的技术栈描述经得起面试官追问

## Constraints

- 全程中文讲授。仓库正文绝大多数已有官方中文翻译(zh-CN.mdx),仅 2 篇例外只有英文原文(`行为面试手册/resume-walkthrough`、`行为面试手册/adaptability-flexibility`)——这两课直接读英文源文件理解内容,课程文字用中文讲授,但不假装存在一篇官方中文原文。
- 不重复造轮子:通用数据结构与算法刷题、通用系统设计方法论,已经在同一 `面试/` 目录下的《编程面试大全》课程覆盖,本课程只补前端特有的部分。

## Out of scope

- 通用算法刷题深度训练——去 `../../编程面试大全/teach/`。
- Vue / Angular / Svelte 等非 React 框架的面试专题——仓库里只有 `React面试手册/`,没有对应的其他框架材料,不凭空编。
- 具体公司真题库对刷——README 提到的 [company-interview-questions](https://www.frontendinterviewhandbook.com/company-interview-questions/) 页面,本仓库没有克隆对应内容,不在这门课展开。
- 手把手带写一个完整生产级项目——那部分练习属于 GreatFrontEnd 平台本身([greatfrontend.com](https://www.greatfrontend.com?utm_source=github&utm_medium=referral&gnrs=frontendinterviewhandbook)),这门课负责讲透"为什么"和"怎么想",不负责代替刷题平台。

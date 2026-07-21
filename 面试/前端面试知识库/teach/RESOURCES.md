# 前端工程师面试 Resources

## Knowledge

### 一手源材料(本仓库自带,课程内容的主要来源)

- **前端系统设计**(`../前端系统设计/`,6 篇):简介、问题类型、评估标准、RADIO 框架、常见错误、备忘单。对应 Part 5。
- **综合面试手册**(`../综合面试手册/`,10 篇):面试形式总览、简历、trivia 问答入门、编码面试全景、JS 编码面试、算法面试、UI 编程面试、组件 API 设计原则、UI 问题备忘单、系统设计快速入门。对应 Part 1/2/4/5/7。
- **行为面试手册**(`../行为面试手册/`,10 篇):总览、自我介绍、为什么来这里、简历讲述、高频问题清单、反问清单、协作/成长型思维/解决问题/适应力四类具体问题。对应 Part 7。
- **React 面试手册**(`../React面试手册/`,12 篇):面试准备与简介、发展历程、基础概念、声明式思维、状态设计、Hooks、事件处理、表单、设计模式、数据获取、注册表单实战案例。对应 Part 6。
- **quiz 题库**(`../quiz题库/`,40 篇):h5bp Front-end Developer Interview Questions 的完整问答,按 CSS/HTML/浏览器/性能/Web API/可访问性/i18n 分类,每篇自带 References 区块的真实外部链接。对应 Part 3。

  Use for:每节课的正文内容与"主推资源"引用,都应先读对应源文件,而不是凭通用印象编。

### 高频引用的外部资源(均已在上述源文件的 References/正文链接中出现过,非本课新增)

- [React 官方文档](https://react.dev/) —— React 部分几乎每节课都会引用其中具体页面(如 [useEffect](https://react.dev/reference/react/useEffect)、[Rules of Hooks](https://react.dev/reference/rules/rules-of-hooks)、[管理状态](https://react.dev/learn/managing-state))。Use for:任何 React 概念的权威定义。
- [MDN Web Docs](https://developer.mozilla.org/) —— CSS/HTML/Web API trivia 题的标准参考,quiz题库多篇 References 直接指向 MDN 具体页面。Use for:核对某个 CSS 属性/DOM API 的精确行为。
- [web.dev](https://web.dev/) —— Google 维护的 Web 平台知识站,quiz题库与UI问题备忘单引用了其中的 CSS 特异性、可访问性专题。Use for:性能与可访问性相关的补充阅读。
- [patterns.dev](https://www.patterns.dev/) —— 前端设计模式与渲染模式的图解合集,React 设计模式课与"渐进式渲染"quiz 均引用。Use for:HOC/render props/容器展示组件分离等模式的可视化讲解。
- [CSS-Tricks](https://css-tricks.com/) —— CSS 具体技巧(clearfix、box-sizing、SVG 样式)的权威博客,多篇 quiz 引用。Use for:CSS trivia 题的延伸阅读。
- [Tech Interview Handbook](https://www.techinterviewhandbook.org) —— 同一作者维护的通用技术面试手册(简历、算法准备),`综合面试手册/overview`、`algorithms` 均引用。Use for:前端特有内容之外的通用求职建议,与本课明确分工——本课不重复讲通用算法准备,直接指向这里。
- [GreatFrontEnd](https://www.greatfrontend.com?utm_source=github&utm_medium=referral&gnrs=frontendinterviewhandbook) —— 本手册的出品方维护的刷题实战平台,200+ 带测试用例的练习题。Use for:学完某节课的概念后,去这里找对应的实战题练手。

## Wisdom (Communities)

- [Discord](https://discord.com/invite/NDFx8f6P6B) —— GreatFrontEnd 官方 Discord,README 明确邀请加入。Use for:具体某道题卡住时,和其他正在备考前端面试的人讨论。
- [r/frontend 与 Blind](https://www.teamblind.com/) —— `综合面试手册/overview` 在讲简历/面试准备时提到 Reddit 与 Blind(匿名职场社区),常用于打探具体公司的面试流程与真实评价。Use for:某个具体公司/岗位的面试形式和口碑,官方手册不会写这么细。
- [LinkedIn(GreatFrontEnd 公司页)](https://linkedin.com/company/greatfrontend) / [X (Twitter)](https://x.com/greatfrontend) —— README 列出的官方账号,会发布新内容更新。Use for:追踪手册本身的更新,不是求职社交本身的主渠道。

## Gaps

- **具体公司真题库**:README 链接了 [company-interview-questions](https://www.frontendinterviewhandbook.com/company-interview-questions/) 页面,但本仓库没有克隆对应的本地内容,目前无法基于真实源材料展开对应课程,已在 `MISSION.md` 的 Out of scope 里明确排除。
- **非 React 框架**:仓库只有 `React面试手册/`,没有 Vue/Angular/Svelte 对应材料——如果未来面试需要覆盖其他框架,需要先补充对应的一手材料,而不是让本课程凭通用知识编。
- **通用算法与系统设计方法论**:本仓库材料本身就明确"前端向",不重复造轮子,统一指向同一 `面试/` 目录下的《编程面试大全》课程。

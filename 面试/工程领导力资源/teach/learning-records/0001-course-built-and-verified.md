# 工程领导力精读课建成并全量核验(30 节)

`面试/工程领导力资源/teach/` 作为一个**从半成品脚手架**(原来只有 SKILL.md + 4×FORMAT.md,没有实际内容)建成完整课程:30 节自成一体 HTML 微课(0001-0030)+ 门户 `index.html` + 自包含 `assets/style.css` + MISSION/NOTES/GLOSSARY(约 20 词)/RESOURCES。真实源是 `../README.md`("200+ Resources to become a great engineering leader",Gregor Ojstersek 维护 6 年+ 的个人精选清单),按一条从「认清 IC/管理路线」到「Staff+」到「CTO」的成长弧线,重新编排成 10 个部分。

**这改变未来会话的什么**:教「工程领导力 / 从工程师到 EM·Staff·CTO」走这门课,不要重建;它以 `README.md` 的资源清单为源(每节锚定清单里真实收录的书/文章/newsletter),与 [[interview-prep-course]](编程面试大全,通用 DS&A + 系统设计面试)明确分工——系统设计的具体解题去那门课,本课(0023)只讲「领导者要懂到什么深度」,不重复。MISSION.md 的 Why 是首次生成时基于 README.md 自述宗旨起草的**第一版草案**,不是与用户当面访谈得出,下次真正开课时应先确认是否贴合用户本人处境。

**建法(与 [[interview-prep-course]] 相同的可复用套路)**:① 摸 README 的类目结构,重排成成长弧线而非平铺书架;② 手写并浏览器截图验收金标准 0001,锁定房屋风格(`.recall/.keydef/.apply/.pitfall/.practice/.good/.quiz` 七件套 + `table.compare/.pipeline/.flow/.trio/.bars` 图示库,命名从 DS&A 课的 `.interview/.gotcha/.implement/table.bigo` 改成领导力语境的名字);③ 磁盘 spec(每节的 brief + 来源 + 术语 + prev/next)写进 Workflow 脚本 → 29 个 agent 并发 fan-out。

**新教训 · resume 不是"只重跑失败项",它按记录重放全部写盘动作**:第一轮 29 个 agent 里 1 个(0015)因 API 连接中断失败,用 `Workflow({scriptPath, resumeFromRunId})` 重跑。跑完后发现:我在两轮之间手工修复过的 0023(删掉一个编造链接)**被重新写回了修复前的旧内容**。原因是 resume 对"未变更"的 agent 不是跳过,而是**重放它们记录下来的工具调用**(包括 Write)以重建终态——这意味着 resume 期间对同一批文件的任何手工编辑都会被重放覆盖。**教训**:resume 完成之前不要手工改任何该 workflow 会触碰的文件;真要改,等 resume 彻底结束、确认不会再 resume 同一个 run 之后再改。这与 [[workflow-schema-side-effect-skip]](schema 导致跳过写盘)是同一类"编排层语义反直觉"的问题,但触发条件不同,值得分开记。

**踩到的幻觉,以及怎么抓到的**:我自己在写 RESOURCES.md 和 0023 课的 spec 时,把姊妹课程(编程面试大全)记忆里的 `github.com/donnemartin/system-design-primer` 当成"这门课源材料里的真实链接"编了进去——这个链接本身是真实存在的项目,但**不在** `工程领导力资源/README.md` 里,属于"真实但张冠李戴"的幻觉,比无中生有的假 URL 更隐蔽。抓法:写完全部内容后,用脚本提取所有 `href="https://...")` 外链,逐条 `grep -F` 回 README.md 原文,不在原文里出现的一律标记可疑——这个方法抓出了这一处,人工审阅大概率会漏看。[[absolute-wording-hallucination-fingerprint]] 的姊妹纪律在这里同样适用:真实性核验不能靠"这链接看起来像真的",要靠"这链接在不在指定的真实源文件里"。

**Evidence(核验结论)**:30/30 结构齐全(单样式表、`lang="zh-CN"`、favicon、div/dl/details 标签配对、七件套装置各恰好 1 次、quiz 恰好 2 题);prev/next 链 0001↔0030 首尾相连,逐节核对无断链;h1 与 index.html 锚文本逐字一致;49 条外部链接(除 RESOURCES/GLOSSARY/MISSION 里另有 34 条)逐条比对 README.md 原文,**抓修 1 处张冠李戴的真实链接**(0023 + RESOURCES.md 的 System Design Primer);「唯一/总是/永远/绝对」等绝对措辞抽样复核,均用于否定句或场景描写(如"没有一条是唯一正确答案"),未发现真正违规的断言性绝对措辞。

**已知限制,不要假装做过**:Playwright 浏览器连接在核验过程中断线(`ECONNREFUSED 127.0.0.1:9222`),重试无效——只有金标准课 0001 拿到过真实浏览器截图确认(浅色渲染正常、控制台零错误);0002-0030 的可视化渲染**没有**逐一截图核验,只做了结构性核验(HTML 合法、class 名全部来自已验证的 `style.css`)。下次接手,如果要做视觉核验,先确认 Playwright MCP 连接是否恢复。

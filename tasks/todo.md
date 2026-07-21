# TODO · 继续生成课程(段 1 的 3 处新建洞)

> 目标:按 `operating_systems/CURRICULUM.md` 蓝图,补齐剩余「🆕 全新建」的三节微课。
> 段 0(0014/0015/0016)已建好并浏览器验收。本轮建 S11/S13/S16。

## 本轮任务

- [x] **0017**(S11)分段 vs 分页 · 段页式(一维/二维)—— 签名件:地址拆解器 ✅
- [x] **0018**(S13)虚拟存储器 · 缺页中断流程 · 抖动+工作集 —— 签名件:缺页中断模拟器 ✅
- [x] **0019**(S16)目录 FCB/inode(不含文件名)+ 位示图 —— 签名件:目录项⇄inode 拆分演示 ✅

## 质量闸(每节都要过)

- [x] 六步结构齐全(🖼直觉图/🧸例子/⚖️对照表/📖是什么/❓为什么深挖3层/✅自测)——三节各 6 段
- [x] 房屋风格逐字对齐 0014(CSS 基座 + 结构)——零外部依赖、favicon 已抑制、lang=zh-CN
- [x] 内容对齐教材 ch04/ch05/ch07 口径(相加vs相乘、0=空闲、inode不含文件名等方向性细节)
- [x] 自测正确项打乱位置——0017=C/A/D/B、0018=B/D/A/C、0019=A/C/D/B/A;每题解释干扰项陷阱
- [x] 本人浏览器实测:渲染 + 交互 + 控制台无报错(见下 Review)
- [x] 更新 0000 主清单 微课列引用(Ch4/Ch5/Ch6 六处)+ 进度指针

## Review

**产出**:`operating_systems/lessons/` 下新增 `0017`/`0018`/`0019` 三节自成一体 HTML 微课(391/467/530 行)。

**浏览器实测(headless Chrome 150 + 本地 HTTP,非 file://)**:
- 0017:三模式切换正常;「分段」实测算出 物理地址=段基址120000+偏移100=120100,并点破「段表存基址、相加≠相乘」;控制台零报错。
- 0018:缺页中断模拟器逐步走引用串 [0,5,1,5,9,0]/3块/FIFO;第5步牺牲干净页0→丢弃、第6步牺牲脏页5→写回,分支全对;控制台零报错。
- 0019:点文件名→连 inode + 红标「inode 无文件名」;「创建硬链接」→目录新增 backup.txt→#12、inode #12 链接计数 1→2;控制台零报错。

**遗留 / 边界**:
- 三节是「提前储备」,尚未直播讲授;CURRICULUM.md 复选框仍留空(那是"已讲授"的标记,非"已建")。
- 未提交 git(遵守「仅用户明确要求才提交」)。之前会话的 0013–0016、CURRICULUM.md、learning-records 也仍未提交。

**下一步建议**:回到教学主线——从 S01(打开 0014 直播)按 CURRICULUM 顺序推进;讲到 S11/S13/S16 时素材已就位。

---

## 第二批 · 超纲补漏(蓝图 6 洞之外的高/中频缺口)

> 蓝图 6 洞清零后,按 `0000` 里仍标「缺」的高/中频项继续补,编号从 0037 起。

- [x] **0037**(高·本轮要补)连续分配 & 动态分区 FF/NF/BF/WF + 碎片 + 紧凑 —— 签名件:分配模拟器 ✅
- [x] **0038**(中·Ch4 地基)程序装入·链接·重定位(逻辑/物理地址、静/动重定位)—— 签名件:地址重定位演示器 ✅
- [x] **0039**(中·Ch6 地基)文件逻辑结构 vs 物理结构(用户视角 ⊥ 磁盘视角)—— 签名件:双轴选择器 ✅

**质量闸**:六段齐全 ✅ / 房屋风格对齐 0014 ✅ / 对齐 ch04·ch07 口径 ✅ / 答案打乱(0037=D/B/A/C、0038=A/C/D/B、0039=C/A/D/B)✅ / 浏览器实测 ✅ / 更新 0000 引用(Ch4 两处 + Ch6 一处 + 算法清单一处)✅

**浏览器实测关键点**:
- 0037:默认 FF 分配到 426K 触发「空闲总量 959K ≥ 426K 却无整块 → 外部碎片 → 需紧凑」;切 BF 后同样 4 作业全部装下(426K 落到 600K 块)——算法差异当场显形;控制台零报错。
- 0038:静态模式「计算物理地址」写死 1100 → 「搬到基址 5000」报错「地址已写死、不能移动」;动态模式搬家成功(build agent 验)。控制台零报错。
- 0039:双轴 6 组合正交,切「记录式+索引」结论正确更新;控制台零报错。

**遗留**:三节仍为提前储备、未直播;未提交 git(遵守「仅用户明确要求才提交」)。此后如需再建从 **0040** 起。

---

## 第三批 · 存储管理计算大题冲刺串讲(用户点名建的「一个网页」)

> 用户要求:写一个网页详细讲解 分页地址变换 / FF/BF/WF / 分段vs分页·段页式 / 页面置换 / Belady·抖动 / ⚡计算大题(分页地址变换·页面置换缺页率)。
> 判定为「段 3 冲刺串讲」体裁(类比 0013 军火库):把存储管理计算题串成一条线并练手,不替代 0005/0006/0017/0037/0018 单概念课。编号 0040。

- [x] **0040**(冲刺·当前蓝色房屋风格)存储管理计算大题冲刺串讲 —— 4 个交互件:①分页地址变换+快表 EAT 计算器 ②FF/BF/WF「同题不同选」三列对比 ③页面置换 trace 生成器+缺页率(共用 simulate 引擎) ④Belady 3块vs4块对比。含 ⚡ 两道完整计算大题 + 4 题打乱自测(答案 B/D/A/C)。

**质量闸**:六大主题齐全 ✅ / 房屋风格对齐 0014 现行蓝色皮(区别于 0005/0006 旧红皮)✅ / 内容全部复用已验证素材(0005/0006/0017/0037/0018)+ EAT 公式与 CLOCK 从 `textbook/ch04·ch05` 现取现证 ✅ / 自测答案打乱 B/D/A/C ✅ / **三重验收** ✅ / 更新 0000(进度指针 + 算法清单两行)✅

**三重验收(为计算题页专设,单层不够)**:
- ① **手算**:FIFO/LRU/OPT(3块)=9/10/7、FIFO(4块)=10、分页 9668、EAT 130ns、FF/BF/WF(300K)=500/300/600 三块 —— 全部亲手推过。
- ② **浏览器实测**(headless Chrome+本地HTTP,非 file://):5 个交互件首屏 + 交互分支全跑:trace 现场 FIFO=9/LRU=10/OPT=7、Belady 现场 9→10、分页越界(A=5120→P=5 越界中断)、EAT 大题值(t100/ε10/p80→130)、FF 收敛(550K 三算法同选 600K);控制台 **0 报错 0 警告**;favicon 已抑制。
- ③ **对抗式 workflow**(6 子agent 并行独立重算,不信页面结论):`mismatches:[]` —— 53 处数字零不符;口径(相加vs相乘、Belady只FIFO、内/外碎片、CLOCK、段页式3访存、缺页率定义)全过;6+1 内链无断链;答案 B/D/A/C 打乱到位。

**遗留**:0040 为冲刺练手页,可直接给她刷;仍未提交 git(遵守「仅用户明确要求才提交」)。此后如需再建从 **0041** 起。

---

## 第四批 · 跨主题加餐(用户贴文章点名建的「一个图文并茂网页」)

> 用户贴来一篇《大模型训练与服务背后的数学》(Reiner Pope × Dwarkesh 播客黑板课),要求「用 teach 的指导和方式原则写一个图文并茂详细的网页教会我」。
> 判定为**跨主题加餐**体裁(先例:NOTES 里 0013 Java 加餐「与 OS mission 无关放 lessons/」)。编号 0041。用 teach 房屋风格(蓝色皮)+ 六步法,非 OS 内容但用 OS 概念搭桥(Roofline↔带宽墙、batch↔吞吐vs响应、KV↔缓存)。

- [x] **0041**(加餐·蓝色房屋风格)大模型训练与服务背后的数学 —— 10 节 + 6 题自测。签名件:**一个 batch 滑块同时驱动「延迟曲线 + 每-token 成本曲线」**(共享简化模型 W=12/KV=.02/C=.06,b*=W/(C−KV)=300),当场演示「便宜≠快」的核心矛盾。另含 Roofline SVG、双时钟条、MoE 机架图、三成本条、API 定价表。

**质量闸**:六步节奏(🧸ELI5/🖼交互/📖定义/❓深挖为什么/⚖️对照表/✅自测)✅ / 房屋风格对齐 0040 蓝皮 ✅ / lang=zh-CN + favicon 抑制 + 零外部依赖 ✅ / 自测答案打乱 B/A/C/B/B/C ✅ / 内容忠实原文并标注数量级经验值 ✅

**验收(手算 + 浏览器实测 + 截图 + 内容复查)**:
- 手算＝页面实测:b=8→延迟12.2ms/成本1.520/贵25.3×;b=40→12.8/0.320/5.3×;b=300→18.0/0.060/触底;b=512→30.7/0.060/**regime 翻转为算力受限**。全部逐一吻合。
- 静态图全渲染(Roofline/双时钟/MoE 8GPU/三成本/定价表/6 题);控制台 **0 报错 0 警告**;整页截图无重叠。
- **复查抓到一处方向性硬伤并修复**:§5「稀疏度」原写成「激活/总参数(越小)」→ 会推出「MoE→batch 更小」,与物理(batch ∝ 总/激活)和文章「300×稀疏度」相反。已改为 `稀疏度 = 总参数 ÷ 激活参数(≥1),越稀疏 batch 越大`,浏览器二次确认落地。

**遗留**:0041 与 OS 考试主线并行、可选看;未提交 git(遵守「仅用户明确要求才提交」)。此后如需再建从 **0042** 起。

---

## 第五批 · 补全全书 + 课程总门户(用户 /goal:「生成完整的一套新操作系统课程」)

> 用户设定 session goal:基于 teach 方法「新生成一套精美、图文并茂、深入浅出的操作系统课程」,并指示「不停下来问、直接做」。
> 先跑 understand 工作流摸底(5 只读+1 综合),自主判定「完整的一套」= **补平全部结构性空洞 + 用总门户把 50 课缝成可导航完整课**,而非重制已强的 Ch1/4/6(重复投资、挤占直播时间)。编号 0042–0050 + `index.html`。

- [x] **0042** 进程状态转换(五态/七态)+ PCB + 控制原语 —— 状态机迁移器(红标两条不可能转换) [Ch2]
- [x] **0043** 进程通信 IPC + 线程模型 —— 四类 IPC 数据流 + ULT/KLT/混合阻塞判定;**填了原「进程通信=缺」的洞** [Ch2]
- [x] **0044** 三级调度 + 多级反馈队列 MFQ(老师重点)—— MFQ 降级模拟器 + 甘特图 [Ch3]
- [x] **0045** 死锁四必要条件 + 预防 —— 十字路口 + 四条件破坏器(直击「必要≠充分」两次错点) [Ch3]
- [x] **0046** 死锁检测与解除 + 资源分配图化简器 [Ch3]
- [x] **0047** I/O 四级控制方式(程序查询/中断/DMA/通道)—— CPU 干预度对比 [Ch5]
- [x] **0048** 缓冲区管理(单/双/循环/池)+ SPOOLing —— 数据流并行演示 [Ch5]
- [x] **0049** 设备分配 + 设备独立性 + 磁盘访问时间计算器 [Ch5]
- [x] **0050** PV 伪代码默写器(考场默写,填对→全对/填错→死锁并解释)[题型冲刺]
- [x] **index.html** 课程总门户 —— 50 课按 8 章 + 考试题型地图 + 四大计算题雷区编排成可导航完整课

**缺口判定依据(understand 工作流)**:对照「已有 42 课 × CURRICULUM 20 小节 × 老师重点.txt」,三处真实空洞——Ch5 设备(最薄却是老师重点)、死锁体系残缺(她两次错「必要≠充分」)、Ch2 进程非同步(状态/IPC/线程);两处题型/重点缺口——PV 伪代码(独立 10 分题型)、MFQ(老师点名重点、0002 未覆盖)。

**质量闸(工作流内)**:母版逐字沿用 0014/0040 房屋风格 → 9 节并行「起草(grep 权威源+citations)→对抗式独立复核(重新 grep+node --check+手算比对+就地修复)」。复核判定:PASS×5(0042/0044/0046/0047/0048)、FIXED×3(0045/0049/0050,修断链+markup)、FAIL×0;verify:0043 中途 API 断连未复核 → 转主循环亲验。

**主循环亲验(工作流外,单层不够)**:
- 静态:9 节均 26–35KB 真材实料(非 stub);lang/favicon/--blue/@print/readout/script 六项硬约束全 yes;**外链全 0**;**全量断链扫描零失效**(0043 实际链接正确,其 draft 自述的 `0042-process-states` 是返回值笔误、文件本身无误)。
- 浏览器(headless+本地HTTP:8877,非 file://):10 页**零 console/零 pageerror**;逐页点按钮/推滑块交互均响应。
- 计算件手算=页面实测:**0049** 磁盘 Ts8+Tr5(半圈)+Tt5=**18ms** 公式全对;**0044** MFQ 跑到底周转 P1/P2/P3=**15/10/11**、甘特 P1P2P3P1P2P3P1,与手算逐格一致;**0050** 判分两分支——填对→「✔全对」、两个P颠倒→「✘死锁!攥着mutex阻塞…」解释准确;**0043** 七段齐全、四IPC+线程+「阻塞整进程」全覆盖。
- 截图:课程总门户全页——三步路径 + 8 章卡片(徽章齐)+ 题型地图 + 雷区表,布局精美无重叠。

**抓到并处理的意外**:某 agent **擅自把已验收的旧课 `0024-bitmap`(深色皮)整体重刷成蓝色房屋风格**(354增/374删),越出任务范围且未经我验证 → 按「最小改动/不覆盖非本人创建文件」**git checkout 回滚**。既有文件确认只此一处被误动,已复原。

**集成**:更新 `0000` 主清单(新增本批进度块 + Ch2/Ch3/Ch5 路线表挂上新课,其中 0043 填「进程通信=缺」)、`CURRICULUM.md`(加门户入口 + 「段4 补全全书」表 + 更新 S17/S18 素材与编号约定)。

**遗留**:9 节 + 门户均为提前储备,仍待直播讲授过关(CURRICULUM/0000 复选框仍 [ ]=素材就绪非已掌握);未提交 git(遵守「仅用户明确要求才提交」);旧深色/红皮课(如 0005/0006/0024-bitmap)是否统一改蓝皮=独立任务,待用户点头。此后如需再建从 **0051** 起。

---

# ⟪另一课程⟫ agent开发 · 评测方向系列(扩展进阶四支柱 · eval 支柱)

> 与上方 operating_systems 任务无关。来源:用户提供 `agent开发/原始资料/1.md`(《Agent 评测:方法论与体系设计》10 节长文)。
> 落点:`agent开发/lessons/`,编号 0013 起。用户决策:严格按材料不自己编 + 扩展四支柱 + 6 节碎化 + 方法论加诚实 mino 映射。
> 已有:0007(eval≈CI)、0008(判分器与裁判可信度)已覆盖,不重复。

## 6 节计划(0013–0018)
- [x] **0013** 从"跑几条 case"到评测体系(§01-03)—— 主循环手写定速课,183 行,结构验收通过
- [x] **0014** 指标体系与统计门禁(§04)—— workflow 生成,PASS,磁盘验收全过
- [x] **0015** 评测集是设计出来的质量资产(§05)—— workflow 生成,PASS,磁盘验收全过
- [x] **0016** 评分的分层与人工路由 · 承接 0008(§06)—— workflow 生成,PASS,磁盘验收全过
- [x] **0017** Badcase 根因定位(§07)—— workflow 生成,FIX(cmd/memory_eval→memory_eval 保守误报修复),磁盘验收全过
- [x] **0018** 从根因到行动项与全链路闭环(§08-10)—— workflow 生成,PASS,磁盘验收全过

## 规范
- 房屋风格逐字对齐 0007/0008(style.css 砖红皮 + diagram.css);每节:直觉/类比漏水 .leak/关键定义 .keydef/小表/≥1 自测 + 答案;独立可读
- mino 锚点仅用 0008 已核实符号;mino 未实现处用 .good 框显式标注「方法论层,mino 未实现」——不编造
- 每节结构验收(外链/内链/标签)+ 批量阶段 headless 浏览器全验

## Review

**产出**:`agent开发/lessons/` 新增 6 节评测体系微课 0013–0018(13–15KB/节),深化 eval 支柱;门户 `index.html` 新增「支柱三⁺ · 评测体系深化」子卡挂 6 链(6 链已验命中)。

**生成方式**:0013 主循环手写定速课;0014–0018 用 Workflow(pipeline:起草→对抗式复核→按需修复)并行生成,11 agent / 65.4 万 token / 10.6min / 0 报错 0 空。

**磁盘级验收(主循环亲验,非信工作流自述)**:
- 外链:5 节均仅 `../assets/*.css`,零 CDN/img/script。
- 内链:全部命中(交叉引用 0007/0008/0013 + 前后课 + MISSION/RESOURCES);门户 6 链均存在。
- 标签闭合:5 节全平衡。
- 反幻觉:各节 `*.go/*.py/*.json` 符号全部在白名单内(0017 零代码符号);对抗复核唯一 FIX(0017 `cmd/memory_eval`→`memory_eval`)属保守误报转安全修复。
- 必含元素:每节 leak≥2 / good≥1 / keydef≥1 / quiz=3 / table≥2 / figure≥2。
- `.good` 诚实框逐节亲读:「mino 真有(白名单符号锚)」vs「方法论层未实现(明写不虚构)」口径全部到位。

**遗留**:未提交 git(遵守「仅用户明确要求才提交」);6 节为提前储备、未直播讲授;headless 浏览器交互实测未做(结构级已过,可按需补);此后如需再建从 **0019** 起。

---

# ⟪第三课程⟫ 面试/编程面试大全 · 全新课程(用户点名:「用 teach 为这些资料生成一套课程」)

> 素材:`面试/编程面试大全/`(= jwasham 的 **coding-interview-university / 编程面试大学**,README-cn 137KB 学习大纲 + cheat-sheets PDF)。脚手架:`面试/编程面试大全/teach`(skill 版 teach,**空白**:仅 SKILL+4×FORMAT,无 assets/无内容)。
> 用户决策(AskUserQuestion):范围=**完整精读版 · 约52课**;难度侧重=**均衡(直觉+面试要点)**。
> 落点:`面试/编程面试大全/teach/`(该脚手架自身即 workspace 根;上游 README/LICENSE/cheat-sheets 保持只读原封)。
> 建法:三段式(摸 README 骨架→手写金标准 0007→子代理 fan-out 克隆)。**中途 ultracode 开启 + 后台 Agent 因 API 抖动接连卡死**,改用 **Workflow** 完成 fan-out(内置重试/失败隔离/缓存 resume,抗不稳定)。磁盘 spec(specs/C-K.md)沉淀 grounding,启动成本恒定、中断可续。

## 骨架:13 部分 52 节(每节锚定 README-cn 真实主题小节)
- [x] 起步与方法(0001-0003):学习法/75%原则 · 抽认卡与间隔重复 · 选哪门语言
- [x] 复杂度基石(0004-0006):Big-O 直觉 · 常见复杂度类 · 摊还分析
- [x] 线性结构(0007-0012):数组/动态数组 · 链表 · 双向链表陷阱 · 栈 · 队列/环形 · 哈希表上
- [x] 哈希与查找(0013-0015):哈希表下(冲突/扩容) · 二分查找 · 二分变体与蓝图
- [x] 位运算(0016-0017):位运算基础 · 补码/置位/位技巧
- [x] 树(0018-0022):树与遍历 BFS/DFS · DFS 三序 · BST · BST 增删后继 · 堆/优先队列
- [x] 排序(0023-0027):排序全景/稳定性 · O(n²)三兄弟 · 归并 · 快排 · 堆排序/非比较
- [x] 图(0028-0031):表示法 · 遍历 · 拓扑/环检测 · Dijkstra
- [x] 算法范式(0032-0036):递归 · 回溯 · DP上 · DP下 · 贪心vsDP
- [x] 工程与设计(0037-0043):OOP/设计模式 · 组合概率 · NP完全 · 程序如何运行 · 缓存 · 进程线程 · 并发原语
- [x] 更多结构与文本(0044-0048):字符串搜索 · Trie · 并查集 · 平衡树 · 布隆过滤器/跳表
- [x] 机器表示与网络(0049-0050):浮点/Unicode/字节序 · 网络基础
- [x] 系统设计(0051-0052):数字直觉/CAP · 缓存/分片/一致性哈希/作答框架

## 质量闸(逐节)
- [x] 自成一体 HTML,只 link 本 workspace 的 `../assets/style.css`(自包含,零外部资源)
- [x] 均衡结构:直觉/图 → 关键定义 → 复杂度(Big-O 表)→ 🎯面试怎么考 → ⚠面试易错点 → ⌨️动手写一遍 → ✅自测(≥2 题,答案打乱)→ 主推资源(引 README 精选的真实一手链接)→ 上下课导航
- [x] 脚手架:MISSION/NOTES/GLOSSARY/RESOURCES + index.html 门户 + reference/ 打印速查表
- [x] 全量核验:结构 52/52、内链(前后课+门户)、无外链、headless 渲染抽样(表/SVG/树图/深浅色)、术语一致

## Review

**产出**:`面试/编程面试大全/teach/` 下建成完整一套课——**52 节自成一体 HTML 微课**(0001-0052,10.5–17KB/节)+ 门户 `index.html`(13 部分卡片,52 链)+ 脚手架(自包含 `assets/style.css`、MISSION/NOTES/GLOSSARY(48 词)/RESOURCES)+ 打印速查表 `reference/cheatsheet.html` + 学习记录。上游 README/LICENSE/cheat-sheets 原封未动。

**建法(可复用于「为一份大纲/仓库生成一套课」)**:① 摸 README-cn 真实主题骨架(`- ### 主题` 锚点),按用户决策(52 课/均衡)编排 13 部分;② 手写并浏览器验收金标准 0007(数组),锁定房屋风格与 8 装置(recall/keydef/bigo 表/interview/gotcha/implement/quiz/nav);③ 磁盘 spec(specs/C-K.md 给每节 README 行号+scope+prev/next)+ 子代理 fan-out 克隆。**中途踩坑**:后台 fire-and-forget Agent 在 API 抖动下 3/3 卡死零产出 → 改 Workflow(10 工作项并行,内置重试/失败隔离),一次成功 10/10、0 错 0 空。

**全量核验(主循环亲验,非信 agent 自述)**:
- 结构:52/52 落盘,0 missing/0 extra;每节 lang=zh-CN + favicon 抑制 + **只 link 一份自包含样式表** + 装置齐(≥2 自测/interview/gotcha/nav)+ 标签闭合。
- 内链:prev/next 全链 0001↔0052 正确;**抓到并修复 10 处死交叉链接**(agent 猜兄弟课 slug:如 0005-big-o-complexity→complexity-classes、union-find 号写成 0026→实为 0046),按锚文本意图逐一映射修复,复验零死链。
- 反幻觉:**190 条外部一手链接逐条比对 README,零编造**(grounding 靠「agent 读 README 行号区间抽真实链接」的数据结构保证,非提示词)。
- 渲染:0007/0018/0045(深色)/0052 等 8+ 页 headless 实测,SVG 树/字典树/一致性哈希环、bigo 表、cells、pipeline、trio 在深浅色下均可读、`dgm-` 主题类深色安全;**控制台零报错**(process_mac 噪声已排除)。门户截图 13 卡片布局精美无重叠。

**遗留**:52 节为提前储备、未直播讲授(NOTES 约定 `[x]`=素材就绪,直播掌握是另一回事);未提交 git(遵守「仅用户明确要求才提交」);长尾冷门(FFT/van Emde Boas/HyperLogLog/凸包/线性规划)按用户「完整精读版」决策**主动排除**(README 自标可选、面试极少考)。此后如需再建从 **0053** 起。

---

# ⟪第四课程⟫ 面试/ 资料库建设(用户逐仓库贴分析 → 克隆提取 → 中文命名归档)

> 模式:用户在外部对某个 GitHub 仓库做完"哪些是纯参考资料 / 哪些是项目基建"的分析,贴进来,只说「保存」「保存一下」或直接甩链接;我据此浅克隆(大仓库改用 `--filter=blob:none --no-checkout` + `sparse-checkout` 部分克隆,避免拉大体积 notebook/数据)→ 只落地纯参考文本(md 为主,MIT 仓库带 LICENSE)→ 归到 `/Users/bytedance/pass_exam/面试/` 下**中文命名**的二级文件夹,不新建多余文档。`teach/` 自动注入脚手架不删(用户已明确「这个没有问题」)。

## 已完成

- [x] **技术面试手册**(yangshun/tech-interview-handbook)—— LICENSE + questions/algorithms/coding-interview/behavioral-interview/self-presentation
- [x] **编程面试大全**(jwasham/coding-interview-university)—— README/README-cn/programming-language-resources/LICENSE.txt/cheat-sheets(10 PDF 全保留)
- [x] **面向对象面试问答**(Devinterview-io/oop-interview-questions)—— README.md
- [x] **工程领导力资源**(gregorojstersek/resources-to-become-a-great-engineering-leader)—— README.md(仓库无 LICENSE,只落索引类内容)
- [x] **大模型算法面试资料**(aceliuchanghong/FAQ_Of_LLM_Interview)—— LICENSE + 面试必问问题 + 大模型基础(13)+ 微调(5)+ 面试专题(10,2026 docs)+ 综合题库 + 公司面经(2024/2025/2026,剔除作者自标"不建议看"的速成问答)

## 已完成(续)

- [x] **生成式AI学习指南**(aishwaryanr/awesome-generative-ai-guide)—— 克隆多次因大文件被断连(HTTP/2 流被重置在 `resources/`那类含 notebook/图片/PDF 的目录上),改为**逐目录 sparse-checkout + 非 cone 模式按 `*.md` 过滤**才落地稳。保留原仓库自身的 journeys/paths/topics/interview_prep/research_updates/free_courses/resources 结构(判定其导航体系本身就是价值所在,不重新拍平);LICENSE.md + README + courses.md;`interview_prep` 只留角色 6 件套 md,不留 `system-design/*/code/`;`research_updates` 排除 `state_of_ai_2025_report/`(独立版权声明);`resources/llm_lingo` 6 个术语 PDF 参照"编程面试大全"cheat-sheets 先例保留;全部 img/png/notebook/csv 排除。共 179 文件 4.7M。
- [x] **Agent全栈36章教程**(Callous-0923/agent-study)—— 用户自己的分析明确指出:内容是"讲义即代码"(每章一个 .py,概念+面试题+简化 Demo 混写),不是独立 md 参考资料,且分析本身建议不要直接整仓当 Wiki、需要提炼加工。就此询问用户要做到哪一步,用户选择**只落盘原始章节**(不做提炼)。于是只取 37 个 `chapter_*/*.py` + 根 README.md + LICENSE(MIT),排除对应的 `*.html`(build_html.py 生成的静态站产物,内容是 .py 的渲染版,冗余)、`index.html`/`package.json`/`vercel.json`/`build_html.py`(仓库自身的建站基建,非参考内容)。共 39 文件 796K,本仓库无历史网络问题(全 .py 文本,无大二进制)。提炼成结构化 Wiki 仍是待办,当前只是原始素材落地。
- [x] **Coding Agent运行时工程笔记**(7-e1even/learn-agent)—— 与 agent-study 同类"教学代码仓",沿用上一次"只落盘原始章节"的默认(未重复询问)。这个仓库文档与代码是分离的(每章 README.md + 若干 .mjs),不像 agent-study 那样混在一个文件里,所以直接保留两者。取 19 章 `s01`~`s19` 全部 `*.md`+`*.mjs`(含 `s10_prompt_assembly/skills/*/SKILL.md` 这两个章节内演示用 Skill 文件)+ 根 README.md/LICENSE(MIT)/SUMMARY.md,排除 `assets/*.svg`(19 张架构图,按"排除所有图片类素材"的既定口径)、`.gitbook.yaml`/`README_EN.md`(建站配置/英文重复版)。共 70 文件 680K,无网络问题。
- [x] **前端面试知识库**(yangshun/front-end-interview-handbook)—— monorepo,真正的内容全在 `packages/*/contents` 和 `packages/quiz/questions`,`website/` 只是 Docusaurus 建站代码。按用户分析口径只留 `en-US.mdx`+`zh-CN.mdx`(quiz 题另加 `metadata.json`,里面是 topics/difficulty/importance 结构化标签),排除:`pt-BR.mdx`(第三语言,不需要)、`*.langnostic.json`(纯翻译工具哈希表,核实内容后确认无实质信息)、根目录 `questions/*.md`(打开发现只是"已迁移"跳转桩,无实际内容)、`assets/`(网站图标插画)、`website/`(建站代码)。归类成 5 个中文子目录:`quiz题库`(40 题)/`综合面试手册`(10 主题)/`React面试手册`(12 主题)/`前端系统设计`(6 主题)/`行为面试手册`(9 主题)。共 196 文件 1.5M,LICENSE 为 MIT,无网络问题。
- [x] **前端系统设计案例索引**(greatfrontend/awesome-front-end-system-design)—— 全仓就一份 560 行 README(按新闻流/电商/聊天/协同编辑/视频流等真实产品场景 + 前端横向专题 + UI 组件三种方式组织,链接到大厂工程博客),LICENSE(MIT)+ `assets/cover.png` 封面图。只落 README.md + LICENSE,封面图排除。用户分析特别提醒:仓库本身 MIT 只覆盖 README 的分类整理,外链的大厂博客/论文/第三方仓库各自版权状态不一,只保留标题和链接性质的索引,不代表可以二次转载外链正文。共 2 文件。

## 待处理(用户已贴分析,排队等待执行——先记完计划,暂不动手)

- [ ] **DevOps 面试题库(暂定名)**(devops-interviews/devops-interview-questions)
  - 仓库地址:https://github.com/devops-interviews/devops-interview-questions
  - 定位:场景化 DevOps/SRE 实战题库(115 题),不是背概念,是"给故障场景→要求现场处理"
  - 保留:`README.md`(总索引,含分类/难度/公司标签)+ `cloud/*.md`(AWS 为主)+ `docker/*.md` + `git/*.md` + `kubernetes/*.md` + `linux/*.md` + `networking/*.md` + `programming/*.md` + `security/*.md`,全部纯 Markdown
  - 排除:`lnkd.jpg`/`pht.png`(README 用图,无技术内容)
  - 注意点(来自用户分析):README 计数不同步(115 vs 109);多数完整解法在外部视频,仓库内只有任务描述;公司标签是作者个人经历+Glassdoor/Blind 汇总,非官方背书;cloud 目前只有 AWS;CI/CD 偏 GitHub Actions
  - 仓库无 LICENSE 提及,克隆时需核实——按"工程领导力资源"先例,若确认无 LICENSE 则只落文本、不做二次分发定性

## Review
(本轮 5 个仓库全部保存后回填;用户说"待会儿再给几个任务",本文件持续追加同模式的新仓库)

---

## ⟪课程生成 · 第五门⟫ 大模型算法面试精读课(2026-07-17)

任务:针对 `面试/大模型算法面试资料` 用 `teach/` 脚手架生成一套课程。与前面"资料收集"线不同,这是**从真实资料建成一门可交互授课的微课**。

### 用户决策(AskUserQuestion)
- 范围 = **技术核心版 · 31 课**(9 部分;软性面/HR 话术、手撕算法、传统 ML、多模态 VLM 主动排除)
- 数学 = **本地内嵌 KaTeX**(构建时下载、运行时零外网依赖)
- 难度 = **均衡 · 直觉 + 面试要点**

### 计划(全部完成)
- [x] Phase 0:建 teach 脚手架 + 内嵌并验证 KaTeX 离线渲染 + 扩展 style.css(数学/宽公式滚动/.paper 装置)+ 手写并浏览器验收金标准母版 0002
- [x] Phase 1:锁定 9 部分 31 课 manifest + 写磁盘 BRIEF/spec 供 fan-out grounding
- [x] Phase 2:Workflow fan-out 克隆金标准生成 0001、0003-0031(中断一次,断点重跑补齐 9 节)
- [x] Phase 3:全量核验(结构 31/31、零死链、KaTeX 多页无头渲染、反幻觉抽查)
- [x] Phase 4:门户 index.html + 速查表 cheatsheet.html + MISSION/NOTES/GLOSSARY/RESOURCES/SKILL + 学习记录 + 记忆

### 产物
`面试/大模型算法面试资料/teach/`:31 节微课(0001-0031,505KB)+ 门户 + 自包含 style.css + 本地 KaTeX(596K)+ 4 脚手架文档 + 打印速查表 + learning-records/0001。9 部分:Transformer→注意力进阶→模型家族→微调PEFT→对齐RL→RAG→Agent→训练推理工程→评估数据。

### 核验结论(每条亲跑,不信 agent 自述)
- 结构 **31/31 通过**、编号 0001-0031 连续、**零死链**(精确 slug grounding)
- 数学:6 节多样化重课(0002/0004/0007/0016/0019/0023)无头渲染实测——公式全渲染、`.katex-error`=0、残留`$`=0、控制台零错;深色模式由 KaTeX currentColor 保证
- **抓修一个系统性缺陷**:8/31 课行内公式 `$a<b$` 的 `<` 被浏览器当标签吃掉致不渲染(且不报错),批量转义 `&lt;` 修复
- **抓修一个自引入回归**:修复正则误把真 `<em>` 转义,被正交检查(数学区裸中文扫描)逮住并修回
- 反幻觉:"16倍显存/15%掩码率/99%类别不均衡"均为真实非编造
- 未提交 git(遵守"仅明确要求才提交")

### 记忆
新建 `llm-algo-interview-course.md` + MEMORY.md 索引行:默认交互式授课、不重建、加课从 0032 起。

---

## ⟪课程生成 · 第六门:生成式 AI / AI 工程师面试冲刺⟫(2026-07-17)

**请求**:按 `面试/生成式AI学习指南/teach` 规范,在 `面试/生成式AI学习指南` 生成一套完整课程。
源 = **awesome-generative-ai-guide**(Aishwarya Naresh Reganti,MIT):177 md/4.8M 的全景 GenAI 课程库。
**关键判断**:源是混合体——真题库/101指南/free_courses 是真内容(抽取成课),courses.md/月度论文/工具清单是纯策展(归 RESOURCES/📄延伸)。teach/ 此前只有空脚手架。

**用户决策(AskUserQuestion)**:① 主线=**面试冲刺版**(两大真题库为骨,AI 工程师岗为主骨);② 面试视角=**每课都落到面试**。范围 ~30 课。

### 产出
`面试/生成式AI学习指南/teach/`:**31 节微课**(0001-0031,548KB)+ 门户 index.html + 自包含 style.css(复用姊妹课)+ 本地 KaTeX(596K)+ MISSION/NOTES/GLOSSARY(约90词)/RESOURCES + 打印速查表 cheatsheet.html + learning-records/0001。teach 总 1.2M。10 部分:基础与Transformer→Embedding与向量检索→Prompting与上下文工程→微调与对齐→RAG(5节)→Agents(4节)→推理模型→评估→生产/幻觉/安全→多模态与系统设计。骨=`60_gen_ai_questions.md`(62题)+`roles/ai-engineer/questions.md`(145题)。

### 核验结论(每条亲跑,不信 agent 自述)
- 结构 **31/31 全绿**、编号 0001-0031 连续、**零死链**(精确文件名 grounding,门户31链+各课prev/next全对)
- DOM 实测:门户(10卡片/31链/0缺失/0溢出)+ 8 节抽验(0001/0002/0006/0011/0012/0017/0021/0028)——KaTeX 全渲染、`.katex-error`=0、残留`$`=0、overflow=0、leaked entities=0、console error=0;深色模式由 currentColor 保证
- **KaTeX `<` 陷阱这次零发生**(spec 前置显式警告 + 本课偏应用公式少)——对比上门课 8/31 中招
- 反幻觉全量扫描通过:0003「4倍/16倍」是 O(n²) 正确推导;0021 百分比是 0.95ⁿ 正确外推(77/60/8%);0028 安全统计(94.4/58-59/37-40%)匹配源真值且正确 hedged;0025 成本课**零百分比**全程定性
- 上游源(两大题库/101指南/free_courses/LICENSE)只读原封;未提交 git(遵守"仅明确要求才提交")

### 建法关键
把**每节答案精髓嵌进 fanout 脚本**(逐字源真题+亲读题库提炼的要点),让 30 个并行 agent"组织给定要点"而非"回忆知识"→ 幻觉面大幅收窄。Workflow 扇出 30/30、0 error、0 skip、0 empty、约 12 分钟。

### 记忆
新建 `genai-interview-course.md` + MEMORY.md 索引行:默认交互式授课、不重建、加课从 0032 起。

---

## ⟪课程生成 · 第七门:面向对象(OOP)面试问答冲刺⟫(2026-07-17)

### 请求与源
用户:「按 `面试/面向对象面试问答/teach` 规范在 `面试/面向对象面试问答` 生成一套完整课程」。
源 = 同级 `README.md`《52 Important OOP Interview Questions in 2026》(Devinterview.io,38K)。
**关键判断**:源半封闭——**仅前 15 题(Q1–Q15)有完整答案**,Q16–52 在付费墙后、仓库无原文。且**零数学**(OOP 无公式)→ 不需 KaTeX。teach/ 此前只有空脚手架。注意与仓库《面向对象高级编程 advanced_oop》(编程进阶课)区分。

**用户决策(AskUserQuestion)**:① 范围=**面试全景版**(15 题为骨 + SOLID/设计模式/语言机制 canon,~26 课);② 语言=**Python 为主**(关键差异对照 Java/C++/C#)。

### 产出
`面试/面向对象面试问答/teach/`:**26 节微课**(0001-0026)+ 门户 index.html + 自包含 style.css(借姊妹课结构、**删 KaTeX 段**、**加 `.crosslang` 装置**、`.paper` 改"权威出处")+ MISSION/NOTES/GLOSSARY(约70词)/RESOURCES + 打印速查表 cheatsheet.html + learning-records/0001。8 部分:四大支柱→类的机制→关系与耦合→SOLID→设计模式→Python机制与跨语言→进阶工程→答题方法论。骨=源 15 题、肉=canon(GoF/Uncle Bob/Liskov/官方文档),每节📚权威出处**诚实分层标注**。金标准母版=0002 封装(含 name mangling 演示)。

### 核验结论(每条亲跑,不信 agent 自述)
- 结构 verify.py **26/26 全绿**、编号连续、**零死链**(精确文件名)、**零外部依赖**(无 KaTeX/CDN)、标签闭合、代码转义
- DOM 全 26 页 fetch 实测:leaked entities=0、katex=0、外部script/link=0、每节 recall+interview+gotcha+quiz 齐、2 处 inline SVG(0019 diamond 260×200 正常渲染);渲染抽验(0019/0023/门户)overflow 全 0
- **代码区裸 `<`/`>` 转义纪律**(取代 AI 课 KaTeX `<` 陷阱):26 节代码区裸 `<` 全 0
- 反幻觉全 26 扫描:绝对措辞皆定义正确/正确建议/主动破除误区/有语境限定(如"在 Java 里…接口是唯一出路");无编造 benchmark(仅 3 处 90%/99% 口语修辞);版本号(Java8 default/Java9 弃 finalize/C#8/Python3.10+ slots)全真实带限定
- 上游源(README/LICENSE)只读原封;**未提交 git**(遵守"仅明确要求才提交")

### 建法关键与教训
把**每节答案要旨+来源层嵌进 fanout spec**,让 25 个并行 agent 组织给定要点而非回忆。**会话额度上限致 5 agent(0022-0026)"失败但已落盘"**——workflow `<failures>` 报 agent 终态非副作用,磁盘/DOM 才定论,故未盲目 resume(那会重放覆盖 20 个已好文件),而是对 5 个"失败"文件做完整性体检确认可用。

### 记忆
新建 `oop-interview-course.md` + MEMORY.md 索引行:默认交互式授课、不重建、加课从 0027 起。

---

## ⟪课程生成 · 第八门:Pi-Agent SDK 深度精读⟫(2026-07-21)

### 请求与源
用户:「把这个克隆下来并使用 teach 建立一套课程 https://github.com/buchidonggua/dg-ai-notes.git」。
源 = **冬瓜《Pi-Agent SDK 深度教程》**(buchidonggua/dg-ai-notes,CC-BY-SA-4.0 文档 / MIT 代码):10 章拆解 earendil-works 开源的生产级 Agent SDK `pi`(基于 v0.80.2),TS+Python 双版本、每章配 SVG 图解、含 Astro 在线站与 agent-loop notebook。TS 版全书约 19 万字(单章 1.3–3 万字,ch03 Agent Loop 最重)。
**关键判断**:这是**源码精读体裁**(同 learn-code 读 xv6),归 `agent开发/` 板块作第四门子课(与 book-course/from-zero/四支柱并列),非 面试/ 刷题。grounding 源 = **教程 markdown 本身**(pi SDK 真源码不在库内,只有教程 docs);忠实转译教程内容为微课,引用教程的 file:line 口径而非自称读过 pi 源码。

### 用户决策(AskUserQuestion)
- 范围 = **全量建课**(10 章 → 约 32 节微课,一节一窄主题)
- 语言轨 = **TypeScript**(pi SDK 本体即 TS,配图/类型/行号全对得上原作)

### 计划(分阶段 · 带验证闸门 · 分批生成,规避 session 上限中断)
- [ ] **Phase 0 落盘+骨架**:源仓库去 .git 作只读快照落 `原始资料/dg-ai-notes/`;建 `pi-agent精读/teach/{lessons,learning-records,reference}` ✅(已完成)
- [ ] **Phase 1 地基+母版**:自包含 `assets/style.css`(融合 learn-code 代码块高亮 + 通用装置)+ 手写并浏览器验收金标准母版 0001 + 脚手架文档(MISSION/NOTES/GLOSSARY/RESOURCES/SKILL/*-FORMAT/baseline)+ chapter-map.html
- [ ] **Phase 2 设计扇出**:Workflow 10 并行章读者 → 每章结构化蓝图(窄主题切分 + 逐字源码块/关键表/设计取舍点/类比种子/自测种子),我汇总编号 0001–0032 + 写磁盘 spec 供 grounding
- [ ] **Phase 3 生成扇出(分批)**:Workflow pipeline 按章分批(每批约 6–10 节):起草 agent(**不用 schema,直接 Write 落盘**,规避 schema 跳过副作用)→ 对抗式复核 agent(读盘复核准确性/难度/模板)→ 按需修复;每批后我磁盘+DOM 亲验
- [ ] **Phase 4 集成核验**:门户 index.html + cheatsheet + 全量核验(结构 32/32、零死链、headless 渲染抽样、反幻觉扫描)+ 更新 README/CLAUDE 计数 + learning-record + 记忆

### 质量闸(逐节)
- [ ] 源码精读装置齐:窄主题 · 类比 · 关键定义 · **逐字 TS 代码块(带教程 file:line 出处)** · 设计取舍「为什么这样做」框 · ASCII/流程图 · ≥1 自测(答案打乱)· 上下课导航
- [ ] 自包含:仅 link 本课 `../assets/style.css`,零 CDN/外链/外部脚本;lang=zh-CN;favicon 抑制
- [ ] 忠实转译教程:代码/数字/设计理由不臆造;引教程口径,不自称读过 pi 源码
- [ ] 磁盘+DOM 亲验(不信 agent 自述):结构、内链、标签闭合、答案打乱、反幻觉

### Review

**产出**:`agent开发/pi-agent精读/teach/` 建成完整一门课——**32 节自成一体 HTML 微课**(0001-0032,232–340 行/节,代码块合计 119)+ 门户 `index.html`(10 章编排 32 卡,grid)+ 自包含 `assets/style.css`(融合代码块高亮+教学装置)+ 脚手架(MISSION/NOTES/GLOSSARY/RESOURCES/SKILL/4×FORMAT)+ `reference/chapter-map.html`(章→课映射,全✅超链)+ `learning-records/0001-baseline.md` + `specs/`(31 节设计蓝图,grounding 沉淀)。源仓库 `dg-ai-notes` 去 .git 作只读快照落 `原始资料/`(3.9M)。

**建法(五阶段·带验证闸门)**:
1. Phase 0 落盘+骨架;Phase 1 自包含 style.css + **手写并浏览器验收金标准母版 0001**(锁房屋风格)+ 脚手架。
2. Phase 2 **设计扇出**(Workflow 10 章读者并行,读完整章→结构化蓝图:窄主题/类比种子/教学要点/codeRefs/设计取舍/3题自测;schema 安全无写盘副作用)→ 校验落盘 specs/ + 注入精确 prev/next 防死链 + 重排 2 处单调答案。44万token/9min/0错。
3. Phase 3 **生成扇出分批**(批A 0002-0017、批B 0018-0032):pipeline 起草(sonnet,**不用schema直接Write**规避副作用跳过)→ 对抗复核(opus高effort,schema判决)→ 按需修复。两批共 62 agent、31/31 pass、0 需修复。
4. Phase 4 门户 + chapter-map 全✅ + 全课核验 + 集成 README/CLAUDE/NOTES。

**核验(主循环亲验,不信 agent 自述)**:
- 结构 **32/32 存在**、span 全平衡、自包含(仅 ../assets/style.css,0 CDN/img/外脚本)、每节≥1代码块。
- **零死链**(全链扫描;唯一 1 处是我手写母版 0001 预猜 0002 slug 为 four-package-architecture,实为 four-packages-three-layer-stack,已修)。
- 自测:31 节 data-correct **逐位==设计蓝图** correctIndex;全局答案分布 0/1/2/3=21/33/28/11(不单调)。
- DOM 抽样 6 节(0001/0002/0009/0015/0021/0028/0032):**控制台 0 错 0 警告**、无横向溢出、0 实体泄漏、代码块 `<>` 正确转义显示、TS 高亮着色、自测答对/答错分支正确、grid 门户布局正常。
- 反幻觉:全课 pi 版本号**仅 v0.80.2**(无臆造);64,000/13,700/12000 等关键数字均源自教程且出现在正确章节。

**遗留**:32 节为提前储备的素材、**未直播讲授**(baseline LR 约定:掌握以复述/自测表现为准);未提交 git(遵守「仅明确要求才提交」);Python 轨与 pi 真源码逐行未做(MISSION 已划出 scope);此后如需加课从 **0033** 起。

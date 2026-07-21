# 面向对象(OOP)面试 资源

知识从这里取,不靠脑补。**本课的关键诚实**:课程分两层来源——① 源仓库已答的 15 题(可直接引用);② 补齐面试全景所需的 canon(SOLID/设计模式/语言机制),锚定下方权威书与官方文档。哪节内容属于哪层,在各节的"📚 权威出处与延伸"里标注。

## Knowledge · 一层:源仓库(直接来源)

- [《52 Important OOP Interview Questions in 2026》— Devinterview.io(同级 `README.md`)](../README.md)
  本课的骨架。**注意**:仓库里只有前 15 题(Q1–Q15)的完整答案;Q16–52 仅有标题、答案在 Devinterview 付费墙后,仓库无原文。Use for:封装/继承/多态/抽象/类与对象/访问修饰符/重载/内聚/耦合/构造/析构/组合vs继承 这 15 题的一手措辞与代码例。

## Knowledge · 二层:面试全景 canon(补充来源,权威锚定)

- [《Design Patterns: Elements of Reusable Object-Oriented Software》— Gamma, Helm, Johnson, Vlissides(GoF, 1994)](https://en.wikipedia.org/wiki/Design_Patterns)
  设计模式的一手出处(创建型/结构型/行为型 23 模式)。Use for:单例/工厂/适配器/装饰器/策略/观察者 等模式的标准定义与意图。
- [SOLID 原则 — Robert C. Martin(Uncle Bob)](https://en.wikipedia.org/wiki/SOLID)
  SRP/OCP/LSP/ISP/DIP 的提出与经典阐述。Use for:SOLID 三节的原则定义、坏味道、重构方向。原始 LSP 见 Barbara Liskov 1987。
- [Refactoring.Guru — Design Patterns & Refactoring](https://refactoring.guru/design-patterns)
  高质量、带图、多语言示例的模式与坏味道讲解。Use for:模式的直觉图、何时用/何时别用、代码示例参照。
- [Python 官方文档 — Data Model(`__init__`/`__new__`/`__del__`/`__eq__`/`__hash__` 等特殊方法)](https://docs.python.org/3/reference/datamodel.html)
  Python OOP 机制的权威出处。Use for:构造/析构、相等与哈希、运算符重载等的准确措辞。
- [Python 官方文档 — `abc` 抽象基类模块](https://docs.python.org/3/library/abc.html) 与 [`typing.Protocol`](https://docs.python.org/3/library/typing.html#typing.Protocol)
  Use for:Python 如何表达"接口/抽象类"、名义 vs 结构子类型。
- [Python 官方 — 多重继承与 MRO(The Python 2.3 Method Resolution Order)](https://docs.python.org/3/howto/mro.html)
  C3 线性化的权威说明。Use for:diamond 问题、`super()` 协作、MRO 一节。
- [Python `functools.singledispatch`](https://docs.python.org/3/library/functools.html#functools.singledispatch) 与 [`dataclasses`](https://docs.python.org/3/library/dataclasses.html)
  Use for:"Python 里怎么做重载"、现代建类工具(dataclass/`__slots__`)。
- [Oracle — The Java™ Tutorials: Object-Oriented Programming Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/)
  Use for:跨语言对照里 Java 的 `private/protected/public`、`interface`、无多继承等准确说法。
- [cppreference — Classes / virtual functions](https://en.cppreference.com/w/cpp/language/classes)
  Use for:跨语言对照里 C++ 的 `virtual`、多继承、析构、RAII。

## Wisdom (Communities)

- [r/learnprogramming](https://reddit.com/r/learnprogramming) 与 [r/cscareerquestions](https://reddit.com/r/cscareerquestions)
  Use for:真实面试题反馈、"这题面试官到底想听什么"的经验。
- [Stack Overflow — 标签 oop / design-patterns / python](https://stackoverflow.com/questions/tagged/oop)
  Use for:具体机制争议(如 Python 私有、MRO 冲突)的高票权威回答。
- 模拟面试:[Pramp](https://www.pramp.com/) / 与同伴互相出题
  Use for:把"讲得清"练成"面试压力下也讲得清"——OOP 题最吃口头表达。

## Gaps · 已知资源缺口(驱动后续补强)

- **Q16–52 的原文答案**:仓库无,付费墙后。本课用 canon 覆盖这些主题,但**不是** Devinterview 的原版答案;若用户要对齐原版,需另行获取。
- **具体语言的边角机制**:如 C# 属性/记录类型、Java sealed 类、Python 元类深水区——本课点到为止,深挖需查各语言官方文档。
- **真实面经题库**:本课的"面试怎么考"基于通用高频题归纳,非某公司真题库;要贴某公司风格需补对应面经。

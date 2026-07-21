---
name: 编程面试速查表资源
description: "由 book-to-skill 从 编程面试大全/cheat-sheets/ 的 10 份速查表 PDF(Big-O、位运算、C/C++/Java/Python、Git、STL、系统设计)提取而成。用于面试语法/复杂度/命令的快速查阅。"
---

<!-- argument-hint: [主题, 语言名, 或 chapter 编号] -->

# 编程面试速查表资源

**来源**: `编程面试大全/cheat-sheets/` 下 10 份第三方速查表 PDF | **总页数**: ~26 | **章节数**: 10 | **生成方式**: book-to-skill(pdftotext -layout 提取,`--mode technical` 触发但因未装 Docling 自动降级)

## 如何使用

- **不带参数** — 直接看下方"核心速查"了解全貌
- **带主题** — 问"STL 容器怎么选""C++ 引用传参"等,定位到对应 chapter
- **带章节号** — 问 `ch01`,加载该章完整内容
- **浏览** — 问"有哪些章节"查看下方索引

当你问到下方"核心速查"未覆盖的细节时,应先读对应 chapter 文件再回答,不要凭记忆回答语言细节。

---

## 核心速查(跨章节最关键的判断依据)

1. **复杂度判断一律查 [ch01](chapters/ch01-big-o.md)**——数据结构操作复杂度表 + 排序算法复杂度表,是 STL 容器选型(ch09)、算法选型(patterns.md)的共同依据。
2. **数据结构选型**:按 key 查值不关心顺序 → Hash Table;需要有序 → 平衡树/`set`/`map`;按下标随机访问 → Array/`vector`;两端频繁增删 → Deque;中间频繁增删且很少随机访问 → Linked List/`list`。详见 [cheatsheet.md](cheatsheet.md) 决策树。
3. **C→C++→Java→Python 迁移三语言心智模型**:C 用指针模拟引用+手动 `malloc/free`;C++ 加入原生引用 `&` +`new/delete`(必须配对)+ 模板泛型;Java 对象默认引用语义 + 垃圾回收;Python 一切皆对象、整数无固定位宽不会溢出。换语言做题先确认这一层,再翻译算法逻辑。
4. **位宽速记**:8 位 → [-128,127];16 位 → [-32768,32767];32 位 → 约 ±21.5 亿。用于溢出判断,Python 例外。
5. **STL 认知**:容器(vector/list/deque/set/map)vs 容器适配器(stack/queue/priority_queue,不能遍历);迭代器能力层级 Input/Output→Forward→Bidirectional→Random Access 决定了哪些算法能用(如 `list` 不能用 `std::sort`)。
6. **系统设计开场三步**:对齐范围与用例 → 估算 QPS/读写比/存储量 → 基于约束做分层抽象设计。跳过前两步直接画架构图是常见减分项。
7. **Git 风险分级**:`add/commit/branch` 低风险随时用;`merge`/`rebase` 中等风险(rebase 只用于未推送到共享远程的提交);`reset --hard` 高风险且不可逆,用前必须确认。

---

## Chapter Index

| # | 标题 | 关键内容 |
|---|------|----------|
| [ch01](chapters/ch01-big-o.md) | Big-O 速查表 | 数据结构复杂度表、排序算法复杂度表 |
| [ch02](chapters/ch02-bits.md) | 位速查表 | n 位无符号/有符号整数取值范围 |
| [ch03](chapters/ch03-c-reference.md) | C 语言参考卡 | 语法、预处理、标准库函数、类型极限 |
| [ch04](chapters/ch04-python-interview-essentials.md) | 面试 Python 语言要点 | dict/queue/stack/异常/位运算等 12 个高频写法 |
| [ch05](chapters/ch05-cpp-reference.md) | C++ 参考卡 | 类型、指针、类、继承、模板、运算符重载 |
| [ch06](chapters/ch06-git-cheat-sheet.md) | Git 速查表 | 暂存、分支合并、远程同步、历史重写 |
| [ch07](chapters/ch07-java-fundamentals.md) | Java 基础速查表 | 控制流、异常、字符串/集合方法 |
| [ch08](chapters/ch08-python-cheat-sheet.md) | Python 速查表 | sys/os 变量、字符串/列表/文件方法、切片、日期格式码 |
| [ch09](chapters/ch09-stl-quick-reference.md) | STL 快速参考 | 容器/适配器/算法/迭代器分类索引 |
| [ch10](chapters/ch10-system-design.md) | 系统设计流程 | 三步走提纲(范围→约束→抽象设计) |

## Topic Index

- **Big-O / 复杂度** → ch01, ch09
- **位运算 / 溢出判断** → ch02, ch04
- **C 语言语法** → ch03
- **C++ 语法(类/继承/模板)** → ch05
- **容器 / STL** → ch09, ch01
- **异常处理** → ch04, ch07
- **Git 命令** → ch06
- **Java 语法** → ch07
- **Python 语法** → ch04, ch08
- **排序算法** → ch01
- **系统设计** → ch10
- **指针 / 引用传递** → ch03, ch05

## Supporting Files

- [glossary.md](glossary.md) — 全部关键术语及定义
- [patterns.md](patterns.md) — 具体技术/算法/设计模式(含适用场景与权衡)
- [cheatsheet.md](cheatsheet.md) — 决策树、选型矩阵、风险分级——跨章节的"该怎么选"速查

---

## Scope & Limits

本资源只覆盖这 10 份速查表本身的内容,不替代完整教材或算法练习。`ch09`(STL)因源 PDF 三栏密排版式在纯文本提取中信号损失较大,已明确标注哪些是可靠转录、哪些需要查原 PDF 或用 Docling 重新提取。若需要更深入的系统设计准备,`编程面试大全/README.md`(Coding Interview University)本身列了完整的书籍与课程资源清单。

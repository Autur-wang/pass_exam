---
name: 编程面试大全 · 速查表术语表
description: 10 份速查表(Big-O、位运算、C/C++/Java/Python、Git、STL、系统设计)涉及的核心术语,按字母/拼音排序
---

# Glossary — 编程面试速查表术语表

**Adjacency List / Adjacency Matrix** — 图的两种存储方式:邻接表(每个节点存邻居列表)、邻接矩阵(N×N 矩阵存是否相连)(Ch01 隐含背景知识)

**Amortized Time(均摊时间)** — 一系列操作的平均代价,即使个别操作较慢(如数组扩容),分摊到多次操作后仍是常数级 (Ch01)

**Array(数组)** — 连续内存的定长/动态集合,Access/Update 平均 O(1),中间 Insert/Delete 平均 O(n) (Ch01)

**Associative Container(关联容器)** — 按 key 组织元素的容器,如 `set/map/multiset/multimap`,通常按 key 有序(红黑树实现) (Ch09)

**Big-O / Big-Θ / Big-Ω** — 渐近复杂度记号:O 表示最坏情况上界,Θ 表示紧确界(平均情况常用),Ω 表示下界(最好情况) (Ch01)

**Binary Search Tree, BST** — 每个节点左子树 < 该节点 < 右子树的二叉树,平均 O(log n) 操作,最坏(退化成链)O(n) (Ch01)

**Bit Shift(位移)** — `<<` 左移(乘 2 的幂)、`>>` 右移(除 2 的幂,注意有符号数右移是否补符号位取决于语言/编译器实现) (Ch02, Ch04)

**Bitwise AND/OR/XOR/NOT** — `&`(按位与)、`|`(按位或)、`^`(按位异或)、`~`(按位取反),Python/C/Java/C++ 语法一致 (Ch02, Ch04)

**Container Adaptor(容器适配器)** — 在已有容器之上限制接口的包装类型,如 `stack/queue/priority_queue`,本身不能遍历 (Ch09)

**Deque(双端队列)** — 两端插入/删除都高效的序列容器 (Ch09, Ch01)

**Dunder Method(双下划线方法)** — Python 中形如 `__init__`/`__eq__`/`__str__` 的特殊方法,用于让自定义类接入内置语法(运算符、`print`、`for` 等) (Ch08)

**Fall-through(贯穿)** — `switch` 语句中某 `case` 缺少 `break` 导致继续执行下一个 `case` 的现象(C/Java 共有) (Ch07)

**Function Object / Functor(函数对象)** — 重载了 `operator()` 的类实例,可像函数一样调用,常用作算法的自定义比较器 (Ch09)

**Hash Table(哈希表)** — 基于哈希函数把 key 映射到桶的结构,平均 O(1) 存取,不支持按位置 Access,最坏情况(大量哈希冲突)退化到 O(n) (Ch01)

**Heap(堆)** — 满足堆序性质的完全二叉树,常用数组实现;`priority_queue` 的默认底层结构 (Ch01, Ch09)

**Immutable(不可变)** — 对象创建后不能被修改,如 Python/Java 的 `String`;拼接操作会生成新对象而非原地修改 (Ch04, Ch07, Ch08)

**Inheritance(继承)** — 派生类复用基类成员变量与函数(构造/析构除外)的机制;`public`/`protected`/`private` 继承会影响基类成员在派生类中的可见级别 (Ch05)

**Iterator Category(迭代器类别)** — Input/Output → Forward → Bidirectional → Random Access 的能力层级,STL 算法对迭代器类别有最低要求(如 `sort` 需要 Random Access) (Ch09)

**Linked List(链表)** — 每个节点存数据+指向下个节点指针的结构;Access/Search 平均 O(n),头部 Insert/Delete O(1) (Ch01)

**Load Balancing(负载均衡)** — 系统设计中把请求分摊到多台服务器的机制 (Ch10)

**Merge Sort / Quick Sort / Heap Sort** — 三种 O(n log n) 级排序:Merge Sort 稳定但需要 O(n) 额外空间,Quick Sort 平均最快但最坏 O(n²),Heap Sort 最坏仍是 O(n log n) 且只需 O(1) 空间 (Ch01)

**Operator Overloading(运算符重载)** — C++ 中为自定义类型重新定义标准运算符(`+`、`<<` 等)的行为;左操作数非本类实例时需用友元函数实现 (Ch05)

**Pass by Value / Pass by Reference(按值/按引用传递)** — 按值传递复制一份到函数内部,函数内修改不影响外部;按引用传递(`&`)让函数内修改直接作用于外部变量,是 C++ 相对 C 的新增能力 (Ch05)

**Pointer(指针)** — 存储内存地址的变量;`*` 声明指针类型/解引用,`&` 取地址,是 C/C++ 特有(Java/Python 无显式指针语法) (Ch03, Ch05)

**QPS(每秒请求数)** — 系统设计估算容量时的核心指标之一 (Ch10)

**Rebase vs Merge** — Git 中整合分支历史的两种方式:rebase 产出线性历史,merge 保留分支结构并产生合并提交 (Ch06)

**Red-Black Tree(红黑树)** — 一种自平衡 BST,保证最坏情况仍是 O(log n);C++ STL 的 `set/map` 通常以此实现 (Ch01, Ch09)

**Sequence Container(序列容器)** — 按插入顺序线性组织元素的容器,如 `vector/deque/list` (Ch09)

**Shallow Copy(浅拷贝)** — 只复制最外层引用,不递归复制嵌套的可变对象,如 Python 的 `a[:]` (Ch08)

**Skip List(跳表)** — 通过多层索引把平均查找/插入/删除降到 O(log n) 的链表变体 (Ch01)

**Slice(切片)** — 形如 `a[start:end]` 的区间取值语法,遵循左闭右开 `[start, end)`,负数下标从末尾倒数 (Ch08)

**Stable Sort(稳定排序)** — 排序后相等元素的相对顺序保持不变;Merge/Timsort/Bubble/Insertion/Counting/Radix 等是稳定的,Quicksort/Heapsort/Selection Sort 通常不稳定 (Ch01)

**Stash(暂存)** — Git 中临时保存工作区改动、恢复干净工作区的机制,`git stash`/`git stash pop` (Ch06)

**Static Keyword(static 关键字)** — C 中含义随作用域变化:文件作用域表示"仅本文件可见",函数作用域表示"跨调用保持值" (Ch03)

**Struct(结构体)** — 把多个不同类型字段打包成一个复合类型;C 用 `struct tag {...}` + 单独实例声明,C++ 中 `struct` 本质是 `public` 默认的 `class` (Ch03, Ch05)

**Template(模板)** — C++ 泛型机制,让函数/类对任意类型参数化,编译期实例化;STL 容器/算法全部基于模板 (Ch05, Ch09)

**Two's Complement(补码)** — 有符号整数的标准二进制表示,n 位补码范围是 `[-2ⁿ⁻¹, 2ⁿ⁻¹-1]` (Ch02)

**Unsigned / Signed(无符号/有符号)** — 无符号整数只表示非负值(范围 `[0, 2ⁿ-1]`),有符号整数用补码表示正负值 (Ch02, Ch03)

**Vector(向量/动态数组)** — C++ STL 中连续内存的动态数组,提供 `push_back/size/operator[]` 等接口,复杂度对应普通数组 (Ch09, Ch01)

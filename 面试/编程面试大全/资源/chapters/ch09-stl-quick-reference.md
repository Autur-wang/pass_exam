# Ch09: STL 快速参考(STL Quick Reference v1.29)

**来源**: `cheat-sheets/STL Quick Reference 1.29.pdf`(8 页,Yotam Medini,1998–2007)

## Core Idea
C++ 标准模板库(STL)的容器、容器适配器、算法、函数对象、迭代器的分类索引与模板签名参考。是速查表里信息密度最高的一份,面试中用于确认"某个容器/算法叫什么名字、属于哪一类、大致怎么用"。

## ⚠️ 提取局限说明
这份 PDF 是学术风格的三栏密排版式,`pdftotext -layout` 在还原多栏排版时会把相邻栏的文字按行交错拼接,导致函数签名的参数列表在纯文本层面经常被拆散、错位(例如某个函数的返回类型和另一个函数的参数混排在同一行)。**下面的目录结构、分类、容器名称是可靠的**(章节编号在提取后仍保持完整);但**具体的模板函数签名不做逐字复制**,避免把错位的片段当作"忠实转录"而引入错误签名。需要精确签名时,请直接打开原 PDF(`cheat-sheets/STL Quick Reference 1.29.pdf`)查看排版原文,或需要更高保真度提取时可用 Docling 重新处理该文件(项目已具备 `book-to-skill --mode technical` 能力,只是当前机器未装 Docling)。

## Key Concepts
- **容器(Container)** vs **容器适配器(Container Adaptor)**:`vector/list/deque/set/map` 等是容器,`stack/queue/priority_queue` 是在容器之上包一层受限接口的适配器,不能直接遍历。
- **迭代器类别(Iterator Category)** 是一套层级:Input/Output → Forward → Bidirectional → Random Access,类别越靠后功能越强(支持 `+n` 跳跃访问),STL 算法对迭代器类别有最低要求(例如 `sort` 要求 Random Access Iterator)。
- **函数对象(Function Object / Functor)**:重载了 `operator()` 的类,可以像函数一样被调用,常用作 `sort`/`set` 等的自定义比较器(`Compare` 模板参数)。

## Reference Tables

### 目录结构(章节索引,可靠信息)
| 章节 | 内容 |
|---|---|
| 1 | Notations(符号约定) |
| 2.1 | Pair |
| 2.2 | Containers — Common(所有容器共有的类型与操作,如 `begin()/end()/size()/empty()/swap()`) |
| 2.3 | Sequence Containers 共有操作(`vector/deque/list` 的 insert/erase) |
| 2.4 | Vector |
| 2.5 | Deque |
| 2.6 | List(含 `splice`/`merge`/`unique`/`sort` 等链表特有操作) |
| 2.7 | Sorted Associative Containers 共有操作(`set/multiset/map/multimap` 共有:`key_comp/value_comp/insert/erase/count/find/lower_bound/upper_bound/equal_range`) |
| 2.8 | Set |
| 2.9 | Multiset |
| 2.10 | Map(含 `operator[]`) |
| 2.11 | Multimap |
| 3.1 | Stack Adaptor |
| 3.2 | Queue Adaptor |
| 3.3 | Priority Queue |
| 4.1 | Query Algorithms(`for_each/find/find_if/count/count_if/mismatch/equal/search/adjacent_find`) |
| 4.2 | Mutating Algorithms(`copy/swap_ranges/transform/fill/generate/remove/replace/unique/reverse/rotate/random_shuffle/partition`) |
| 4.3.1 | Binary Search(`binary_search/lower_bound/upper_bound/equal_range`) |
| 4.3.2 | Merge(`merge/inplace_merge`) |
| 4.3.3 | Functions on Sets(`includes/set_union/set_intersection/set_difference/set_symmetric_difference`) |
| 4.3.4 | Heap(`push_heap/pop_heap/make_heap/sort_heap`) |
| 4.3.5 | Min and Max(`min/max/min_element/max_element`) |
| 4.3.6 | Permutations(`next_permutation/prev_permutation`) |
| 4.3.7 | Lexicographic Order(`lexicographical_compare`) |
| 4.4 | Computational(`accumulate/inner_product/partial_sum/adjacent_difference`) |
| 5.1 | Function Objects & Adaptors(negators/binders/pointer-to-function adaptors) |
| 6.1 | Iterator Categories(Input/Output/Forward/Bidirectional/Random Access) |
| 6.2 | Stream Iterators(`istream_iterator/ostream_iterator`) |
| 6.3 | Typedefs & Adaptors(`reverse_iterator`, insert iterators:`back_inserter/front_inserter/inserter`) |
| 7 | Examples(Vector、List Splice、Compare Object Sort、Binary Search、Transform & Numeric 等可运行示例) |

### 容器速查(名称、头文件、用途)
| 容器 | 头文件 | 定位 |
|---|---|---|
| `pair` | `<utility>` | 双元素组合 |
| `vector` | `<vector>` | 连续内存的动态数组 |
| `deque` | `<deque>` | 双端队列,两端插入/删除均高效 |
| `list` | `<list>` | 双向链表 |
| `set` / `multiset` | `<set>` | 有序、唯一 / 允许重复的关联容器 |
| `map` / `multimap` | `<map>` | 有序键值对,唯一键 / 允许重复键 |
| `stack` | `<stack>` | 容器适配器,LIFO |
| `queue` | `<queue>` | 容器适配器,FIFO |
| `priority_queue` | `<queue>` | 容器适配器,底层通常是堆 |

各容器操作的时间复杂度(access/search/insert/delete)已在 **Ch01(Big-O 速查表)** 的"数据结构基本操作复杂度"表中给出,可直接对照:`vector`≈Array 行,`list`≈Doubly-Linked List 行,`set/map`≈Binary Search Tree 或 Red-Black Tree 行(标准库通常用红黑树实现),`priority_queue`≈堆(未单列,插入/取顶均为 O(log n))。

### 容器适配器所需的底层容器接口
| 适配器 | 要求底层容器提供 | 可用底层容器 |
|---|---|---|
| `stack` | `back(), push_back(), pop_back()` | vector / list / deque |
| `queue` | `front(), back(), push_back(), pop_front()` | list / deque |
| `priority_queue` | random access iterator, `front(), push_back(), pop_back()` | vector / deque |

### 迭代器类别层级(功能递增)
```
Input/Output Iterator → Forward Iterator → Bidirectional Iterator → Random Access Iterator
```
- Input/Output:只能单向遍历一次(如从流读取)。
- Forward:可重复遍历,支持 `++`。
- Bidirectional:额外支持 `--`(如 `list`/`set`/`map` 的迭代器)。
- Random Access:额外支持 `+n`/`[]` 跳跃访问(如 `vector`/`deque` 的迭代器)——`sort` 等算法要求这一级别,所以 `list` 不能直接用 `std::sort`,要用 `list::sort()` 成员函数。

## Key Takeaways
1. 需要精确 O(1) 判断"这个容器该不该用"时,直接查 **Ch01** 的复杂度表,不用死记 STL 本身的文字描述。
2. `stack`/`queue`/`priority_queue` 是适配器,不是独立容器——它们包了一层受限接口,底层默认分别是 `deque`(stack/queue)和 `vector`(priority_queue)。
3. `list` 不支持随机访问迭代器,因此不能用全局 `std::sort`,必须调用 `list::sort()` 成员函数(内部用归并排序实现,保持 O(n log n))。
4. `set/map` 系列基于有序关联容器(通常红黑树实现),迭代顺序按 key 排序;如果不需要有序、只要更快的平均 O(1) 查找,应使用 `unordered_set/unordered_map`(此 PDF 成书早于 C++11,未收录 unordered 系列,面试中需要额外说明这一点)。
5. 遇到需要逐字确认的模板函数签名(参数顺序、`const` 位置等),以原 PDF 或 cppreference.com 为准,不要以本章转述内容直接背诵。

## Connects To
- **Ch01(Big-O)**:容器操作复杂度的权威来源。
- **Ch05(C++ 参考)**:STL 建立在 Ch05 介绍的模板机制之上。

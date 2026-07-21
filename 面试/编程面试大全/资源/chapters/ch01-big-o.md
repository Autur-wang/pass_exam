# Ch01: Big-O 速查表(Big-O Cheat Sheet)

**来源**: `cheat-sheets/big-o-cheatsheet.pdf`(2 页,bigocheatsheet.com)

## Core Idea
一张速查表:各数据结构基本操作的时间/空间复杂度,以及常见排序算法的时间/空间复杂度。用于面试中快速判断"这个操作是不是够快"。

## Key Concepts
- **Θ(平均情况) vs O(最坏情况)**:表中同时给出两栏,平均情况通常比最坏情况更能反映数组类结构的真实表现。
- **访问(Access)/查找(Search)/插入(Insertion)/删除(Deletion)**:评价任意数据结构的四个基本维度。
- **稳定排序 vs 不稳定排序**:表中未直接标注,但 Mergesort/Timsort/Bubble/Insertion 是稳定的,Quicksort/Heapsort/Selection Sort 通常不稳定——这是速查表本身没写、但面试常追问的一点,答题时需自行补充。

## Reference Tables

### 数据结构基本操作复杂度
| 数据结构 | 平均 Access | 平均 Search | 平均 Insert | 平均 Delete | 最坏 Access | 最坏 Search | 最坏 Insert | 最坏 Delete | 最坏空间 |
|---|---|---|---|---|---|---|---|---|---|
| Array | Θ(1) | Θ(n) | Θ(n) | Θ(n) | O(1) | O(n) | O(n) | O(n) | O(n) |
| Stack | Θ(n) | Θ(n) | Θ(1) | Θ(1) | O(n) | O(n) | O(1) | O(1) | O(n) |
| Queue | Θ(n) | Θ(n) | Θ(1) | Θ(1) | O(n) | O(n) | O(1) | O(1) | O(n) |
| Singly-Linked List | Θ(n) | Θ(n) | Θ(1) | Θ(1) | O(n) | O(n) | O(1) | O(1) | O(n) |
| Doubly-Linked List | Θ(n) | Θ(n) | Θ(1) | Θ(1) | O(n) | O(n) | O(1) | O(1) | O(n) |
| Skip List | Θ(log n) | Θ(log n) | Θ(log n) | Θ(log n) | O(n) | O(n) | O(n) | O(n) | O(n log n) |
| Hash Table | N/A | Θ(1) | Θ(1) | Θ(1) | N/A | O(n) | O(n) | O(n) | O(n) |
| Binary Search Tree | Θ(log n) | Θ(log n) | Θ(log n) | Θ(log n) | O(n) | O(n) | O(n) | O(n) | O(n) |
| Cartesian Tree | N/A | Θ(log n) | Θ(log n) | Θ(log n) | N/A | O(n) | O(n) | O(n) | O(n) |
| B-Tree | Θ(log n) | Θ(log n) | Θ(log n) | Θ(log n) | O(log n) | O(log n) | O(log n) | O(log n) | O(n) |
| Red-Black Tree | Θ(log n) | Θ(log n) | Θ(log n) | Θ(log n) | O(log n) | O(log n) | O(log n) | O(log n) | O(n) |
| Splay Tree | N/A | Θ(log n) | Θ(log n) | Θ(log n) | N/A | O(log n) | O(log n) | O(log n) | O(n) |
| AVL Tree | Θ(log n) | Θ(log n) | Θ(log n) | Θ(log n) | O(log n) | O(log n) | O(log n) | O(log n) | O(n) |
| KD Tree | Θ(log n) | Θ(log n) | Θ(log n) | Θ(log n) | O(n) | O(n) | O(n) | O(n) | O(n) |

### 数组排序算法复杂度
| 算法 | 最好 | 平均 | 最坏 | 最坏空间 |
|---|---|---|---|---|
| Quicksort | Ω(n log n) | Θ(n log n) | O(n²) | O(log n) |
| Mergesort | Ω(n log n) | Θ(n log n) | O(n log n) | O(n) |
| Timsort | Ω(n) | Θ(n log n) | O(n log n) | O(n) |
| Heapsort | Ω(n log n) | Θ(n log n) | O(n log n) | O(1) |
| Bubble Sort | Ω(n) | Θ(n²) | O(n²) | O(1) |
| Insertion Sort | Ω(n) | Θ(n²) | O(n²) | O(1) |
| Selection Sort | Ω(n²) | Θ(n²) | O(n²) | O(1) |
| Tree Sort | Ω(n log n) | Θ(n log n) | O(n²) | O(n) |
| Shell Sort | Ω(n log n) | Θ(n(log n)²) | O(n(log n)²) | O(1) |
| Bucket Sort | Ω(n+k) | Θ(n+k) | O(n²) | O(n) |
| Radix Sort | Ω(nk) | Θ(nk) | O(nk) | O(n+k) |
| Counting Sort | Ω(n+k) | Θ(n+k) | O(n+k) | O(k) |
| Cubesort | Ω(n) | Θ(n log n) | O(n log n) | O(n) |

## Key Takeaways
1. 数组的访问是 O(1),但插入/删除是 O(n)——链表相反,这是"数组 vs 链表"这道经典面试题的复杂度依据。
2. 哈希表的平均复杂度全是 O(1),但没有 Access(哈希表不支持按位置随机访问),最坏情况会退化到 O(n)(哈希冲突严重时)。
3. 各种平衡树(B-Tree/Red-Black/AVL)把最坏情况也压到 O(log n)——这正是它们存在的意义:防止普通 BST 退化成链表。
4. Quicksort 平均最快但最坏是 O(n²)(退化输入,如已排序数组 + 差劲的 pivot 选择);Mergesort/Heapsort 最坏情况都能保持 O(n log n),这是三者面试对比的核心区别。
5. 只有 Mergesort/Timsort/Bubble/Insertion/Tree Sort/Bucket/Radix/Counting/Cubesort 是稳定排序(本表未标注,需结合算法原理记忆);Quicksort/Heapsort/Selection Sort 不稳定。

## Connects To
- **Ch09 (STL)**:STL 各容器(vector/list/map/set)背后就是这张表里的数据结构实现。

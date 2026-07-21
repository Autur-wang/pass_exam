# NOTES · learn-code

> 本文件是记录**用户教学偏好**与**工作笔记**的便签。目标与范围见 [MISSION.md](./MISSION.md)。

## 工作区说明

- 本课主题：**对着 `reference/xv6-riscv-20230207/` 的真实内核源码，按操作系统教材（xv6 book, rev3）章节顺序精读 xv6**。不是零基础编程入门课。
- 微课产物在 `lessons/`，命名 `NNNN-dash-case-topic.html`，一节一窄主题；目前处于起步阶段（0001-syscall-boundary、0002-fork-exec-wait）。
- 参考速查在 `reference/`（如 `chapter-map.html`）；学习记录在 `learning-records/`（基线 `0001-beginner-baseline.md`）。
- 与 `operating_systems/` 的关系：那门课讲 OS **概念应试**，本课讲同一批概念在 **xv6 真实代码里怎么落地**，两者互为补充。

## 用户教学偏好

（待补——随会话记录用户明确表达的偏好：讲解粒度、类比风格、每节想覆盖的代码范围等。）

## 工作笔记

- 进度：已建 0001（系统调用边界·echo.c）、0002（fork/exec/wait·sh.c）、0003（手搓第一个进程·userinit）、**0004（页表入门·`walk()` 软件版 MMU·vm.c/riscv.h）**。
- 章节覆盖：第 1 章 ✅ → 第 2 章 ✅ → 第 3 章「页表 / 虚拟内存」**已开篇（0004 讲 walk 查表主干）**；**下一步 0005 钻 `kalloc.c`**（walk 的 alloc=1 分支要 kalloc 物理页，正好承接）。
- 0004 的钩子：结尾把「walk 里跳过的 alloc=1 → kalloc 从哪变出物理页」埋成引向 0005 的悬念。
- 0004 生成用了 Workflow 编排（并行读 vm.c/kalloc.c/riscv.h/memlayout.h → 设计蓝图 → 零基础难度+概念准确性双审查），采纳 7 条审查意见后落盘。
- 待确认（沿用 baseline）：本地 RISC-V 工具链 / QEMU 是否可用——决定能否做「跑起来看现象」型练习。

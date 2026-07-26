# Harness Backlog

> 当 Agent 遇到摩擦、困惑或需要新验证方式时记录于此。
> 这些是待改进的项,不影响当前任务完成。

## 格式

```yaml
- [YYYY-MM-DD] <摩擦描述>
  影响: <哪个点/哪个题型>
  尝试: <当前如何处理>
  建议: <如果改进,会怎么做>
```

---

## 2026-07-26 baseline 之后的 backlog

- [2026-07-26] verify-paths 4 个课程内容 broken paths (course maintenance)
  影响: verify-paths remaining 4 broken(全部课程内容内 References 引用)。
  尝试: 已文档化进本 backlog;verify-self 仍 fail,留作软失败警告。
  现状:
    - 多媒体/teach/RESOURCES.md: ../原始资料/... (课程内 原始资料 引用)
      → URL 中 `%20` 应对应空格;实际文件名应是把 `%20` 当作字面字符。还是缺失登记 backlog,等用户在 `多媒体/原始资料/` 实际放入资源后再说。
    - agent开发/book-course/RESOURCES.md: 原始资料/... (课程内 引用) (book-course 在 agent/ 子层,缺 ../)
      → 应改 ../原始资料/... (课程内 原始资料 引用)。等下一轮修。
    - agent开发/book-course/RESOURCES.md: chapterN/README.md (课程内 占位符引用) (chapterN 占位符)
      → 应替换具体章号,或在 SKILL.md 列存在的 chapter。
    - learn-code/teach/RESOURCES.md: `../xv6-riscv-20230207/`
      → 外部子模块,git 中已不存在;推荐 git clone 重新获取,或者改引用官方 PDF。

  建议: 下一轮会话分别修。

- [2026-07-26] 数据结构与算法三套脚手架待整理 (ADR-0005)
  影响: 数据结构与算法/ 根目录 + teach_副本 + skill/
  现状: ADR-0005 已写但尚未执行 (等用户确认)
  步骤: 见 ADR-0005

- [2026-07-26] 面试下 4 子目录的 teach 内容待填 (interview thread)
  影响: 面试/技术面试手册|编程面试大全|面向对象面试问答|工程领导力资源/teach/
  现状: 只有格式文件 + SKILL.md,缺 MISSION/NOTES/GLOSSARY/RESOURCES 4 件主体。
  建议: 等该方向真正开始教学前逐步填充。

## 历史

- [2026-07-17] 初始创建

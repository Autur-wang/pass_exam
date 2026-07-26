# Courses — 项目课程全景

> 单一真相。`../scripts/verify-scaffold.ps1` 会自动补全每行的"教脚手架合规"状态。
> 维护策略:状态变更即更新本表,不积压超过 1 个会话。

## 主线课程(必须持续投入)

| 目录 | 主题 | teach 脚手架 | lessons | learning-records | 备注 |
| --- | --- | --- | --- | --- | --- |
| `面试/技术面试手册/teach/` | 技术面试 | 部分(待填 MISSION/NOTES/GLOSSARY/RESOURCES) | 上游 | 上游 | 上游 third-party 镜像,自有 teach/ 仍需填充 |
| `面试/编程面试大全/teach/` | 编程面试 | 部分 | 上游 | 上游 | 同上 |
| `面试/面向对象面试问答/teach/` | OOP 面试 | 部分 | 上游 | 上游 | 同上 |
| `面试/工程领导力资源/teach/` | 工程领导力 | 部分 | 上游 | 上游 | 同上 |
| `operating_systems/teach/` | 操作系统 | OK(ADR-0004 已合并双份) | `teach/lessons/` 25 + `lessons/` 88+ | `teach/learning-records/` 16 | 主线 |
| `advanced_oop/teach/` | 面向对象设计 | OK | 11 | 2 | |
| `learn-code/teach/` | 编程入门(xv6) | OK(ADR-0006 兜底) | 2 | 1 | |
| `数据结构与算法/` | 数据结构与算法 | 三套并存待收敛(ADR-0005) | `teach_副本/lessons/` 20 | 无 | |
| `agent开发/` | Agent 开发 | book-course + from-zero 双轨 | `lessons/` 18 + `from-zero/lessons/` 13 | 3 | 旧目录,暂不动 |

## 辅助课程

| 目录 | 主题 | teach 脚手架 | 备注 |
| --- | --- | --- | --- |
| `多媒体/teach/` | 多媒体系统 | OK(ADR-0006 补 2 子目录) | |
| `skill开发/teach/` | Skill 开发 | OK(ADR-0006 兜底) | 无新投入 |

## 索引生成

```powershell
pwsh -File scripts/courses-stats.ps1
```

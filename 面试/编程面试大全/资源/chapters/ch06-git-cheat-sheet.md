# Ch06: Git 速查表(Git Cheat Sheet, GitHub Education)

**来源**: `cheat-sheets/git-cheat-sheet-education.pdf`(2 页,GitHub Education)

## Core Idea
Git 最常用命令按使用场景分组的速查表:安装配置、暂存快照、分支合并、远程同步、历史检查、路径追踪、忽略规则、临时保存(stash)、历史重写。面试中考"Git 常用命令有哪些""git rebase 和 git merge 区别"时的第一手参照。

## Key Concepts
- **工作区(working directory) → 暂存区(staging area) → 仓库(repository)** 三段式模型:`git add` 从工作区到暂存区,`git commit` 从暂存区到仓库。
- **git merge vs git rebase**:merge 保留两条分支各自的历史并产生一个合并提交;rebase 把当前分支的提交"重新播放"到目标分支之后,历史变成线性的。
- **git reset 的三个层次**:软重置(只移动 HEAD)、混合重置(默认,同时清空暂存区)、硬重置(`--hard`,连工作区也清空,不可逆)。

## Reference Tables

### 安装与配置
| 命令 | 作用 |
|---|---|
| `git config --global user.name "[name]"` | 设置提交署名 |
| `git config --global user.email "[email]"` | 设置提交邮箱 |
| `git config --global color.ui auto` | 命令行自动配色 |

### 初始化与克隆
| 命令 | 作用 |
|---|---|
| `git init` | 把当前目录初始化为 Git 仓库 |
| `git clone [url]` | 从远程克隆整个仓库 |

### 暂存与快照
| 命令 | 作用 |
|---|---|
| `git status` | 查看工作区中已修改/已暂存的文件 |
| `git add [file]` | 把文件当前状态加入下次提交(暂存) |
| `git reset [file]` | 取消暂存,但保留工作区改动 |
| `git diff` | 查看已修改但未暂存的差异 |
| `git diff --staged` | 查看已暂存但未提交的差异 |
| `git commit -m "message"` | 把暂存内容提交为一个新快照 |

### 分支与合并
| 命令 | 作用 |
|---|---|
| `git branch` | 列出所有分支(`*` 标记当前分支) |
| `git branch [name]` | 基于当前提交创建新分支 |
| `git checkout` | 切换分支并检出到工作区 |
| `git merge [branch]` | 把指定分支的历史合并进当前分支 |
| `git log` | 查看当前分支的提交历史 |

### 检查与比较
| 命令 | 作用 |
|---|---|
| `git log branchB..branchA` | 显示 branchA 有而 branchB 没有的提交 |
| `git log --follow [file]` | 显示某文件的提交历史(跨重命名也能追踪) |
| `git diff branchB...branchA` | 显示 branchA 相对 branchB 的差异 |
| `git show [SHA]` | 以可读格式显示某个 Git 对象 |

### 路径变更追踪
| 命令 | 作用 |
|---|---|
| `git rm [file]` | 从项目删除文件并暂存该删除 |
| `git mv [old] [new]` | 修改文件路径并暂存该移动 |
| `git log --stat -M` | 显示提交记录及路径移动标记 |

### 忽略规则
```
logs/
*.notes
pattern*/
```
把想忽略的模式写进 `.gitignore`(支持直接字符串匹配或通配符)。
`git config --global core.excludesfile [file]` 设置对本机所有仓库生效的全局忽略规则。

### 远程同步
| 命令 | 作用 |
|---|---|
| `git remote add [alias] [url]` | 为远程仓库地址起别名 |
| `git fetch [alias]` | 拉取该远程的全部分支(不合并) |
| `git merge [alias]/[branch]` | 把拉取到的远程分支合并进当前分支 |
| `git push [alias] [branch]` | 把本地分支提交推送到远程 |
| `git pull` | fetch + merge 的组合命令 |

### 历史重写
| 命令 | 作用 |
|---|---|
| `git rebase [branch]` | 把当前分支领先的提交重新应用到指定分支之后 |
| `git reset --hard [commit]` | 清空暂存区并把工作区重写回指定提交(**不可逆**) |

### 临时保存(Stash)
| 命令 | 作用 |
|---|---|
| `git stash` | 保存已修改/已暂存的改动,恢复干净工作区 |
| `git stash list` | 按栈顺序列出所有保存的改动 |
| `git stash pop` | 取出栈顶保存的改动并应用到工作区 |
| `git stash drop` | 丢弃栈顶保存的改动 |

## Key Takeaways
1. `git fetch` 只下载远程数据不合并;`git pull` = `fetch` + `merge`——排查"为什么本地没更新"先想清楚这个区别。
2. `git diff` 看未暂存的改动,`git diff --staged` 看已暂存但未提交的改动——两条命令分别对应工作区↔暂存区、暂存区↔仓库两个边界。
3. `git reset --hard` 会连工作区改动一起清空且不可逆,这是"清空所有改动"和"仅取消暂存"两种意图里风险最高的一种,使用前必须确认没有需要保留的工作。
4. `git rebase` 产出线性历史,`git merge` 保留分支结构和一个额外的合并提交——团队协作中选哪种通常是项目约定,不是技术对错问题。

## Connects To
- 本速查表偏工具使用,与其余章节(语言/算法参考卡)相对独立,是面试中"工程素养"类问题(版本控制、协作流程)的参照。

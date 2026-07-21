# Ch08: Python 速查表(Python Cheat Sheet v1)

**来源**: `cheat-sheets/python-cheat-sheet-v1.pdf`(1 页,AddedBytes.com)

## Core Idea
Python 标准库层面的速查:`sys`/`os` 模块变量、字符串方法、列表方法、文件方法、日期时间方法、类的特殊方法(dunder methods)、切片语法、`strftime`/`strptime` 日期格式码。比 Ch04 更偏"标准库参考",Ch04 更偏"面试高频写法"。

## Key Concepts
- **切片(slice)遵循左闭右开区间** `[start:end)`,负数下标从末尾倒数(`-1` 是最后一个元素)。
- **`__init__`/`__str__`/`__eq__`** 等双下划线方法(dunder methods)是 Python 让自定义类支持内置运算符/函数(如 `print`、`==`、`<`)的机制。
- **`b = a[:]`** 是浅拷贝(shallow copy),只复制最外层引用,不递归复制嵌套对象。

## Reference Tables

### 切片与下标(以 `a = [0,1,2,3,4,5]` 为例)
| 表达式 | 结果 |
|---|---|
| `len(a)` | `6` |
| `a[0]` | `0` |
| `a[5]` | `5` |
| `a[-1]` | `5`(倒数第一个) |
| `a[-2]` | `4` |
| `a[1:]` | `[1,2,3,4,5]` |
| `a[:5]` | `[0,1,2,3,4]` |
| `a[:-2]` | `[0,1,2,3]` |
| `a[1:3]` | `[1,2]` |
| `a[1:-1]` | `[1,2,3,4]` |
| `b = a[:]` | `a` 的浅拷贝 |

### 字符串方法(String Methods,`*` 标记的方法对 8-bit 字符串区分区域设置)
`capitalize()*` `center(width)` `count(sub,start,end)` `decode()` `encode()` `endswith(sub)` `expandtabs()` `find/index(sub,start,end)` `isalnum()*` `isalpha()*` `isdigit()*` `islower()*` `isspace()*` `istitle()*` `isupper()*` `join()` `ljust(width)` `lower()*` `lstrip()` `partition(sep)` `replace(old,new)` `rfind/rindex(sub,start,end)` `rjust(width)` `rpartition(sep)` `rsplit(sep)` `rstrip()` `split(sep)` `splitlines()` `startswith(sub)` `strip()` `swapcase()*` `title()*` `translate(table)` `upper()*` `zfill(width)`

### 列表方法(List Methods)
| 方法 | 作用 |
|---|---|
| `append(item)` | 末尾添加元素 |
| `count(item)` | 统计出现次数 |
| `extend(list)` | 用另一个列表扩展 |
| `index(item)` | 首次出现的下标 |
| `insert(position, item)` | 在指定位置插入 |
| `pop(position)` | 弹出并返回指定位置元素 |
| `remove(item)` | 删除首个匹配的值 |
| `reverse()` | 原地反转 |
| `sort()` | 原地排序 |

### 文件方法(File Methods)
`close()` `flush()` `fileno()` `isatty()` `next()` `read(size)` `readline(size)` `readlines(size)` `seek(offset)` `tell()` `truncate(size)` `write(string)` `writelines(list)`

### 类的特殊方法(Class Special Methods)
`__new__(cls)` `__init__(self, args)` `__del__(self)` `__repr__(self)` `__str__(self)` `__cmp__(self, other)` `__index__(self)` `__hash__(self)` `__getattr__/__getattribute__/__setattr__/__delattr__(self, name)` `__call__(self, args, kwargs)`；比较类:`__lt__` `__le__` `__gt__` `__ge__` `__eq__` `__ne__` `__nonzero__`

### sys 模块变量
| 变量 | 含义 |
|---|---|
| `sys.argv` | 命令行参数列表(`argv[0]` 是脚本名本身) |
| `sys.path` | 模块搜索路径 |
| `sys.modules` | 已加载模块 |
| `sys.stdin/stdout/stderr` | 标准 I/O 文件对象 |
| `sys.platform` | 当前平台 |
| `sys.version_info` | Python 版本信息 |

例:`$ python foo.py bar -c qux --h` → `sys.argv = ['foo.py', 'bar', '-c', 'qux', '--h']`

### os 模块变量
| 变量 | 含义 |
|---|---|
| `os.name` | 操作系统名(`posix`, `nt`, `mac`, ...) |
| `os.curdir` / `os.pardir` | 当前目录 / 父目录字符串 |
| `os.sep` | 路径分隔符 |
| `os.linesep` | 换行符 |
| `os.pathsep` | PATH 环境变量里的分隔符 |
| `os.devnull` | 空设备路径 |

### 日期时间(Datetime / Time 方法)
`date.today()` `datetime.now(tz)` `datetime.utcnow()` `datetime.fromtimestamp(ts)` `datetime.utcfromtimestamp(ts)` `date.fromordinal(ordinal)` `datetime.combine(date, time)` `datetime.strptime(date_string, format)`；时间对象:`time.replace()` `time.isoformat()` `time.strftime(format)` `time.utcoffset()` `time.dst()` `time.tzname()`

### 日期格式码(strftime / strptime)
| 格式码 | 含义 | 格式码 | 含义 |
|---|---|---|---|
| `%a` | 星期缩写(Sun) | `%A` | 星期全称(Sunday) |
| `%b` | 月份缩写(Jan) | `%B` | 月份全称(January) |
| `%d` | 日(01–31,补零) | `%m` | 月(01–12) |
| `%H` | 24 小时制小时 | `%I` | 12 小时制小时 |
| `%M` | 分钟 | `%S` | 秒 |
| `%j` | 一年中的第几天(001–366) | `%p` | AM/PM |
| `%y` | 两位年份 | `%Y` | 四位年份 |
| `%Z` | 时区名 | `%%` | 字面 `%` |
| `%c` | 完整日期时间 | `%x`/`%X` | 日期/时间 |
| `%U`/`%W` | 一年中的第几周(周日/周一起始) | `%w` | 星期几(0=周日) |

## Key Takeaways
1. 切片是左闭右开区间,`a[1:3]` 只取下标 1、2,不含下标 3——面试写滑动窗口/双指针题时最容易在边界上出错。
2. `b = a[:]` 只做浅拷贝,若 `a` 里的元素本身是可变对象(如嵌套列表),`b` 和 `a` 仍会共享这些内部对象。
3. 定义 `__eq__`/`__lt__` 等比较类 dunder 方法后,自定义对象才能被 `sorted()`/`==` 正确处理——这是"面试要求实现自定义排序键"时的常见需求。
4. `sys.argv[0]` 永远是脚本名本身,真正的命令行参数从 `sys.argv[1]` 开始。

## Connects To
- **Ch04(面试 Python 语言要点)**:两章合起来覆盖 Python——Ch04 是"面试高频写法",本章是"标准库方法参考"。

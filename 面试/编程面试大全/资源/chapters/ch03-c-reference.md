# Ch03: C 语言参考卡(C Reference Card, ANSI)

**来源**: `cheat-sheets/C Reference Card (ANSI) 2.2.pdf`(2 页,J.H. Silverman,2007 v2.2)

## Core Idea
ANSI C 的语法速查卡:程序结构、数据类型、运算符、预处理指令、标准库函数(I/O、字符串、内存、数学、时间)一次性列全。用于面试中快速确认某个 C 标准库函数的确切签名或某个类型的取值范围。

## Key Concepts
- **函数原型 vs 函数定义**:`type fnc(type1, ...);` 是原型声明,`type fnc(arg1, ...) { ... }` 才是定义体。
- **指针声明语法**:`type *name;` 声明指向 type 的指针;`type (*pf)();` 声明"指向返回 type 的函数的指针"(和 `type *f();` "返回指针的函数"是两回事,面试常考辨析)。
- **存储类别关键字**:`extern`(声明外部变量)、`static`(文件内私有 / 函数内跨调用保持状态,两种含义共用一个关键字)。
- **格式化 I/O 转换码**:`%d/%i`(int)、`%u`(unsigned)、`%f/%e/%g`(浮点不同显示形式)、`%o/%x`(八/十六进制)、`%c/%s`(字符/字符串)。

## Reference Tables

### 程序结构与函数
| 语法 | 含义 |
|---|---|
| `type fnc(type1, ...);` | 函数原型声明 |
| `type name;` | 变量声明 |
| `int main(void) { ... }` | 主函数 |
| `type fnc(arg1, ...) { declarations statements return value; }` | 函数定义 |
| `/* */` | 注释 |
| `int main(int argc, char *argv[])` | 带命令行参数的 main |
| `exit(arg);` | 终止程序执行 |

### 常量
| 类型 | 写法示例 |
|---|---|
| 后缀:long, unsigned, float | `65536L`, `-1U`, `3.0F` |
| 指数形式 | `4.2e1` |
| 前缀:八进制、十六进制 | `0`, `0x` / `0X`(例:`031` 是十进制 25,`0x31` 是十进制 49) |
| 字符常量 | `'a'`, `'\ooo'`(八进制), `'\xhh'`(十六进制) |
| 转义字符 | `\n`(换行) `\r`(回车) `\t`(制表) `\b`(退格) |
| 特殊字符转义 | `\\`, `\?`, `\'`, `\"` |
| 字符串常量(以 `\0` 结尾) | `"abc...de"` |

### 流程控制语句
| 语句 | 语法 |
|---|---|
| 跳出 switch/while/do/for | `break;` |
| 进入下一次迭代 | `continue;` |
| 跳转 | `goto label;` |
| 标签 | `label: statement` |
| 函数返回值 | `return expr;` |
| if | `if (expr1) stmt1 else if (expr2) stmt2 else stmt3` |
| while | `while (expr) statement` |
| for | `for (expr1; expr2; expr3) statement` |
| do-while | `do statement while (expr);` |
| switch | `switch (expr) { case const1: stmt1; break; ... default: stmt; }` |

### 指针 / 数组 / 结构体
| 语法 | 含义 |
|---|---|
| `type *name;` | 声明指向 type 的指针 |
| `type *f();` | 声明返回指针的函数 |
| `type (*pf)();` | 声明指向"返回 type 的函数"的指针 |
| `void *` | 通用指针类型 |
| `NULL` | 空指针常量 |
| `*pointer` | 指针所指向的对象 |
| `&name` | 取变量地址 |
| `name[dim]` | 数组 |
| `name[dim1][dim2]...` | 多维数组 |
| `struct tag { declarations }` | 结构体模板 |
| `struct tag name` | 创建结构体实例 |
| `name.member` | 结构体成员访问 |
| `pointer->member`(等价于 `(*p).x` / `p->x`) | 指针指向的结构体成员访问 |
| `union` | 单一对象存放多种可能类型 |
| `unsigned member : b;` | 位域(b 位) |

### 数据类型 / 声明
| 类型 | 说明 |
|---|---|
| `char` | 字符(1 字节) |
| `int` | 整数 |
| `float`, `double` | 单精度/双精度实数 |
| `short` | 16 位整数 |
| `long` | 32 位整数 |
| `long long` | 64 位整数 |
| `signed` / `unsigned` | 有符号 / 非负(模 2ᵐ) |
| `int*`, `float*`, ... | 指针类型 |
| `enum tag { name1=value1, ... };` | 枚举常量 |
| `type const name;` | 只读常量 |
| `extern` | 声明外部变量 |
| `static`(文件级) | 仅本源文件内可见 |
| `static`(函数内) | 跨调用保持局部变量状态 |
| `void` | 无返回值 |
| `struct tag {...};` | 结构体类型 |
| `typedef type name;` | 为数据类型创建新名字 |
| `sizeof object` / `sizeof(type)` | 对象/类型大小(结果类型 `size_t`) |

### 运算符(按优先级分组,从高到低)
| 运算符 | 含义 |
|---|---|
| `.` / `->` | 结构体成员 / 通过指针访问成员 |
| `++`, `--` | 自增自减 |
| `+, -, !, ~` | 正负号、逻辑非、按位取反 |
| `*pointer`, `&name` | 间接引用 / 取地址 |
| `(type) expr` | 强制类型转换 |
| `sizeof` | 求大小 |
| `*, /, %` | 乘、除、取模 |
| `+, -` | 加、减 |
| `<<, >>` | 左移、右移(位操作) |
| `>, >=, <, <=` | 关系比较 |
| `==, !=` | 相等 / 不等 |
| `&` | 按位与 |
| `^` | 按位异或 |
| `\|` | 按位或(含) |
| `&&` | 逻辑与 |
| `\|\|` | 逻辑或 |
| `expr1 ? expr2 : expr3` | 条件表达式 |
| `+=, -=, *=, ...` | 赋值运算符 |
| `,` | 表达式求值分隔符 |

### C 预处理指令
| 指令 | 含义 |
|---|---|
| `#include <filename>` | 引入库文件 |
| `#include "filename"` | 引入用户文件 |
| `#define name text` | 替换文本 |
| `#define name(var) text` | 替换宏,例:`#define max(A,B) ((A)>(B) ? (A) : (B))` |
| `#undef name` | 取消定义 |
| `#` | 引用替换中的字符串,例:`#define msg(A) printf("%s = %d", #A, (A))` |
| `##` | 拼接参数并重新扫描 |
| `#if, #else, #elif, #endif` | 条件编译 |
| `#ifdef, #ifndef` | 是否已定义 |
| `defined(name)` | 判断是否定义 |
| `\`(行尾) | 续行符 |

### 标准 I/O(`<stdio.h>`)
| 函数 | 说明 |
|---|---|
| `stdin` / `stdout` / `stderr` | 标准输入/输出/错误流 |
| `EOF` | 文件结束标志(int 类型) |
| `getchar()` / `putchar(chr)` | 读/写单个字符 |
| `printf("format", arg1, ...)` | 格式化输出 |
| `sprintf(s, "format", arg1, ...)` | 格式化输出到字符串 |
| `scanf("format", &name1, ...)` | 格式化读取 |
| `sscanf(s, "format", &name1, ...)` | 从字符串格式化读取 |
| `puts(s)` | 输出字符串 |
| `fopen("name","mode")` | 打开文件(模式:r/w/a,可加 b 表示二进制) |
| `fclose(fp)` | 关闭文件 |
| `fgets(s, max, fp)` / `fputs(s, fp)` | 读/写一行 |
| `fread(*ptr, eltsize, n, fp)` / `fwrite(*ptr, eltsize, n, fp)` | 按元素块读/写 |
| `ferror(fp)` / `feof(fp)` | 是否出错 / 是否已到文件末尾 |

### 格式化 I/O 转换码 `"%-+ 0w.pmc"`
| 符号 | 含义 |
|---|---|
| `-` | 左对齐 |
| `+` | 带符号打印 |
| 空格 | 无符号时打印空格 |
| `0` | 前导补零 |
| `w` | 最小字段宽度 |
| `p` | 精度 |
| `h`/`l`/`L` | 长度修饰(short / long / long double) |
| `d,i` | 有符号整数 | `u` | 无符号整数 |
| `c` | 单字符 | `s` | 字符串 |
| `f` | 浮点(printf) | `e,E` | 指数形式 |
| `o` | 八进制 | `x,X` | 十六进制 |
| `p` | 指针 | `n` | 已写字符数 |
| `g,G` | 依指数大小自动选 f 或 e |

### 字符串操作(`<string.h>`)
| 函数 | 说明 |
|---|---|
| `strlen(s)` | 长度 |
| `strcpy(s,ct)` | 复制 |
| `strcat(s,ct)` | 拼接 |
| `strcmp(cs,ct)` / `strncmp(cs,ct,n)` | 比较(整串 / 前 n 字符) |
| `strchr(cs,c)` / `strrchr(cs,c)` | 查找首次/末次出现位置 |
| `memcpy/memmove(s,ct,n)` | 复制 n 字节(memmove 允许重叠) |
| `memcmp(cs,ct,n)` | 比较 n 字节 |
| `memchr(cs,c,n)` | 在前 n 字节中查找字符 |
| `memset(s,c,n)` | 将前 n 字节设为字符 c |

### 字符分类测试(`<ctype.h>`)
`isalnum` `isalpha` `iscntrl` `isdigit` `isgraph` `islower` `isprint` `ispunct` `isspace` `isupper` `isxdigit`,以及大小写转换 `tolower(c)` / `toupper(c)`。

### 标准工具函数(`<stdlib.h>`)
| 函数 | 说明 |
|---|---|
| `abs(n)` / `labs(n)` | int / long 绝对值 |
| `div(n,d)` / `ldiv(n,d)` | 整除,返回含 quot/rem 的结构体 |
| `rand()` / `srand(n)` | 伪随机数 / 设置种子 |
| `atof(s)` / `atoi(s)` / `atol(s)` | 字符串转 double/int/long |
| `strtod/strtol/strtoul(s,&endp,...)` | 带结束指针的转换 |
| `malloc(size)` / `calloc(nobj,size)` | 分配内存 |
| `realloc(ptr,size)` | 调整内存大小 |
| `free(ptr)` | 释放内存 |
| `bsearch(key,array,n,size,cmpf)` | 数组二分查找 |
| `qsort(array,n,size,cmpf)` | 数组升序排序 |

### 数学函数(`<math.h>`,参数与返回值均为 double)
`sin/cos/tan`、`asin/acos/atan`、`atan2(y,x)`、`sinh/cosh/tanh`、`exp/log/log10`、`pow(x,y)/sqrt(x)`、`ceil/floor/fabs`。

### 整型 / 浮点型取值范围(`<limits.h>` / `<float.h>`)
32 位 Unix 系统典型值:`CHAR_BIT`=8,`INT_MAX`=+2,147,483,647,`INT_MIN`=−2,147,483,648,`LONG_MAX/MIN` 同 int(该表按 32 位 long 给出),`UINT_MAX`=4,294,967,295;`FLT_MAX`≈3.4E38,`FLT_MIN`≈1.2E−38,`DBL_MAX`≈1.8E308,`DBL_MIN`≈2.2E−308。

## Key Takeaways
1. `type *f();` 和 `type (*pf)();` 是完全不同的声明(返回指针的函数 vs 指向函数的指针)——这是 C 语法辨析题的经典坑。
2. `static` 在文件作用域和函数作用域含义不同:前者限制可见范围,后者让局部变量跨调用保持状态。
3. `malloc/calloc/realloc` 分配的内存必须用 `free` 释放,忘记释放就是内存泄漏——C 没有垃圾回收。
4. `qsort`/`bsearch` 需要一个比较函数指针参数(`cmpf`),这是 C 里"传递行为"的标准方式(C++ 里对应 STL 算法的 `Compare` 模板参数,见 Ch09)。

## Connects To
- **Ch05(C++ 参考)**:C++ 是 C 的超集,`struct`/指针/预处理这些语法在 C++ 里基本兼容,但 C++ 额外引入了类、引用、模板等机制。
- **Ch01(Big-O)**:`qsort` 的复杂度即对应 Ch01 表中的 Quicksort 一行。

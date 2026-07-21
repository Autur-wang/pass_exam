# Ch04: 面试 Python 语言要点(Coding Interview Python Language Essentials)

**来源**: `cheat-sheets/Coding Interview Python Language Essentials.pdf`(5 页,2020/9/24)

## Core Idea
面试高频用到的 12 个 Python 语法点速查,覆盖数据结构基本操作(dict/queue/stack)、异常处理、字符串、类型转换、算术运算、二维数组、排序、switch 替代写法、枚举、位运算。

## Key Concepts
- 原文档使用 **Python 2** 语法(`print x` 不带括号,`except IOError:` 后跟裸 `print` 语句)——面试时若使用 Python 3,需要把 `print "..."` 改成 `print("...")`,其余语法基本通用。
- Python 没有原生 `switch` 语句,用 **字典 + `.get()`** 模拟(第 10 条)。

## Reference Tables

### 1. 哈希表(dict)
```python
thisdict = {'bob': 7387, 'alice': 3719, 'jack': 7052}
x = thisdict["bob"]            # 按 key 取值
thisdict["alice"] = 2456       # 按 key 赋值
for x in thisdict: print(x)            # 遍历 key
for x in thisdict: print(thisdict[x])  # 遍历 value
```

### 2. 队列(Queue)
```python
from queue import Queue
q = Queue(maxsize=3)
q.qsize()     # 当前 maxsize
q.put('a')    # 入队
q.full()      # 是否已满
q.get()       # 出队
q.empty()     # 是否为空
```

### 3. 栈(Stack)
```python
# 方式一:直接用 list
stack = [3, 4, 5]
stack.append(6)   # [3,4,5,6]
stack.pop()        # [3,4,5]

# 方式二:自定义类
class Stack:
    def __init__(self):
        self.stack = []
    def isEmpty(self):
        return len(self.stack) == 0
    def push(self, p):
        self.stack.append(p)
    def pop(self):
        return self.stack.pop()
```

### 4. 异常处理
```python
try:
    fh = open("testfile", "r")
    fh.write("This is my test file for exception handling!!")
except IOError:
    print("Error: can't find file or read data")
else:
    print("Written content in the file successfully")  # 无异常时执行
finally:
    print("cleanup code")  # 无论是否异常都执行

# 主动抛出异常
x = 10
if x > 5:
    raise Exception('x should not exceed 5. The value of x was: {}'.format(x))

# 断言
import sys
assert ('linux' in sys.platform), "This code runs on Linux only."
```

### 5. 字符串(不可变)
```python
s = 'hi'
print(s[1])         # i
print(len(s))       # 2
print(s + ' there') # hi there
```
Python 字符串是**不可变**的——拼接会生成新字符串,不会原地修改。

### 6. 类型转换
```python
int("12")                 # 字符串转 int
str(number_to_convert)    # 转字符串
```

### 7. 算术运算
```python
5 % 2       # 取模, 1
5 / 2       # 真除法, 2.5
5 // 2      # 整除, 2
round(51.6) # 52
round(51.5) # 52(四舍五入到偶数的边界情形需实测确认)
round(51.4) # 51
round(2.665, 2)  # 2.67
import math
math.floor(300.16)  # 300
math.ceil(300.16)   # 301
```

### 8. 二维数组
```python
# 方式一:逐行构造
matrix = []
for i in range(rows):
    row = []
    for j in range(cols):
        row.append(0)
    matrix.append(row)

# 方式二:列表推导式(注意不要用 [[0]*5]*5,那样每行是同一个引用)
matrix = [[0 for i in range(5)] for j in range(5)]
```

### 9. 排序
```python
sorted([5, 2, 3, 1, 4])   # 返回新列表,原列表不变

a = [5, 2, 3, 1, 4]
a.sort()                   # 原地排序,无返回值
```

### 10. Switch(用 dict 模拟)
```python
def numbers_to_strings(argument):
    switcher = {0: "zero", 1: "one", 2: "two"}
    return switcher.get(argument, "nothing")  # 第二个参数是默认值
```

### 11. 数组枚举(带下标遍历)
```python
ints = ["a", "b", "c"]
for idx, val in enumerate(ints):
    print(idx, val)
```

### 12. 位运算
```python
a = 60   # 0b0111100
b = 13   # 0b0001101
c = a & b    # AND, c = 12
c = a | b    # OR,  c = 61
c = a ^ b    # XOR, c = 49
c = ~a       # NOT, c = -61
c = a << 2   # 左移, c = 240
c = a >> 2   # 右移, c = 15
```

## Key Takeaways
1. `sorted()` 返回新列表,`.sort()` 原地排序返回 `None`——面试常考的一处易错点。
2. `[[0]*5]*5` 和 `[[0 for _ in range(5)] for _ in range(5)]` 结果看起来一样,但前者 5 行共享同一个内部列表,改一行会连带改动所有行。
3. Python 没有 `switch`,标准替代方案是 `dict.get(key, default)`。
4. `try/except/else/finally` 五个子句职责分明:`else` 只在无异常时跑,`finally` 无论如何都跑——常用于资源清理。

## Connects To
- **Ch08(Python 速查)**:本章聚焦"面试高频写法",Ch08 覆盖更完整的标准库方法列表(字符串/列表/文件/日期)。
- **Ch02(位速查表)**:第 12 条位运算的结果可以对照 Ch02 的位宽/取值范围表验证。

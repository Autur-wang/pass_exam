# Ch07: Java 基础速查表(Java Fundamentals Cheatsheet)

**来源**: `cheat-sheets/Java Fundamentals Cheatsheet.pdf`(2 页,by sschaub, cheatography.com)

## Core Idea
Java 基础语法速查:数据类型、控制流语句、异常处理、类型转换、字符串方法、集合(ArrayList/HashMap)常用方法、运算符。是准备 Java 面试时的语法层"最后一道防线"。

## Key Concepts
- **基本类型(primitive) vs 包装/引用类型**:`byte/short/int/long/float/double/char/boolean` 是基本类型,`String` 是引用类型(不可变对象)。
- **try/catch/finally 可以有多个 catch 块**,按类型从具体到通用排列;`finally` 块无论是否抛异常都会执行。
- **switch 语句需要 `break`**,否则会贯穿执行到下一个 `case`(fall-through)。

## Reference Tables

### 基本数据类型
| 类型 | 示例 |
|---|---|
| `byte` / `short` / `int` / `long` | `-123`, `10` |
| `float` / `double` | `235.13` |
| `char` | `'U'` |
| `boolean` | `true`, `false` |
| `String` | `"Greetings from earth"` |

### 控制流语句
```java
// if / else if / else
if (expression) {
    statements
} else if (expression) {
    statements
} else {
    statements
}

// while
while (expression) { statements }

// do-while
do { statements } while (expression);

// for
for (int i = 0; i < max; ++i) { statements }

// for-each
for (var : collection) { statements }

// switch
switch (expression) {
    case value:
        statements
        break;
    case value2:
        statements
        break;
    default:
        statements
}
```

### 异常处理
```java
try {
    statements;
} catch (ExceptionType e1) {
    statements;
} catch (Exception e2) {
    statements;   // 兜底 catch
} finally {
    statements;   // 无论是否异常都会执行
}
```

### 类型转换
```java
// 字符串转数字
int i = Integer.parseInt(str);
double d = Double.parseDouble(str);

// 任意类型转字符串
String s = String.valueOf(value);

// 数值类型间转换(强转)
int i = (int) numericExpression;
```

### 字符串方法(String)
| 方法 | 作用 |
|---|---|
| `s.length()` | 长度 |
| `s.charAt(i)` | 取第 i 个字符 |
| `s.substring(start, end)` | 子串(从 start 到 end-1) |
| `s.toUpperCase()` / `s.toLowerCase()` | 转大写/小写副本 |
| `s.indexOf(x)` | 首次出现位置 |
| `s.replace(old, new)` | 查找替换 |
| `s.split(regex)` | 按正则切分为数组 |
| `s.trim()` | 去除首尾空白 |
| `s.equals(s2)` | 内容相等判断 |
| `s.compareTo(s2)` | 字典序比较(0/正/负) |

### java.util.ArrayList 方法
| 方法 | 作用 |
|---|---|
| `l.add(itm)` | 添加元素 |
| `l.get(i)` | 取第 i 个元素 |
| `l.size()` | 元素个数 |
| `l.remove(i)` | 删除第 i 个元素 |
| `l.set(i, val)` | 修改第 i 个位置的值 |

声明写法:`ArrayList<String> names = new ArrayList<String>();`

### java.util.HashMap 方法
| 方法 | 作用 |
|---|---|
| `m.put(key, value)` | 插入键值对 |
| `m.get(key)` | 按 key 取值 |
| `m.containsKey(key)` | 是否包含该 key |

声明写法:`HashMap<String, String> names = new HashMap<String, String>();`

### 运算符
```
Java 算术运算符: x+y  x-y  x*y  x/y  x%y  ++x/x++  --x/x--
赋值简写: x op= y(例:x += 1 相当于 x = x + 1)
Java 比较运算符: x<y  x<=y  x>y  x>=y  x==y  x!=y
Java 布尔运算符: !x(非)  x&&y(与)  x||y(或)
```

### 文本格式化
```java
System.out.printf("Count is %d\n", count);
s = String.format("Count is %d", count);

s = MessageFormat.format("At {1,time}, {0} eggs hatched.", 25, new Date());

s = NumberFormat.getCurrencyInstance().format(x);
s = new SimpleDateFormat("h:mm a").format(new Date());
s = new DecimalFormat("#,##0.00").format(125.32);
```

### Hello World
```java
import java.util.Date;
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello, world!");
        Date now = new Date();
        System.out.println("Time: " + now);
    }
}
```
保存为 `Hello.java` → 编译 `javac Hello.java` → 运行 `java Hello`。

## Key Takeaways
1. `switch` 里忘写 `break` 会贯穿到下一个 `case`——这是 Java/C 系语言共有的经典坑,写 switch 时先确认每个分支是否需要 break。
2. `try/catch` 可以叠多个 catch 块,顺序应从**具体异常类型到通用类型**——反过来写会导致后面的 catch 永远进不去(编译器通常会报错提示不可达代码)。
3. `ArrayList<T>` 和 `HashMap<K,V>` 是 Java 面试里最常追问的两个集合类型,分别对应"有序可重复"和"键值映射"两类需求。
4. `String.format`/`printf` 的 `%d`(整数)、格式化写法与 Ch03 C 语言的 `printf` 转换码高度相似,可以对照记忆。

## Connects To
- **Ch03(C 参考卡)**:`printf` 格式化转换码在 Java 里基本沿用了 C 的 `%d/%f/%s` 语义。
- **Ch01(Big-O)**:`ArrayList` 对应数组的均摊 O(1) 追加、`HashMap` 对应哈希表的平均 O(1) 存取,复杂度可直接对照 Ch01 表格。

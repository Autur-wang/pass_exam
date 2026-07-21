# Ch05: C++ 参考卡(C++ Reference Card)

**来源**: `cheat-sheets/Cpp_reference.pdf`(2 页,Mississippi State University CSE1284/CSE1384 课程用卡,2009)

## Core Idea
C++ 基础语法速查:数据类型、运算符优先级、控制流、函数传参方式、指针、动态内存、结构体、类与继承、运算符重载、模板。是 C（Ch03）之上叠加的面向对象机制部分。

## Key Concepts
- **按值传递 vs 按引用传递**:`function(type p1)` 是按值(函数内修改不影响外部),`function(type &p1)` 是按引用(修改会传回)——这是 C++ 相对 C 的关键新增能力(C 只能靠指针模拟引用语义)。
- **public / protected / private** 三种访问级别,继承时基类的 protected/private 成员对派生类的可见性规则不同(见下方继承可见性表)。
- **构造函数可重载**:只要参数列表不同,可以定义多个同名构造函数。
- **new/delete 必须配对**:`new` 分配的内存只能用 `delete` 释放,`new[]` 数组必须用 `delete[]` 释放,混用是未定义行为。

## Reference Tables

### 基本数据类型
| 类型 | 说明 |
|---|---|
| `bool` | 布尔(true/false) |
| `char` | 字符 |
| `char[]` | 字符数组(以 null 结尾则可作 C 风格字符串) |
| `string` | C++ 字符串(来自 STL) |
| `int` | 整数 |
| `long int` | 长整数 |
| `float` / `double` | 单精度 / 双精度浮点 |

### 运算符优先级(从高到低)
1. `++`(后置)、`--`(后置)
2. `!`、`++`(前置)、`--`(前置)
3. `*, /, %`
4. `+, -`
5. `<, <=, >, >=`
6. `==, !=`
7. `&&`
8. `||`
9. `=, *=, /=, %=, +=, -=`

### 循环语句
| 语句 | 语法 |
|---|---|
| while | `while (expr) statement;` |
| do-while | `do statement; while (expr);` |
| for | `for (init; test; update) statement;` |

### 控制台 I/O
```cpp
cout << "Enter an integer: ";
cin >> i;
cout << "Input: " << i << endl;
cerr << "error message";  // 输出到标准错误流
```

### 文件 I/O
```cpp
// 输入
ifstream inputFile;
inputFile.open("data.txt");
inputFile >> inputVariable;   // 也可用 get()/getline()
inputFile.close();

// 输出
ofstream outFile;
outFile.open("output.txt");
outFile << outputVariable;
outFile.close();
```

### 判断语句
```cpp
if (expr) { statement; }
else if (expr2) { statement; }
else { statement; }

switch (expr) {
    case const1: statement; break;
    case const2: statement; break;
    default: statement;
}
```

### 函数与参数传递
```cpp
// 按值传递:函数内改动不影响外部
return_type function(type p1) { ... }

// 按引用传递:函数内改动会传回
return_type function(type &p1) { ... }

// 默认参数值
return_type function(type p1 = val) { ... }
```

### 指针
```cpp
char c = 'a';
char* cPtr;
cPtr = &c;          // 取地址
*cPtr = 'b';        // 通过指针改值
cout << *cPtr;      // 解引用读取,输出 b

// 数组名可作为常量指针使用
int numbers[] = {10, 20, 30, 40, 50};
int* numPtr = numbers;
cout << numbers[1];      // 20
cout << *(numPtr + 1);   // 20(等价写法)
```

### 动态内存
| 操作 | 语法 |
|---|---|
| 分配单个对象 | `ptr = new type;` |
| 分配数组 | `ptr = new type[size];` |
| 释放单个对象 | `delete ptr;` |
| 释放数组 | `delete [] ptr;` |

### 结构体
```cpp
struct Hamburger {
    int patties;
    bool cheese;
};

Hamburger h;
h.patties = 2;
h.cheese = true;

Hamburger* hPtr = &h;
hPtr->patties = 1;   // 等价于 (*hPtr).patties = 1
```

### 类
```cpp
class Square {
public:
    Square();                 // 构造函数可重载
    Square(float w);
    void setWidth(float w);
    float getArea();
protected:
    // ...
private:
    float width;
};

// 成员函数定义(类外)
Square::Square() { width = 0; }
void Square::setWidth(float w) { if (w >= 0) width = w; else exit(-1); }
float Square::getArea() { return width * width; }

// 实例化
Square s1();          // 无参构造
Square s2(3.5);        // 带参构造
Square* sPtr = new Square(1.8);
```
`public` 成员任何地方可见;`private` 成员仅同类或友元可见;`protected` 成员同类、派生类、友元可见。

### 继承
```cpp
class Student {
public:
    Student(string n, string id);
    void print();
protected:
    string name;
    string netID;
};

class GradStudent : public Student {
public:
    GradStudent(string n, string id, string prev);
    void print();
protected:
    string prevDegree;
};
```

#### 继承后成员可见性
| 继承方式\基类中的访问级别 | private | protected | public |
|---|---|---|---|
| `private` 继承 | 不可见 | private | private |
| `protected` 继承 | 不可见 | protected | protected |
| `public` 继承 | 不可见 | protected | public |

### 异常
```cpp
try {
    quotient = divide(num1, num2);   // 可能抛异常的代码
    if (num3 < 0) throw -1;           // 可抛值或对象
}
catch (int) {
    cout << "num3 can not be negative!";
    exit(-1);
}
catch (char* exceptionString) {
    cout << exceptionString;
    exit(-2);
}
```

### 运算符重载
```cpp
// 成员函数重载 +
Square operator+ (const Square &);

// 友元函数重载 <<(当左操作数不是自己的类实例时用友元)
friend ostream & operator<< (ostream &, const Square &);
```
关系运算符(`<, >, ==` 等)重载后返回类型应为 `bool`;`<<` 重载应返回 `ostream &`。

### 函数模板 / 类模板
```cpp
template <class T>
T getMax(T a, T b) { return (a > b) ? a : b; }

int a = 9, b = 2, c;
c = getMax(a, b);          // T 自动推导为 int
float f = 5.3, g = 9.7, h;
h = getMax(f, g);           // T 自动推导为 float

template <class T>
class Point {
public:
    Point(T x, T y);
    void print();
    double distance(Point<T> p);
private:
    T x; T y;
};

Point<int> p1(3, 2);
Point<float> p2(3.5, 2.5);
```

## Key Takeaways
1. 按引用传参(`type &p1`)是 C++ 相对 C 的关键增量能力——不再需要靠指针才能"修改外部变量"。
2. `new`/`delete` 必须严格配对(单对象 vs 数组各自配对),否则是未定义行为、内存泄漏或崩溃。
3. 继承可见性规则:`private` 继承会让基类的 `protected`/`public` 成员在派生类中都降级为 `private`;`public` 继承保持原有级别不变。
4. 运算符重载:成员函数重载适合左操作数是本类实例的情况;左操作数不是本类实例时(如 `cout << obj`),必须写成友元函数。
5. 模板让 `getMax`/`Point` 这类代码对任意类型复用,编译期实例化——是 C++ 泛型编程的基础,后续 STL(Ch09)整体建立在模板之上。

## Connects To
- **Ch03(C 参考)**:C++ 的控制流、指针、struct 语法与 C 基本兼容,类/继承/模板/引用是 C++ 独有的新增部分。
- **Ch09(STL)**:STL 的容器与算法全部通过 Ch05 这里的模板机制实现。

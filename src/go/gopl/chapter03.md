# 基础数据类型

Go数据类型分为四类：

* 基础数据类型
* 复合类型
* 引用类型
* 接口类型

## 3.1 整型

数值类型分类整型、浮点数、复数

int8 int16 int32 int64

uint8 uint16 uint32 uint64

还有两种对应特定CPU平台机器字大小的有符号和无符号整数int 和 uint,   32bit 或 64bit， 不同的编译器即使在相同硬件平台上可能产生不同的大小

Unicode字符rune类型和int32等价的类型， 通常表示一个Unicode码点， 可以互换使用

byte是uint8的等价类型

还有一种无符号整数 uintptr 没指定大小， 但足够容纳指针， 底层编程才需要

```
&      位运算 AND
|      位运算 OR
^      位运算 XOR
&^     位清空 (AND NOT)
```

对于每种类型T，如果转换允许的话，类型转换操作T(x)将x转换为T类型。许多整数之间的相互转换并不会改变数值；它们只是告诉编译器如何解释这个值。但是对于将一个大尺寸的整数类型转为一个小尺寸的整数类型，或者是将一个浮点数转为整数，可能会改变数值或丢失精度

```Go
f := 3.141 // a float64
i := int(f)
f = 1.99
fmt.Println(int(f)) // "1"
```

八进制 0 开头， 十六进制0X开头

fmt包打印一个数值时，我们可以用%d、%o或%x参数控制输出的进制格式



## 3.2 浮点数

float32  和 float64

正无穷大和负无穷大，分别用于表示太大溢出的数字和除零的结果

NaN非数，一般用于表示无效的除法操作结果0/0或Sqrt(-1)

math.IsNaN用于测试一个数是否是非数NaN,  math.NaN则返回非数对应的值

```Go
nan := math.NaN()
fmt.Println(nan == nan, nan < nan, nan > nan) // "false false false"
```



## 3.3 复数

complex64  和 complex128, 分别对应float32 和 float64两种浮点数精度， 内置的complex函数用于构造复数， real和imag函数用来返回实部和虚部

```Go
var x complex128 = complex(1, 2) // 1+2i
var y complex128 = complex(3, 4) // 3+4i
fmt.Println(x*y)                 // "(-5+10i)"
fmt.Println(real(x*y))           // "-5"
fmt.Println(imag(x*y))           // "10"
```

浮点数面值或一个十进制整数面值后面跟着一个i，例如3.14i或2i，它将构成一个复数的虚部，复数的实部是0



## 3.4 布尔类型

true 和 false

`&&`的优先级比`||`高（助记：`&&`对应逻辑乘法，`||`对应逻辑加法，乘法比加法优先级要高

布尔值并不会隐式转换为数字值0或1，反之亦然。必须使用一个显式的if语句辅助转换

数字到布尔类型的转换

```Go
func itob(i int) bool { return i != 0 }
```



## 3.5 字符串

len函数可以返回一个字符串中的字节数目

索引操作s[i]返回第i个字节的字节值，i必须满足0 ≤ i< len(s)条件约束

如果试图访问超出字符串索引范围的字节将会导致panic异常

子字符串操作s[i:j]基于原始的s字符串的第i个字节开始到第j个字节，生成一个新字符串。 i还是j都可能被忽略

```Go
fmt.Println(s[0:5]) // "hello"
```

字符串可以用==和<进行比较；比较通过逐个字节比较完成的

一个原生的字符串面值形式是\`...\`，使用反引号代替双引号。在原生的字符串面值中，没有转义操作；全部的内容都是字面的意思，包含退格和换行，因此一个程序中的原生字符串面值可能跨越多行

### Unicode

ASCII 只有7bit表示128个字符， Unicode对应Go语言中的rune整数类型， 是int32等价类型， Unicode超过120000个字符， 可以将一个符文序列表示为int32序列， 这种编码叫做UTF-32 和 UCS-4  ， 这种很简单， 但是会浪费大量存储空间， 大部分都是ASCII码



### UTF-8

UTF8是一个将Unicode码点编码为字节序列的变长编码. UTF8编码使用1到4个字节来表示每个Unicode码点，ASCII部分字符只使用1个字节，常用字符部分使用2或3个字节表示

如果第一个字节的高端bit为0，则表示对应7bit的ASCII字符

如果第一个字节的高端bit是110，则说明需要2个字节；后续的每个高端bit都以10开头。

```
0xxxxxxx                             runes 0-127    (ASCII)
110xxxxx 10xxxxxx                    128-2047       (values <128 unused)
1110xxxx 10xxxxxx 10xxxxxx           2048-65535     (values <2048 unused)
11110xxx 10xxxxxx 10xxxxxx 10xxxxxx  65536-0x10ffff (other valuesunused)
```

变长的编码无法直接通过索引来访问第n个字符， 但是有很多额外的优点

1. 比较紧凑， 完全兼容ASCII

unicode/utf8包则提供了用于rune字符序列的UTF8编码和解码的功能

unicode包提供了诸多处理rune字符相关功能的函数



### 字符串和Byte切片

标准库有四个包对字符串处理尤为重要： `bytes`、`strings`·、 `strconv`、`unicode` 

strings 提供了字符串查询、替换、比较、截断、拆分和合并等功能

strconv 提供了布尔、整型、浮点数、对应字符串的相互转换， 还提供了双引号转义相关的转换

unicode包提供了IsDigit、IsLetter、IsUpper和IsLower等类似功能，它们用于给字符分类

一个字符串是包含的只读字节数组，一旦创建，是不可变的。相比之下，一个字节slice的元素则可以自由地修改。

```Go
s := "abc"
b := []byte(s)
s2 := string(b)
```

整数与字符串转换

```Go
fmt.Println(y, strconv.Itoa(x)) // "123 123"
fmt.Println(strconv.FormatInt(int64(x), 2)) // "1111011"
x, err := strconv.Atoi("123")             // x is an int
y, err := strconv.ParseInt("123", 10, 64) // base 10, up to 64 bits
```



## 3.6 常量

常量表达式的值在编译期计算，而不是在运行期。每种常量的潜在类型都是基础类型：boolean、string或数字

常量间的所有算术运算、逻辑运算和比较运算的结果也是常量，对常量的类型转换操作或以下函数调用都是返回常量结果：len、cap、real、imag、complex和unsafe.Sizeof

常量可以是构成类型的一部分

```Go
const IPv4Len = 4
var p [IPv4Len]byte
```

一个常量的声明也可以包含一个类型和一个值，但是如果没有显式指明类型，那么将从右边的表达式推断类型

### iota常量生成器

用于生成一组以相似规则初始化的常量

```Go
type Weekday int

const (
    Sunday Weekday = iota
    Monday
    Tuesday
    Wednesday
    Thursday
    Friday
    Saturday
)
// 每个常量对应表达式1 << iota，是连续的2的幂
type Flags uint

const (
    FlagUp Flags = 1 << iota // is up
    FlagBroadcast            // supports broadcast access capability
    FlagLoopback             // is a loopback interface
    FlagPointToPoint         // belongs to a point-to-point link
    FlagMulticast            // supports multicast access capability
)
const (
    _ = 1 << (10 * iota)
    KiB // 1024
    MiB // 1048576
    GiB // 1073741824
    TiB // 1099511627776             (exceeds 1 << 32)
    PiB // 1125899906842624
    EiB // 1152921504606846976
    ZiB // 1180591620717411303424    (exceeds 1 << 64)
    YiB // 1208925819614629174706176
)
```

### 无类型常量

许多常量并没有一个明确的基础类型。编译器为这些没有明确的基础类型的数字常量提供比基础类型更高精度的算术运算；你可以认为至少有256bit的运算精度。

math.Pi无类型的浮点数常量，可以直接用于任意需要浮点数或复数的地方：

只有常量可以是无类型的。当一个无类型的常量被赋值给一个变量的时候， 无类型的常量将会被隐式转换为对应的类型，如果转换合法的话
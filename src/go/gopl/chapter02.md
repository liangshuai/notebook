# 程序结构

## 2.1 命名 

Go语言的命名规则：

> 一个名字必须以字母或下划线开头， 后面可以跟任意数量的字母、数字、下划线， 大小写敏感。

Go语言的关键字有

```
break      default       func     interface   select
case       defer         go       map         struct
chan       else          goto     package     switch
const      fallthrough   if       range       type
continue   for           import   return      var
```

此外还有30个预定义的名字， 主要对应内建的常量、类型、函数

```
内建常量: true false iota nil

内建类型: int int8 int16 int32 int64
         uint uint8 uint16 uint32 uint64 uintptr
         float32 float64 complex128 complex64
         bool byte rune string error

内建函数: make len cap new append copy close delete
          complex real imag
          panic recover
```

这些预定义的名字并不是关键字， 可以在定义中重新使用它们



名字定义在函数内部， 只有函数内生效。 

如果定义在函数外部， 那么当前包所有的文件都可以访问

名字开头字母的大小写决定了名字在包外的可见性

包名一般总是小写字母

名字长度没有限制， 但尽量使用短小的名字， 推荐驼峰式命名



## 2.2 声明

Go语言中主要有四种类型的声明语句： `var` 、`const` 、`type` 、`func` 分别对应变量、常量、类型和函数实体对象的声明。

每个go源文件以包声明语句开始， 其后跟import语句导入依赖的其它包， 然后是包一级的类型、变量、常量、函数声明语句。 

包级别声明的语句在整个包的每个源文件中都可以访问， 而不仅仅在其声明语句所在的源文件中

一个函数的声明由函数名字、参数列表、一个可选的返回值列表 和包含函数定义的函数体组成

```go
func fToC(f float64) float64 {
    return (f - 32) * 5 / 9
}
```



## 2.3 变量

```Go
var 变量名字 类型 = 表达式
```

类型和表达式可以省略其中的一个， 如果不声明表达式， 那么将使用零值初始化该变量。 数值类型为0， 布尔false，字符串为空字符串， 接口或引用类型为nil

零值初始化机制可以确保每个声明的变量总是有一个良好定义的值， 因此Go中不存在未初始化的变量

也可以在声明语句中同时声明一组变量或用一组初始化表达式声明并初始化一组变量， 如果省略每个变量的类型，将可以同时声明多个类型不同的变量

```go
var i, j, k int                 // int, int, int
var b, f, s = true, 2.3, "four" // bool, float64, string
```

初始化表达式可以是字面量或任意表达式， 在包级别声明的变量会在main函数执行前完成初始化， 局部变量将在声明语句被执行到的时候进行初始化

一组变量也可以通过调用一个函数， 由函数返回的多个返回值初始化

```go
var f, err = os.Open(name)
```

在函数内部有一种称为简短变量声明语句的形式可以用于声明和初始化局部变量。

```go
anim := gif.GIF{LoopCount: nframes}
freq := rand.Float64() * 3.0
i, j := 0, 1
f, err := os.Open(name)
```

简短变量声明被广泛用于大部分的局部变量的声明和初始化，var形式的声明通常用于需要显示指定变量类型的地方或者变量稍后才会被赋值的地方

简短变量声明语句中必须至少要声明一个新的变量， 否则代码不能编译通过

```go
f, err := os.Open(infile)
// ...
f, err := os.Create(outfile)
```

解决办法是第二个简短变量声明语句改成普通的多重赋值语句



### 指针

并不是每个值都会有一个内存地址， 但是对于每一个变量必然有对应的内存地址， 通过指针， 我们可以读取或更新对应变量的值， 而不需要知道变量的名字。

果用“var x int”声明语句声明一个x变量，那么&x表达式（取x变量的内存地址）将产生一个指向该整数变量的指针，指针对应的数据类型是`*int`，指针被称之为“指向int类型的指针”。如果指针名字为p，那么可以说“p指针指向变量x”，或者说“p指针保存了x变量的内存地址”。同时`*p`表达式对应p指针指向的变量的值。一般`*p`表达式读取指针指向的变量的值，这里为int类型的值，同时因为`*p`对应一个变量，所以该表达式也可以出现在赋值语句的左边，表示更新指针所指向的变量的值

```Go
x := 1
p := &x         // p, of type *int, points to x
fmt.Println(*p) // "1"
*p = 2          // equivalent to x = 2
fmt.Println(x)  // "2"
```

变量有时候被称为可寻址的值

任何类型的指针的零值都是nil， 如果是有效变量那么 p  != nil

```go
var x, y int
fmt.Println(&x == &x, &x == &y, &x == nil) // "true false false"
```

```go
func f() *int {
    v := 1
    return &v
}
fmt.Println(f() == f()) // "false"
```

```go
func incr(p *int) int {
    *p++ // 非常重要：只是增加p指向的变量的值，并不改变p指针！！！
    return *p
}
```

每次对一个变量取地址或者复制指针， 就为原变量创建了一个新的别名，所以我们可以不用名字而访问到一个变量



### new函数

另一个创建变量的方法是调用内建的new函数， `new(T)`  将创建一个T类型的匿名变量， 初始化为T类型的零值， 返回变量地址，即指针类型 *T

```go
p := new(int)   // p, *int 类型, 指向匿名的 int 变量
fmt.Println(*p) // "0"
*p = 2          // 设置 int 匿名变量的值为 2
fmt.Println(*p) // "2"
```



### 变量的声明周期

包一级声明的变量生命周期和整个程序的运行周期一致

局部变量的生命周期是动态的，不再引用时被垃圾回收机制回收

局部变量可能在函数返回之后依然存在， 只要是有效引用

```Go
var global *int

func f() {
    var x int
    x = 1
    global = &x
}
```

x会从函数f中逃逸了



## 2.4 赋值

```Go
x = 1                       // 命名变量的赋值
*p = true                   // 通过指针间接赋值
person.name = "bob"         // 结构体字段赋值
count[x] = count[x] * scale // 数组、slice或map的元素赋值
```

### 元组赋值

```Go
x, y = y, x
a[i], a[j] = a[j], a[i]
f, err = os.Open("foo.txt")
_, err = io.Copy(dst, src) // 丢弃字节数
```

### 可赋值性

除了显示赋值形式， 还有很多隐式赋值， 比如函数调用对参数变量赋值， 返回语句将结果赋值给结果变量，复合类型的字面量赋值行为

```Go
medals := []string{"gold", "silver", "bronze"}
```



这些 必须满足赋值语句左边的变量和右边最终求值必须有相同的类型，赋值才是被允许的， nil可以赋值给任何指针或引用类型的变量

两个值是否可以用 == 和 !=  进行相等比较的能力也和可赋值能力有关系， 第二个值必须是对第一个值对应的变量是可赋值性的。
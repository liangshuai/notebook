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




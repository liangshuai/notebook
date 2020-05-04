# 复合数据类型

数组和结构体是聚合类型， 数组由完全相同类型的元素组成， 结构体则是由异构的元素组成的，它们都是固定内存大小的数据结构。 而slice和map是动态数据结构， 动态增加大小

## 4.1 数组

Go语言中很少直接使用数组， 更多使用的是slice

```Go
var a [3]int 
fmt.Println(a[len(a)-1])
for i, v := range a {
    fmt.Printf("%d %d\n", i, v)
}
var q [3]int = [3]int{1, 2, 3}
var r [3]int = [3]int{1, 2}
fmt.Println(r[2]) // "0"

q := [...]int{1, 2, 3} // 根据初始值计算长度
r := [...]int{99: -1}  // 长度100， 前99个是初始值0， 最后一个是-1
```

```Go
a := [2]int{1, 2}
b := [...]int{1, 2}
c := [2]int{1, 3}
fmt.Println(a == b, a == c, b == c) // "true false false"
d := [3]int{1, 2}
fmt.Println(a == d) // compile error: cannot compare [2]int == [3]int
```

当调用一个函数时， 函数的每个调用参数将会被赋值给函数内部的参数变量， 函数接收到的时复制的副本， 并不是原始的变量， 因此传递大的数组类型是低效的， 并且任何修改只发生在复制出来的数组上， 并不能直接修改调用时的原始数组变量， 这跟其它语言作为引用或指针对象传入调用函数的方式是不一样的。

所以也可以传入一个数组指针的方式

```Go
func zero(ptr *[32]byte) {
    for i := range ptr {
        ptr[i] = 0
    }
}
```



## 4.2 Slice

Slice代表变长的序列， 序列的每个元素都有相同的类型， 语法跟数组很像。 一个slice包含指针、长度、容量

```go
Q2 := months[4:7]
for idx, q := range Q2 {
    .....
}
```

如果切片操作cap(s) 超出了上限，将会导致一个panic异常。

slice的切片操作s[i:j]，其中0 ≤ i≤ j≤ cap(s)，用于创建一个新的slice，引用s的从第i个元素开始到第j-1个元素的子序列

字符串也有x[m:n] 返回原始字节系列的子序列

```go
func reverse(s []int) {
    for i, j := 0, len(s)-1; i < j; i, j = i+1, j-1 {
        s[i], s[j] = s[j], s[i]
    }
}
```

```Go
a := [...]int{0, 1, 2, 3, 4, 5}
reverse(a[:])
fmt.Println(a) // "[5 4 3 2 1 0]"
```

向函数传递slice将允许在函数内部修改底层数组的元素

一种将slice元素循环向左旋转n个元素的方法是三次调用reverse反转函数，第一次是反转开头的n个元素，然后是反转剩下的元素，最后是反转整个slice的元素

```Go
s := []int{0, 1, 2, 3, 4, 5}
// Rotate s left by two positions.
reverse(s[:2])
reverse(s[2:])
reverse(s)
fmt.Println(s) // "[2 3 4 5 0 1]"
```

slice跟数组声明比较像， 不过没有指定长度

和数组不同的是slice不能比较， 不能通过 ==操作符来判断两个slice是否含有全部相同的元素。 slice唯一合法的比较操作是和nil 比较

slice长度为0 不等于就是nil

```Go
var s []int    // len(s) == 0, s == nil
s = nil        // len(s) == 0, s == nil
s = []int(nil) // len(s) == 0, s == nil
s = []int{}    // len(s) == 0, s != nil
```

### append函数

append(slice, T) 可用于向slice追加元素 

可以使用make来扩容

```Go
make([]T, len)
make([]T, len, cap) // same as make([]T, cap)[:len]
```

```Go
copy(z, x)
```

copy会将slice内容从x拷贝到目标slice z

内置的append函数可以追加多个元素

```Go
var x []int
x = append(x, 4, 5, 6)
x = append(x, x...) // append the slice x
```

```Go
func appendInt(x []int, y ...int) []int {
    var z []int
    zlen := len(x) + len(y)
    // ...expand z to at least zlen...
    copy(z[len(x):], y)
    return z
}
```





## 4.3 Map

map中所有的key都有相同的类型， 所有的value也有相同的类型， key必须是支持==比较运算符的数据类型

```Go
ages := make(map[string]int) // mapping from strings to ints
ages["alice"] = 31
ages["charlie"] = 34
// 等价于
ages := map[string]int{
    "alice":   31,
    "charlie": 34,
}
fmt.Println(ages["alice"]) // "32"
delete(ages, "alice") // remove element ages["alice"]
ages["bob"] = ages["bob"] + 1 // 即使bob不存在也不会报错， 等价于ages["bob"]++
for name, age := range ages {
    fmt.Printf("%s\t%d\n", name, age)
}
```

不能对map元素进行取址`&ages["bob"]` ， map可能随着元素数量的增长而重新分配更大的内存空间， 导致之前的地址无效

map遍历顺序并不固定， 因此可以遍历出keys， 然后使用 对其进行排序， 在遍历

```Go
if age, ok := ages["bob"]; !ok { /* ... */ }
```

和slice一样，map之间也不能进行相等比较；唯一的例外是和nil进行比较。要判断两个map是否包含相同的key和value，我们必须通过一个循环实现

```Go
func equal(x, y map[string]int) bool {
    if len(x) != len(y) {
        return false
    }
    for k, xv := range x {
        if yv, ok := y[k]; !ok || yv != xv {
            return false
        }
    }
    return true
}
```



## 4.4 结构体

结构体是由零个或多个任意类型的值聚合成的实体

```Go
type Employee struct {
    ID        int
    Name, Address string
   	Age   	  int
    DoB       time.Time
}
var dilbert Employee
dilbert.Age = 18
name = &dilbert.Name
*name = "Mr " + *name
```

如果结构体成员名字是以大写字母开头的， 那么成员就是导出的

命名为S的结构体不能再包含S类型的成员， 但是可以包含*s类型的指针， 可以创建递归的数据结构

```Go
type tree struct {
    value       int
    left, right *tree
}
```

### 结构体字面量

```Go
type Point struct{ X, Y int }
p := Point{1, 2}
anim := gif.GIF{LoopCount: nframes}
```
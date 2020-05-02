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

Slice代表变长的序列






























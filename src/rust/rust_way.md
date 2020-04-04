Rust编程之道

## 2.1 Rust语言的基本构成

* 语言规范
* 编译器
* 核心库
* 标准库
* 包管理器

rustc负责将Rust源代码编译为可执行文件或其它库文件

rustc跨平台、支持交叉编译、使用LLVM作为编译器后端、rustc也使用Rust编写



Rust语言的语法是由核心库和标准库共同提供， 核心库是标准库的基础

在顶部使用`#! [no_std]` 来使用核心库， 可以用来做嵌入式应用开发



标准库除了与核心库一直的trait、基本数据类型、功能性数据类型和常用宏外， 还提供了并发、IO、运行时、平台抽象、底层操作接口、可选和错误处理类型等。



包管理器

```shell
cargo new bin_crate
cargo new --lib lib_crate
```

通过cargo build和cargo run命令可以对项目进行编译和运行



## 2.2 语句和表达式

语句是指要执行的一些操作和产生副作用的表达式

语句分为声明语句和表达式语句

名字以叹号结尾， 并且可以想函数一样被调用的语句， 在Rust中叫做宏

块表达式是由一对花括号和一系列表达式组成， 它总是返回块中最后一个表达式的值，如果最后一个语句是宏语句， 就返回单元值()



## 2.3 变量和绑定

通过`let` 关键字来创建变量

Rust中的表达式一般可以分为位置表达式和值表达式， 通过位置表达式可以对某个数据单元的内存进行读写， 只要是进行写操作

值表达式一般只引用了某个存储单元地址中的数据， 它相当于数据值，只能进行读操作

let 关键字声明的位置表达式默认不可变，为不可变绑定。 可以添加mut 关键字声明可变的位置表达式， 即可变绑定， 可变绑定可以正常修改和赋值



每个变量绑定实际上都拥有该存储单元的所有权， 引用赋值给其它变量， 这种转移内存地址的行为就是所有权的转移， 有时不需要转移所有权， Rust提供引用操作符 `&` 可以直接获取表达式的存储单元地址，即内存位置，可以通过内存位置对存储进行读取。

```rust
fn main() {
  let a = [1, 2, 3];
  let b = &a; // 这不会引起所有权的转移， 因为右侧变为了位置上下文， 而非默认的值上下文
  println!("{:p}", b); // 0x7ffXXXXXXX 这个{：p} 格式打印指针地址
  let mut c = vec![1, 2, 3];
  let d = &mut c; // 获取可变引用
  d.push(4);
  println!("{:?}", d); // [1, 2, 3, 4];
  let e = &42;
  assert_eq!(42, *e);
}
```



## 2.4 函数和闭包

```rust
pub fn fizz_buzz(num: i32) -> String{
  //...
}
```

rust编译器会严格按照上面的类型声明， 如果不是的话就会编译报错

Rust语言的作用域是静态作用域， 即词法作用域， 由一对花括号来开辟作用域， 其作用域在词法分析阶段就已经确定了， 不会动态改变

let声明变量之后还可以再次声明变量绑定， 这种连续用let定义同名变量的做法叫做变量遮蔽Variable Shadow， 最终变量的值是由最后一个变量定义所决定的。

Rust中函数是一等公民， 这意味着函数自身就可以作为函数的参数和返回值使用。

```rust
pub fn math(op: fn(i32, i32) -> i32, a: i32, b: i32) -> i32 {
  // ...
}
fn true_maker() -> fn() -> bool {
  fn is_true() -> bool { true }
}
```



CTFE编译时函数执行， Compile-Time Function Execution

闭包也叫匿名函数， 有一下几个特点

* 可以想函数一样被调用
* 可以驳火上下文环境中的自由变量
* 可以自动推断输入和返回的类型

```rust
fn main() {
  let out = 42;
  // fn add(i: i32, j: i32) -> i32 { i + j + out } 报错
  let closure_annotatedd = |i: i32, j: i32| -> i32 { i + j + out };
  let closure_inferred = |i, j| i + j + out;
  assert_eq!(45, closure_inferred(1, 2));
}
```

闭包和函数一个重要的区别是闭包可以捕获外部变量， 而函数不可以

闭包也可以作为函数参数和返回值， 但使用起来略有区别

```rust
fn math<F: Fn() -> i32>(op: F) -> i32 {
  op()
}

fn main () {
  let a = 2;
  let b = 3;
  assert_eq!(math(|| a + b), 5);
}
```

math参数是一个泛型F， 并且该泛型受Fn() -> i32 trait的限定， 代表该函数只允许实现Fn() -> i32 trait 的类型作为参数

Rust中闭包实际上就是由一个匿名函数体和trait来组合实现的

闭包同样也可以作为返回值

```rust
fn two_times_impl () -> impl Fn(i32) -> i32 {
  let i = 2;
  move |j| i * j
}
```

返回闭包时使用了move关键字， 这是因为一般情况下， 闭包默认会按引用捕获变量， 如果将闭包返回， 引用也会跟着返回， 但是在整个函数调用完毕后， 函数内的本地变量i就会被销毁， 那么随闭包返回的变量i的引用就会成为悬垂指针， 使用move关键字将捕获变量i的所有权转移到闭包中， 就不会按引用进行捕获变量



## 2.5 流程控制

rust中不叫流程控制语句， 而叫流程控制表达式

条件表达式

if表达式的分支必须返回同一个类型的值才可以， 这也是rust没有三元运算符的原因。

```rust
fn main() {
  let n = 13;
  let big_n = if (n < 10 && n > -10) {
    10 * n
  } else {
    n / 2
  };
  assert_eq!(big_n, 6)
}
```

for...in表达式

```rust
fn main () {
  for n in 1..101 {
    println!("{}", n);
  }
}
```

while表达式

```rust
fn while_true(x: i32) -> i32 {
  while true {
    return x + 1;
  }
  // x
}
```

上面的代码会报错， 因为while true循环返回的时单元值， 而函数返回值是i32， 所以不匹配

这是因为Rust编译器在对while循环做流分析 Flow Sensitive的时候不会检查循环条件， 编译器会认为while循环条件可真可假， 所以循环体内的表达式就会被忽略， 因此只知道while_true 返回的是单元值

, 可以在最后一行加x变量

match表达式

```rust
fn main() {
  let number = 42;
  match number {
    0 => println!("origin"),
    1...3 => println!("all"),
    | 5 | 7 | 13 => println!("bad luck"),
    n @ 42 => println!("{}", n),
    _ => println!("common"),
  }
}
```

上面的例子演示了 单个值、范围、多个值、匹配并绑定给变量（绑定模式）、通配符的情况

```rust
fn main() {
  let mut v = vec![1,2,3,4,5];
  loop {
    match v.pop() {
      Some(x) => println!("{}", x),
      None => break,
    }
  }
}
```



if let 表达式

```rust
let boolean = true;
let mut binary = 0;
if let true = boolean {
  binary = 1;
}
```



While let表达式

```rust
fn main() {
  let mut v = vec![1,2,3,4,5];
  while let Some(x) = v.pop() {
    println!("{}", x);
  }
}
```



## 2.6 基本数据类型

__布尔类型__

布尔类型只有两个值`true` 和 `false` 

```rust
let x = true;
let y: bool = false;
```

任意比较操作都会产生bool类型

也可以使用as 操作符将bool类型转换为数组0 和 1， 但是rust并不支持将数字转换为bool类型



__基本数字类型__

Rust提供的基本数字类型大致上可以分为三类： 固定大小的类型、动态大小的类型和浮点数

* 固定大小的类型

包括无符号整数和 符号整数

u8、u16、u32、u64、u128

i8、i16、i32、i64、i128（-2^127 ~ 2^127 -1）

* 动态大小的类型

usize 根据机器的字长 32或64

isize 根据机器字长

* 浮点数类型

f32和 f64

```rust
fn main() {
  let num = 42u32;
  let num: u32 = 42;
  let num = 0x2A;
  let num = 0o106; // 八进制
  let num = 0b1001_1100; // 二进制
  assert_eq!(b'*', 42u8);
  assert_eq!(b'\'', 39u8);
}
```

* 字符类型

  Rust使用单引号来定义字符类型，代表一个unicode标量值， 每个字符占4个字节

* 数组类型

  是Rust内建的原始集合类型，数组大小固定， 元素均为同类型，默认不可变。

  数组的类型签名为[T;N], T是一个泛型标记，N是数组长度， 必须编译时确定其值

  
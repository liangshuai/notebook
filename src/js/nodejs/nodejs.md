#### Node.js架构

Node.js架构主要分为三层， 应用App -> V8及node内置架构-> 操作系统， V8是Node运行的环境， 可以理解为Node虚拟机

Node.js内置架构又可以分为三层：核心模块JavaScript实现 -> C++绑定 -> Libuv + CAes + HTTP

<img src="../../assets/屏幕快照 2020-06-12 上午8.08.18.png" alt="屏幕快照 2020-06-12 上午8.08.18" style="zoom:30%;" />

#### Node.js核心模块

EventEmitter、Stream、FS、Net 和全局对象

全局对象有： process、console、Buffer、exports





#### 错误优先的回调函数

错误优先的回调函数第一个参数是错误对象， 用于检查程序是否发生错误， 其余参数用于传递数据



#### Node.js异常处理

分为不同的场景， 比如

* throw new Error('msg')
* Try-catch-finally
* express中使用中间件 `app.use((err, req, res) => { ... })`
* 全局异常

```js
process.on('uncaughtException', err => { ... })
process.on('unhandledRejection', err => { ... })
```



#### Node.js try-catch中异步异常无法捕获

```js
try {
  setTimeout(() => {
    throw new Error('err')
  })
} catch (e) {
  console.log(e)
}
```

上面的catch并不能捕获到异常， 是因为setTimeout的宏任务在执行的时候try-catch的栈已经退出了， 上下文环境已经改变了， 所以不能捕获到异常。 这里把setTimeout换成promise或其它微任务同样无法catch

处理办法

```js
setTimeout(() => {
  try {
    throw new Error()
  } catch (e) {
    console.log(e)
  }
})
// 如果需要获取Error对象
const promise = new Promise((resolve, reject) => {
  setTimeout(() => {
    try {
      throw new Error()
    } catch (e) {
      reject(e)
    }
  })
}) 
promise.then(() => { ...})
			.catch(err => {
        ...
      })
```

promise内部抛出的异常在try-catch中也无法捕获， 因为promise内部的错误不会冒泡出来， 只有通过promise.catch才能捕获


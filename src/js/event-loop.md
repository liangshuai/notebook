```js
async function async1() {
    console.log("async1 start"); // 同步代码2
    await async2(); // 调用async2(),async2()的返回值是promise，不执行promise的resolve,让出线程
    console.log("async1 end");
}
async function async2() {
    console.log("async2"); // 同步代码3
}
console.log("script start"); // 同步代码1

setTimeout(function() {
    // 异步 setTimeout放入event-loop中的macro-tasks队列，暂不执行
    console.log("setTimeout");
}, 0);

async1();

new Promise(function(resolve) {
    console.log("promise1"); // 同步代码4
    resolve();
}).then(function() {
    console.log("promise end"); // 不执行
});
console.log("script end"); // 同步代码5
```

Promise构造函数中的是同步代码

await之后的为微任务

```
script start
async1 start
async2
promise1
script end
async1 end
promise end
setTimeout
```



```js
new Promise(resolve => {
    resolve(1);
    Promise.resolve().then(() => console.log(2));
    console.log(4)
}).then(t => console.log(t));
console.log(3);
```

node.js 返回

```
4
3
2
1
```

Chrome

```
4
3
1
2
```

Promise.resolve 方法允许调用时不带参数或者参数是个非 thenable 对象或者不是一个对象，直接返回一个resolved 状态的 Promise 对象。立即 resolved 的 Promise 对象，是在本轮“事件循环”（event loop）的结束时，而不是在下一轮“事件循环”的开始时

因此 `() => console.log(2)` 被先push进了微任务队列



![img](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/47bb1e6f-a492-47bd-8785-85b085fd4d24/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20200512%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20200512T135604Z&X-Amz-Expires=86400&X-Amz-Signature=80109ea6373e098a0f30ab82ffbea1a14aeffde9d6704b7cf339ff9b808ccfe6&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

requestAnimationFrame既不属于macrotask， 也不属于microtask，而且浏览器对其处理顺序也不一致

- **Chrome**: microtask, requestAnimationFrame, macrotask
- **Firefox**: microtask, macrotask, requestAnimationFrame
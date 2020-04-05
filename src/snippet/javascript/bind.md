## JavaScript bind模拟实现

第一版

```js
const toString = Object.prototype.toString
const slice = Array.prototype.slice
Function.prototype.bind2 = function (ctx) {
    const self = this;
    if (typeof self !== 'function' || toString.call(self) !== '[object Function]') {
        throw new Error('bind must be called on a Function');
    }
    const args = slice.call(arguments, 1);
    const binder = function () {
        const otherArgs = slice.call(arguments, 0)
        return self.apply(ctx, args.concat(otherArgs))
    }
    return binder
}
```



第二版

> 当使用new 操作符调用绑定函数时， 该参数会失效
>
> 一个绑定函数也可以使用new操作符来创建对象，这种行为就像把原函数当成构造器， 提供的this值被忽略， 同时调用时的参数被提供给模拟函数

```js
function User () {
    console.log(this.value);
}
const user = {
    value: 'wizard'
}
const bindUser = User.bind2(user)
const binduser = new bindUser() // 应该输出undefined
bindUser() // 应该输出wizard
```

所以在apply的时候使用instanceof来判断是否是通过new操作符创建对象调用的,  并修改binder的prototype指向原函数的protottype

```js
Function.prototype.bind2 = function (ctx) {
    const self = this;
    if (typeof self !== 'function' || toString.call(self) !== '[object Function]') {
        throw new Error('bind must be called on a Function');
    }
    const args = slice.call(arguments, 1);
    const binder = function () {
        const otherArgs =slice.call(arguments, 0)
        return self.apply(this instanceof binder ? this : ctx, args.concat(otherArgs))
    }
    binder.prototype = self.prototype;
    return binder
}
```



第三版

第二版中如果修改了bindUser 的prototype， 会导致原函数的prototype 也被修改， 所以可以通过一个空函数中转

```js
Function.prototype.bind2 = function (ctx) {
    const self = this;
    if (typeof self !== 'function' || toString.call(self) !== '[object Function]') {
        throw new Error('bind must be called on a Function');
    }
    const args = slice.call(arguments, 1);
    const NOOP = function () {}
    const binder = function () {
        const otherArgs =slice.call(arguments, 0)
        return self.apply(this instanceof NOOP ? this : ctx, args.concat(otherArgs))
    }
    NOOP.prototype = self.prototype
    binder.prototype = new NOOP();
    return binder
}
```


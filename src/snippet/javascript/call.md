



## JavaScript模拟call的实现

```js
Function.prototype.call2 = function (ctx) {
  const self = ctx;
  const args = [];
  for (let i = 0; i < arguments.length; i++) {
    args.push(`arguments[${i}]`);
  }
  ctx.fn = self;
  const result = eval('eval(ctx.fn('+ args +'))');
  delete ctx.fn;
  return result;
}
```


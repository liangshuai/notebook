# 禁用export default object

```js
# lib.js
export default { 
 a: 1,
 b: 2
}
# main.js
import { a,b } from './lib';
console.log('a:',a);
console.log('b:',b);
```

上面的写法虽然Babel5错误的进行了支持， 但实际上是有问题的， 包括esm和babel6都不支持

造成错误的原因在于 对象解构 的语法 和命名导出 的语法虽然长的一模一样的，但由于两者使用的上下文不一样会， 在import 中解构是对应的 命名导出 named export， 不和import 和 export一起使用时才是对象解构



正确的用法

```js
#lib.js
export default {
a:1,
b:2
}
# main.js
import lib from './lib';
console.log('a:',lib.a);
console.log('b:',lib.b);
const { a, b}  = lib;
console.log('a:',a);
console.log('b:',b);
```



```js
# lib.js
// 导出方式1
const a =1;
const b = 2;
export {
 a, b
}
// 导出方式2
export const a = 1;
export const b = 2;
```



```js
#main.js
// 导入方式1
import * as lib from './lib';
console.log(lib.a);
console.log(lib.b);
// 导入方式2
import { a,b} from './lib';
console.log(a);
console.log(b);
```


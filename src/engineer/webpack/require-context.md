# require.context

用于动态批量导入文件

```js
require.context(directory, useSubdirectories = false, regExp = /^.//);
```

使用 require.context() 方法来创建自己的（模块）上下文，这个方法有 3 个参数：

- 要搜索的文件夹目录
- 是否还应该搜索它的子目录，
- 以及一个匹配文件的正则表达式。

```js
require.context("../", true, /\.stories\.js$/);
```

该函数执行后返回的是一个函数， 并且这个函数有三个属性

1. resolve {Function} -接受一个参数request,request为test文件夹下面匹配文件的相对路径,返回这个匹配文件相对于整个工程的相对路径

2. keys {Function} -返回匹配成功模块的名字组成的数组

3. id {String} -执行环境的id,返回的是一个字符串,主要用在module.hot.accept,应该是热加载?



```js
const context = require.context("./svg", true, /\.svg$/)
// 看看你是何方神圣
console.log(context)

context.keys().map(context)
```

![一张图说明](..\..\assets\1460000019723842)
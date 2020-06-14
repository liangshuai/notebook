## common.js 和 es6 中模块引入的区别	

* commonjs模块输出的是值的拷贝， ESM输出的是值的引用
* CommonJS是运行时加载的，ESM是编译时输出的接口
* CommonJS是单shi个值导出， ESM可以导出多个
* CommonJS可以写在判断中， ESM只能写在开头
* CommonJS的this是当前模块， ESM的this是undefined
# 装饰器

## 启用

在tsconfig.json中

```js
{
    "compilerOptions": {
        "target": "ES5",
        "experimentalDecorators": true
    }
}
```

装饰器是一种特殊的类型声明， 可以附加到类、方法、访问符、属性、参数上。 `@expression` expression求值后必须是一个函数， 它会在运行时被调用。 装饰器的声明信息作为参数传入 
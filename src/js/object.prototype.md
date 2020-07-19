## Object.seal

Object.seal 方法会封闭一个对象， 阻止添加新属性并将现有属性标记为不可配置， 现有属性的值仍然可以修改， 但是不可删除

Object.isSealed()方法可以判断对象是否被sealed

在ES2015之前seal原始类型会报错， 之后改为返回该值

Object.freeze冻结的对象中现有属性值是不可改变的
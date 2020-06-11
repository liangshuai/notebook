## 方法1

```js
var getNumChar = function (numStr) {
    return String.fromCharCode(Number.parseInt(numStr) + 97)
}
var translateNum = function(num) {
    var str = '' + num;
    var list = []
    var map = {}
    var len = str.length
    for (let i = 0; i < len; i++) {
        map[i] = map[i] || []
        map[i].push(str[i])
        if (i < len - 1 && +str[i] > 0 && +str[i] < 3  &&  Number.parseInt(str[i] + str[i + 1]) <= 25) {
            map[i].push(str[i] + str[i + 1])
        }
    }
    var buildResult = function (result, index) {
        if (index > len - 1) {
            list.push(result)
        }
        var curr = map[index]
        for (let i = 0; curr && i < curr.length; i++) {
            buildResult(result + getNumChar(curr[i]), index + curr[i].length)
        }
    }
    buildResult('', 0)
    return list.length
};
```


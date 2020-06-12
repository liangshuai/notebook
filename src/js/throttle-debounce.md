# 节流与防抖

简化版

```js
const limit = function (fn, wait,  debounce) {
    let timer = null
    return function () {
        const args = arguments
        const context = this
        if (debounce) clearTimeout(timer) 
        if (debounce || !timer) {
            timer = setTimeout(() => {
                fn.apply(context, args)
                timer = null
            }, wait)
        }
    }
}

const debounce = (fn, wait, options) => {
    return limit(fn, wait, true)
}

const throttle = (fn, wait, options) => {
    return limit(fn, wait, false)
}
```



简化版throttle有一些问题， 因为最后触发之后在wait时间内还有触发会被忽略

```js
const throttle = (fn, wait) => {
    let timer, last = 0;
    return () => {
        const ctx = this;
        const args = arguments;
        const now = new Date().getTime();
        const remaining = last ? last + wait - now : 0;
        const later = () => {
            timer = null
            last = new Date().getTime()
            fn.apply(ctx, args)
        }
        if (remaining > 0) {
            clearTimeout(timer)
            setTimeout(later, remaining)
        } else {
            later()
        }
    }
}
```




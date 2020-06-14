```js
class LazyMan {
    constructor (name) {
        this.name = name
        this.queue = [this.sayName.bind(this)]
        setTimeout(async () => {
            for (let task of this.queue) {
                await task()
            }
        }, 0)
    }

    eat (food) {
        this.queue.push(() => {
            console.log(food)
        })
        return this
    }

    holdOn (time) {
        return () => {
            return new Promise(resolve => {
                setTimeout(() => {
                    console.log(`wake up ${time}s`)
                    resolve()
                }, time * 1000)
            })
        }
    }

    sleep (time) {
        this.queue.push(this.holdOn(time))
        return this
    }

    sleepFirst (time) {
        this.queue.unshift(this.holdOn(time))
        return this
    }

    sayName () {
        return new Promise(resolve => {
            console.log(`Hello, ${this.name}`)
            resolve()
        })
    }
}

new LazyMan('shuai').sleepFirst(1).eat('banana').sleep(3)
```


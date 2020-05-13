```js
/**
 * initialize your data structure here.
 */
var MinStack = function() {
    this.data = []
    this.min_stack = [Infinity]
};

/** 
 * @param {number} x
 * @return {void}
 */
MinStack.prototype.push = function(x) {
    this.data.push(x);
    this.min_stack.unshift(Math.min(x, this.min_stack[0]))
};

/**
 * @return {void}
 */
MinStack.prototype.pop = function() {
    if (!this.data.length) return;
    var val = this.data.pop();
    this.min_stack.shift()
    return val
};

/**
 * @return {number}
 */
MinStack.prototype.top = function() {
    if (!this.data.length) return;
    return this.data[this.data.length - 1]
};

/**
 * @return {number}
 */
MinStack.prototype.getMin = function() {
    if (!this.min_stack.length) return
    return this.min_stack[0]
};

var minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
console.log(minStack.getMin());
console.log(minStack.pop());
console.log(minStack.top()) 
console.log(minStack.getMin());
```


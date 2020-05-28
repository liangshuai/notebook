```js
function TreeNode (val) {
    this.val = val;
    this.left = this.right = null;
}

// 递归解法

// function preorderTraversal (root) {
//     var result = []
//     var preorderTraversalNode = function (node) {
//         if (node) {
//             result.push(node.val)
//             preorderTraversalNode(node.left)
//             preorderTraversalNode(node.right)
//         }
//     }
//     preorderTraversalNode(root)
//     return result
// }

//  非递归解法， 用栈来模拟递归解法的调用栈

function preorderTraversal (root) {
    var result = []
    var queue = []
    var curr = root
    while (curr) {
        result.push(curr.val)
        curr.right && queue.push(curr.right)
        curr.left && queue.push(curr.left)
        curr = queue.pop()
    }
    return result
}


var root = new TreeNode(1)
var node2 = new TreeNode(2)
var node3 = new TreeNode(3)

root.right = node2
node2.left = node3

console.log(preorderTraversal(root))
```


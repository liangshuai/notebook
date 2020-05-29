```js
function TreeNode (val) {
    this.val = val;
    this.left = this.right = null;
}

// 递归解法

var inorderTraversal = function(root) {
    var result = []
    var inorderTraversalNode = function (node) {
        if (!node) return
        if (node.left) inorderTraversalNode(node.left)
        result.push(node.val)
        if (node.right) inorderTraversalNode(node.right)
    }
    inorderTraversalNode(root)
    return result
};

//  非递归解法， 用栈来模拟递归解法的调用栈

// 栈S;
// p= root;
// while(p || S不空){
//     while(p){
//         p入S;
//         p = p的左子树;
//     }
//     p = S.top 出栈;
//     访问p;
//     p = p的右子树;
// }

var inorderTraversal = function(root) {
    var result = []
    var curr = root
    var stack = []
    while (curr || stack.length) {
        while (curr) {
            stack.push(curr)
            curr = curr.left
        }
        curr = stack.pop()
        result.push(curr.val)
        curr = curr.right
    }
    return result
}


var root = new TreeNode(1)
var node2 = new TreeNode(2)
var node3 = new TreeNode(3)

root.right = node2
node2.left = node3

console.log(inorderTraversal(root))
```


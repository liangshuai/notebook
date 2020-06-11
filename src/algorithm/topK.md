TopK 问题可以使用大顶堆 或 小顶堆 来实现， 

堆是具有以下性质的完全二叉树

大顶堆： 每个节点的值都大于或等于其左右孩子节点的值

小顶堆： 每个节点的值都小于或等于其左右孩子节点的值



堆可以映射为数组， 此时

大顶堆： a[i] >= a[2i + 1] && a[i] >= a[2i + 2]

小顶堆： a[i] <= a[2i + 1] && a[i] <= a[2i + 2]



排序步骤

1. 把默认数组先当做一个完全二叉树， 那么第一个非叶子节点就是 index =  Math.floor(length / 2) - 1  ， i记为数组长度
2. 比较index 和 2 * index + 1  以及 2 * index + 2 索引位置的值， 把该处先改为大顶堆
3. 递减index 到 0， 此时最大的值就在堆顶
4. 交换堆顶和结尾倒数第i个值， 此时最大值在结尾
5. 递减i， 重复2-4， 依次得到topK



```js
function topKMaxOfArr(k, arr) {
    function swap(a, b) {
        var t = arr[a];
        arr[a] = arr[b];
        arr[b] = t;
    }

    var i, j;
    //只需循环k次
    for (i = arr.length; i > arr.length - k; i--) {

        for (j = Math.floor(i / 2) - 1; j >= 0; j--) {
            if (arr[j] < arr[2 * j + 1]) {
                swap(j, 2 * j + 1);
            }
            if (2 * j + 2 < i && arr[j] < arr[2 * j + 2]) {
                swap(j, 2 * j + 2);
            }
        }
        swap(i - 1, 0);
    }

    return arr.slice(arr.length - k);
}

//用法示例
var arr = [4, 2, 5, 6, 77, 33, 21, 44, 55, 22], k = 5;
console.log(topKMaxOfArr(k, arr));//返回数组[22, 33, 44, 55, 77]
```

file:///Applications/Typora.app/Contents/Resources/TypeMark/app/main.js
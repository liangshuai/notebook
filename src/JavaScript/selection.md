## Selection

`Selection` 对象表示用户选择的文本范围或插入符号的当前位置。 它代表页面中的文本选区， 可以跨越多个元素， 有拖拽鼠标经过文字而产生。 要获取用于检查或修改的Selection对象可以调用`window.getSelection()`

插入光标的位置可以通过Selection获取， 它有一个 `isCollapsed` 表示是否选区被压缩到一点， 即光标位置

`anchorNode` 表示开始选择的地方所在的节点

`focusNode` 表示结束选择的地方所在的节点

`anchorOffset` 返回一个数字， 表示的是选区起点在anchorNode中的位置偏移量

如果anchorNode是文本节点， 那么返回的就是该文本节点的第一个字开始， 直到被选中的第一个字之间的字数

如果anchorNode是一个元素， 那么返回的是选区第一个节点之前的同级节点总数

`focusOffset` 返回一个数字，表示选区终点在focusNode 中的位置偏移量

如果focusNode是文本节点， 那么选区末尾未选中的第一个字在该文字节点中是第几个字就返回它

如果focusNode是一个元素， 那么返回的就是选区末尾之后第一个节点之前的同级节点数

`anchor` 和 `focus` 指用户开始选择的地方和结束选择的地方， 这两个不能和选区的起始位置和终止位置混淆， 因为anchor可能在focus之前或之后

Selection对象对应的是用户选择的`ranges` 区域， 默认情况下改哈纳树只针对一个选区， 可以这样使用

```js
var selObj = window.getSelection();
var range = selObj.getRangeAt(0);
```



`rangeCount` 返回该选区所包含的连续范围的数量



* selection.collapseToStart() 作用是取消当前选区， 并把光标定位在原选区的最开始处， 如果此时光标所在的位置是可编辑的， 且它获得了焦点， 那么光标会在原地闪烁
* selection.collapseToEnd() 作用是取消当前选区， 并把光标定位在原选区的最末尾处， 如果此时光标所在的位置是可编辑的， 且它获得了焦点， 则光标会在原地闪烁
* selection.containsNode(aNode, aPartlyContained) 判断指定的节点是否包含在Selection中， aNode是节点， aPartlyContained 是否允许部分包含
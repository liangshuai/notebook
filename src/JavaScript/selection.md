## Selection

`Selection` 对象表示用户选择的文本范围或插入符号的当前位置。 它代表页面中的文本选区， 可以跨越多个元素， 有拖拽鼠标经过文字而产生。 要获取用于检查或修改的Selection对象可以调用`window.getSelection()`

插入光标的位置可以通过Selection获取， 它有一个 `isCollapsed` 表示是否选区被压缩到一点， 即光标位置

`anchorNode` 表示开始选择的地方所在的节点

`focusNode` 表示结束选择的地方所在的节点

`anchor` 和 `focus` 指用户开始选择的地方和结束选择的地方， 这两个不能和选区的起始位置和终止位置混淆， 因为anchor可能在focus之前或之后

Selection对象对应的是用户选择的`ranges` 区域， 默认情况下改哈纳树只针对一个选区， 可以这样使用

```js
var selObj = window.getSelection();
var range = selObj.getRangeAt(0);
```


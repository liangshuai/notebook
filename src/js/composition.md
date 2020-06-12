**`compositionstart`** 事件触发于一段文字的输入之前（类似于 `keydown` 事件，但是该事件仅在若干可见字符的输入之前，而这些可见字符的输入可能需要一连串的键盘操作、语音识别或者点击输入法的备选词）。

比如在输入拼音时 经常会拼音的输入过程中也会触发到input事件， 而我们往往需要的是选完中文之后再触发事件



`compositionstart` 事件在用户开始进行非直接输入的时候触发，而在非直接输入结束，也即用户点选候选词或者点击「选定」按钮之后，会触发 `compositionend` 事件

```js
var inputLock = false;
function do(inputElement) {
    var regex = /[^1-9a-zA-Z]/g;
    inputElement.value = inputElement.value.replace(regex, '');
}

inputElement.addEventListener('compositionstart', function() {
  inputLock = true;
});


inputElement.addEventListener('compositionend', function(event) {
  inputLock = false;
  do(event.target);
})


inputElement.addEventListener('input', function(event) {
  if (!inputLock) {
    do(event.target);
    event.returnValue = false;
  }
});
```


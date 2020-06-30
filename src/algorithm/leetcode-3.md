解法一

```js
var lengthOfLongestSubstring = function(s) {
    if (!s) return 0
    var max = 1;
    let map;
    for (let i = 1; i < s.length; i++) {
        let charI = s[i];
        map = {
            [charI]: true
        };
        let maxI = 1
        for (let j = i - 1; j >= 0; j--) {
            let charJ = s[j];
            if (map[charJ]) {
                maxI = i - j;
                break;
            } else {
                map[charJ] = true;
                maxI = maxI + 1;
            }
        }
        max = Math.max(maxI, max)
    }
    return max
};
```

解法二

```js
var lengthOfLongestSubstring = function(s) {
    if (!s) return 0;
    var max = 0;
    let map = {};
    for (let i = 0, j = 0; i < s.length; i++) {
        let char = s[i];
        if (map[char] !== undefined) {
            j = Math.max(map[char] + 1, j)
        }
        max = Math.max(max, i - j + 1)
        map[char] = i
    }
    return max
};
```


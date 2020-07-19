```js
var canFinish = function (piles, speed, hour) {
    var time = 0;
    piles.forEach(function (pile) {
        time += Math.floor(pile / speed) + (((pile % speed) > 0) ? 1 : 0);
    });

    return time <= hour;
}
var minEatingSpeed = function(piles, H) {
    var max = Math.max.apply(null, piles);
    var left = 0;
    var right = max;
    while (left < right) {
        var mid = left + (Math.floor((right - left) / 2));
        if (canFinish(piles, mid, H)) {
            right = mid;
        } else {
            left = mid + 1;
        }
    }
    return left;
};
```


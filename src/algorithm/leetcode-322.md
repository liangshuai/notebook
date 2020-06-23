```js
function coinExchange (coins, amount) {
    const dp = []
    dp[0] = 0
    for (let i = 1; i <= amount; i++) {
        dp[i] = Number.MAX_SAFE_INTEGER
        for (let j = 0; j < coins.length; j++) {
            const coin = coins[j]
            if (i - coin >= 0) {
                dp[i] = Math.min(dp[i - coin] + 1, dp[i])
            }
        }
    }

    return dp[amount] !== Number.MAX_SAFE_INTEGER ? dp[amount] : -1
}

console.log(coinExchange([1, 2, 5], 11))
```


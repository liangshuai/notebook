动态规划解题框架

动态规划问题的一般形式是求最值， 核心问题是穷举， 但是这类问题存在重叠子问题， 可以通过备忘录或DP Table优化穷举过程

动态规划问题一定具备最有子结构， 才能通过子问题的最值得到原问题的最值

只有列举出正确的状态转移方程才能正确的穷举

重叠子问题、最优子结构、状态转移方程是动态规划的三要素。

写状态转移方程是最困难的

状态转移方程的思维框架

明确状态 -> 定义dp数组/函数的含义 -> 明确选择 -> 明确base case




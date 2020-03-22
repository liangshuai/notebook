# Tumx

## 安装

```bash
brew install tmux
```

## 使用

```bash
tmux # 启动一个Sesion
tmux new -s SessionName # 启动一个命名Session
exit # 退出Tmux
Ctrl + d # 退出Tmux
tmux attach -t try
tmux a -t <目标会话名>
tmux ls # 列举会话列表
[前缀] d  # 分离一个Session
tmux new -n <窗口名>

```

## Window操作

- Ctrl+B c //创建一个新窗口
- Ctrl+B & //关闭当前窗口
- Ctrl+B p //切换到上一个窗口
- Ctrl+B n //切换到下一个窗口
- Ctrl+B 窗口号 //使用窗口号切换窗口(例如窗口号为1的, 则C-b 1)
- Ctrl+B , //重命名当前窗口，便于识别各个窗口
- Ctrl+B w //显示窗口列表， 上下键选择， 回车确认

## Panel操作


- Ctrl+B % //横向分Terminal(左右)
- Ctrl+B " //纵向分Terminal
- Ctrl+B 方向键 //则会在自由选择各面板
- Ctrl+B x //关闭当前pane
- Ctrl+B q //显示面板编号


Session操作

- Ctrl+B s //列出所有会话
- Ctrl+B d //detach当前session(可以认为后台运行)

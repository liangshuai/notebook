# pkg把node.js打包成可执行文件

安装

```bash
npm install -g pkg
```

安装好之后执行

```bash
pkg /path/app.js
pkg .  # 当前目录的package.json中定义的bin
```



离线安装

到https://github.com/zeit/pkg-fetch/releases下载离线报错提示中相应的文件， 放到`~\.pkg-cache\v2.5` 下， 2.5也要替换成指定的版本， 下载好之后 要把对应的文件重命名为`fetched-<version>-<os>-<architecture>` 形式的文件， 比如`fetched-v10.4.1-linux-x64` 即可
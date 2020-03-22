https://www.bilibili.com/video/av40317436/?p=5

## 在Bash中调用Python ## 

```ba
#! /bin/bash
echo "Hello World"
/usr/bin/python <<-EOF
print "Hello from python"
EOF
echo "hello bash"


EOF可以是任意的， 只是一个标记开始和结束的符号， 比如可以换成@@
```

把a文件的内容追加到b文件

```sh
cat with-python.sh >> test.sh
```

## 子shell ## 

```bash
bash script.sh
./script.sh
# 上面的两种是在sub shell中执行的
. script.sh
source script.sh
# 在当前shell中执行， 定义的变量都有效
```

Nologin shell

```bash
su alice
# Nologin切换到alice 用户
su - alice
# Login 切换到alice用户

用户主目录中有
~/.bash_profile
~/.bashrc
~/.bash_logout
~/.bash_history

# 登录用户时执行
/etc/profile
/etc/bashrc
~/.bash_profile
~/.bashrc
# no login shell
/etc/bashrc
~/.bashrc

```

自动补齐

```bash
rpm -qa | grep bash_com
```

执行历史中的某一条

```bash
!1020 # 执行bask_history中的第1020条命令，同时显示该命令
!string # 搜索相关命令
!! # 执行上一条命令
!$ # 上一条命令的参数
```

alias设置命令别名， unalias 取消别名 , \命令  不使用别名

### 命令的排序

分号 ;   分割多个命令， 各个命令单独执行， 状态互不影响， 前一个失败也不会影响到下一个

&&  前面一个命令成功才会执行后面的命令

||   前面一个失败了会执行后面的命令, 成功了不会

mkdir -p 递归创建目录

```bas
ping -c1 10.25.100.11 &>/dev/null && echo "Running" || echo "down"
echo $? # 输出上一条命令的执行结果状态
true || false
command & # 后台执行
command &>/dev/null   # 混合重定向（标准输出，错误输出） 
command1 && command   # 命令排序逻辑判断
```

### shell元字符 

> *匹配一个或多个任意字符
>
> ?匹配任意一个字符
>
> [] 匹配括号中任意一个字符 [abc]  [a-z] [\^a-z] 取反  
>
> () 在子shell中执行 (cd /boot;ls)
>
> {} 集合  touch file{1..9}
>
> mkdir -pv /home/{333/{aaa, bbb}, 444}
>
> cp -rv /home/liangshuai/aaa.txt /home/liangshuai/bbb.txt
>
> cp -rv /Users/liangshuai/{aaa,bbb}.txt

### 输出颜色

```bash
echo -e "\e[1;31mThis is text.\e[0m"
```

颜色30m - 37m表示前景色 ,40m-47m表示背景色，  0m表示恢复

Mac下

```bash
echo -e "\033[31mText\033[0m"
```

| 颜色值x | 0    | 1    | 2    | 3    | 4    | 5    | 6    | 7    |
| :------ | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 颜色    | 黑   | 红   | 绿   | 黄   | 蓝   | 紫   | 青   | 白   |

 	### shell变量

定义变量： 变量不能以数字开头, 字母数字下划线

引用变量： $变量名

type -a if   判断if的类型

```bash
#! /usr/bin/bash
ip=10.18.42.127  # read -p "please input a in addr: " ip
ping -c1 $ip &>/dev/null
if [ $? -eq 0 ]; then
	echo " $ip is up "
else
	echo " $ip is down "
fi
```


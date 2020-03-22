

# Shell Scripting Tutorial for Beginners

> https://www.youtube.com/watch?v=vQv4W-JfrmQ

```sh
cat /etc/shells 查看系统有哪些shell
touch hello.sh
chmod +x ./hello.sh
# 或者直接执行
/bin/bash ./hello.sh
shell脚本
#! /bin/bash

echo "Hello World"
echo $BASH
echo $BASH_VERSION
echo $HOME
echo $PWD
name = mark
echo the name is $name
# 通常系统内置变量是大写的， 用户定义的变量是小写的
# 变量不能以数字开头, 字母数字下划线
10val=10
echo value is $10val 只会输出0val
# 使用变量的时候也可以加花括号， 帮助解释器识别变量边界
echo ${name}
# 对已经有的变量可以重新定义
name = "ssss"
# 只读变量的值不能被改变
readonly myUrl="http://wwww.paic.com.cn/"
# 删除变量
unset myUrl
```

第三节 读取用户输入

```sh
#! /bin/bash
read name
echo $name   # 输入名字后enter
read name1 name2 name3
echo "$name1 $name2 $name3"  # 输入三个name后再enter
# 同一行中提示输入
read -p 'username: ' user_var
read -sp 'password: ' pass_var # 隐藏
echo "username: " $user_var
echo "password:" $pass_var
# 读取数组
read -a names
echo "Names: ${names[0]}"
# 不需要变量名, 使用$REPLY
read
echo "Name: $REPLY"
```

第四节 给脚本传递参数

```bash
echo $1 $2 $3 ' > echo $1 $2 $3 '
# 运行，输入 ./hello.sh Mark Tom John
# 输出 Mark Tom John > echo $1 $2 $3 
# $0 是脚本名
args=("$@")
echo ${args[0]} ${args[1]} ${args[2]} ${args[3]}
# args[0] 是从Mark开始的
echo $@ # 直接输出三个参数
echo $# # 输出参数的个数 3
```

第五节 if then ， if then else， if elif else

```bash
#! /bin/bash
count = 10
if [ $count -eq 10 ]
then
	statement
fi
```

比较

```
String Comparisons:  
---------------------------------
=  compare if two strings are equal
!=  compare if two strings are not equal
-n  evaluate if string length is greater than zero
-z  evaluate if string length is equal to zero 

Examples: 
[ s1 = s2 ]  (true if s1 same as s2, else false)
[ s1 != s2 ]  (true if s1 not same as s2, else false)
[ s1 ]   (true if s1 is not empty, else false)
[ -n s1 ]   (true if s1 has a length greater then 0, else false)
[ -z s2 ]   (true if s2 has a length of 0, otherwise false)

Number Comparisons: 
------------------------------------
-eq compare if two numbers are equal
-ge compare if one number is greater than or equal to a number
-le  compare if one number is less than or equal to a number
-ne  compare if two numbers are not equal
-gt  compare if one number is greater than another number
-lt  compare if one number is less than another number 

Examples: 
[ n1 -eq n2 ]  (true if n1 same as n2, else false)
[ n1 -ge n2 ]  (true if n1greater then or equal to n2, else false)
[ n1 -le n2 ]  (true if n1 less then or equal to n2, else false)
[ n1 -ne n2 ]  (true if n1 is not same as n2, else false)
[ n1 -gt n2 ]  (true if n1 greater then n2, else false)
[ n1 -lt n2 ]  (true if n1 less then n2, else false)
```

第六讲  使用if检查文件是否存在

```bash
#! /bin/bash
echo -e "Enter the filename: \c"
read file_name
if [ -e $file_name ]
then
	echo "$file_name found"
else
	echo "$file_name not found"
fi

```

echo(选项)(参数)选项

-e：激活转义字符。使用-e选项时，若字符串中出现以下字符，则特别加以处理，而不会将它当成一般文字输出：

• \a 发出警告声；
• \b 删除前一个字符；
• \c 最后不加上换行符号；
• \f 换行但光标仍旧停留在原来的位置；
• \n 换行且光标移至行首；
• \r 光标移至行首，但不换行；
• \t 插入tab；
• \v 与\f相同；
• \\ 插入\字符；
• \nnn 插入nnn（八进制）所代表的ASCII字符

文件比较运算符 
1. -e filename 如果 filename存在，则为真 如： [ -e /var/log/syslog ] 
2. -d filename 如果 filename为目录，则为真 如： [ -d /tmp/mydir ] 
3. -f filename 如果 filename为常规文件，则为真 如： [ -f /usr/bin/grep ] 
4. -L filename 如果 filename为符号链接，则为真 如： [ -L /usr/bin/grep ] 
5. -r filename 如果 filename可读，则为真 如： [ -r /var/log/syslog ] 
6. -w filename 如果 filename可写，则为真 如： [ -w /var/mytmp.txt ] 
7. -x filename 如果 filename可执行，则为真 如： [ -L /usr/bin/grep ] 
8. -s 存在且为空   if [ -s file ] 如果文件存在且非空
9. filename1-nt filename2 如果 filename1比 filename2新，则为真 如： [ 
  /tmp/install/etc/services -nt /etc/services ] 
10. filename1-ot filename2 如果 filename1比 filename2旧，则为真 如： [ 
  /boot/bzImage -ot arch/i386/boot/bzImage ]

第七讲 往文件结尾追加文本

```bash
#! /bin/bash
echo -e "Enter the filename: \c"
read file_name
if [ -f $file_name ]
then
	if [ -w $file_name ]
	then
		echo "Type some text here, to  quite press Ctrl + d"
		cat >> $file_name
	else
		echo "Don't have permission"
	fi
else
	echo "$file_name not found"
fi
```

```sh
chmod -w test # 去掉写权限
```








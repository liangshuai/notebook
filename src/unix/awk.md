# awk

awk '{print}' coins.txt

awk '{print $1}'  coins.txt
awk '{print $1, $2}' coins.txt
对齐
awk '{print $1 "\t"  $2}' coins.txt
显示行号
awk '{print NR "\t" $1 "\t"  $2}' coins.txt
$0表示一整行
awk '{print NR "\t" $0}' coins.txt
按照空格分割，
awk '{print NF "\t" $0}' coins.txt
打印指定行
awk 'NF==7{print NF "\t" $0}' coins.txt
awk 'NR==7{print NF "\t" $0}' coins.txt
awk '$2==1986{print NF "\t" $0}' coins.txt
awk '$1=="Golden"{print NF "\t" $0}' coins.txt
打印文件名
awk '{print FILENAME, $0 }' coins.txt

指定输入和输出分隔符
awk 'BEGIN{FS=","} {print $1, $2}' coins.txt
awk 'BEGIN{OFS=","} {print $1, $2}' coins.txt
awk 'BEGIN{OFS=",";FS=","} {print $1, $2}' coins.txt

多个文件
awk '{print FILENAME, $0 }' coins.txt data.txt

隐藏指定列
awk '{$3="*****";print FILENAME, $0 }' coins.txt

打印最后一列
awk '{print FILENAME, $NF }' coins.txt data.txt

打印倒数第二列
awk '{print FILENAME, $(NF - 1) }' coins.txt data.txt


定义变量
awk '{a=1; b=3; print a + b}'

计算

awk '{a=1; b=3; print a - b}'
awk '{a=1; b=3; print a * b}'
awk '{a=1; b=3; print a / b}'

awk '{a=1; b=3; c=2; print a b+c}'  # 15
awk '{a=1; b=3; c=2; print (a b)+c}'  # 15   先把a和b拼接起来在加c


awk '{a=1; b="apple"; c=2; print b+c}' # 2

awk '{a=1; b="56apple"; c=2; print b+c}' # 58


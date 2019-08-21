

https://blog.csdn.net/scaleqiao/article/details/45153379

i 进入编辑模式

a append 追加,当前单词后面

o open a new line below

A Append after line

I Insert before line

O append line above

### 命令模式

:q 退出

:wq 保存并退出

ZZ 保存并退出h

:vs(vertical split)垂直左右分屏 :sp(split) 水平上下分屏

 :set nu 设置行号

:set hls  高亮搜索

:syntax on 语法高亮

:% s/java/python/g  全部替换java->python

:Vex -- 垂直分割一个窗口，浏览文件系统

:Sex -- 水平分割一个窗口，浏览文件系统

:r !date 在光标处插入当前日期与时间。同理，:r !command可以将其它shell命令的输出插入当前文档

:r filename在当前位置插入另一个文件的内容。

:[n]r filename在第n行插入另一个文件的内容。

### Visual模式

v选择字符

 V选择行

 ctrl+v块状选择

选中之后可以可以只用Y  （yank）复制，P （paste）， D 删除



### 插入模式

下面这几个在Linux终端都比较通用

ctrl+h 删除字符

ctrl+w 删除单词

ctrl+u 删除一行

ctrl+b 前移一个字符

ctrl+f 后移一个字符

ctrl+c/[ 功能同Esc 切换insert和normal模式

gi 快速进入编辑模式, 回到上次编辑的位置

### 改写插入

- c[n]w: 改写光标后1(n)个词。
- c[n]l: 改写光标后n个字母。
- c[n]h: 改写光标前n个字母。
- [n]cc: 修改当前[n]行。
- [n]s: 以输入的文本替代光标之后1(n)个字符，相当于c[n]l。
- [n]S: 删除指定数目的行，并以所输入文本代替之。

###  快速移动

normal 模式下 h左、j下、k上、l右

w/W 移动下一个word/WORD开头。e/E 下一个word/WORD尾

b/B 回上一个word/WORD开头

word 以非空白符分割的单词，WORD 以空白符分割的单词

同一行内快速跳转到指定字符 f{char}，   

F{char} 向前搜索， t{char} 移动到该字符的前一个字符

 按 ；可以跳到下一个匹配结果， ，到上一个

Ctrl + o /I  最近打开的文件跳转

% 跳转到匹配的括号

0 移动到行首第一个字符

^ 移动到行首第一个非空白字符

$ 移动到行尾

g_ 移动到行尾非空白字符

（）在句子间移动

{} 在段落间移动

\-  把光标移至上一行第一个非空白字符。

+或Enter: 把光标移至下一行第一个非空白字符

:help (   帮助

:$<cr> 移动到最后一行

:n<cr> 移动到第n行

g$: 移动光标所在屏幕行行尾

g0: 移到光标所在屏幕行行首。

gg 移动到文件开头

G移动到文件结尾

Ctrl + o 返回上一次编辑位置

H/M/L 移动到屏幕开头、中间、结尾

ctrl + f 上下翻页

ctrl+b: 上翻一屏

ctrl+d: 下翻半屏

ctrl+u: 上翻半屏

ctrl+e: 向下滚动一行

zz: 将当前行移动到屏幕中央

zt: 将当前行移动到屏幕顶端

zb: 将当前行移动到屏幕底端

输入3h， 则光标向左移动3个字符

n<HJKL> 移动



m{char} 打标签， char是大写的就是全局的， 小写的是针对当前Buffer

:marks查看标签列表

`{char} 跳转到指定mark



### 快速增删改查

x 删除一个字符

数字 + x  删除N个字符

u 恢复

dt + 直到哪个字符  delete to

s{char} 替换当前字符为指定字符, 进入到了插入模式

dd 删除一行

dw 删除一个单词

d$   删除到行尾

d0  删除到行首

daw 删除单词和周围空格（delete around word）

diw 删除单词（dw）

2dd 删除两行

在Visual模式下， d和x也能使用

以下命令可以对标点内的内容进行操作。
ci'、ci"、ci(、ci[、ci{、ci< - 分别更改这些配对标点符号中的文本内容
di'、di"、di(或dib、di[、di{或diB、di< - 分别删除这些配对标点符号中的文本内容
yi'、yi"、yi(、yi[、yi{、yi< - 分别复制这些配对标点符号中的文本内容
vi'、vi"、vi(、vi[、vi{、vi< - 分别选中这些配对标点符号中的文本内容

快速修改

常用的三个 r（replace）  c （change）

r replace 替换一个字符 

​    eg: 光标下g ra g->a 

c change 

​    cw 删除单词进入插入模式 change word

​    ct{char} 删除到字符，进入插入模式

s substitute 删除并进入插入模式 eg: 4s 删除4个字符进入插入模式

R 不断替换多个字符

S 删除整行进行插入 

C 删除整行进行插入



/ 前向搜索

? 反向搜索

n/N 下一个或者上一个

\*/# 当前单词的前向和后向匹配



搜索结果高亮 :set hls (high light search)

:set incsearch

### 复制和剪切

* [n]x: 剪切光标右边n个字符，相当于d[n]l。

- [n]X: 剪切光标左边n个字符，相当于d[n]h。
- y: 复制在可视模式下选中的文本。
- yy or Y: 复制整行文本。
- y[n]w: 复制一(n)个词。
- y[n]l: 复制光标右边1(n)个字符。
- y[n]h: 复制光标左边1(n)个字符。
- y$: 从光标当前位置复制到行尾。
- y0: 从光标当前位置复制到行首。
- :m,ny<cr> 复制m行到n行的内容。
- y1G或ygg: 复制光标以上的所有行。
- yG: 复制光标以下的所有行。
- yaw和yas：复制一个词和复制一个句子，即使光标不在词首和句首也没关系。
- d: 删除（剪切）在可视模式下选中的文本。
- d$ or D: 删除（剪切）当前位置到行尾的内容。
- d[n]w: 删除（剪切）1(n)个单词
- d[n]l: 删除（剪切）光标右边1(n)个字符。
- d[n]h: 删除（剪切）光标左边1(n)个字符。
- d0: 删除（剪切）当前位置到行首的内容
- [n] dd: 删除（剪切）1(n)行。
- :m,nd<cr> 剪切m行到n行的内容。
- d1G或dgg: 剪切光标以上的所有行。
- dG: 剪切光标以下的所有行。
- daw和das：剪切一个词和剪切一个句子，即使光标不在词首和句首也没关系。
- d/f<cr>：这是一个比较高级的组合命令，它将删除当前位置 到下一个f之间的内容。
- p: 在光标之后粘贴。
- P: 在光标之前粘贴

###  搜索替换

substitute 支持正则

:[range]s[ubstitute]/{pattern}/{string}/flags

range 范围 

​    eg: 

​        10,20 表示10-20行

​        % 表示全部

pattern 替换模式

string  替换后文本

flags 替换标志位

​    g global 全局替换

​    c confirm 确认

​    n number 查询匹配次数而不替换



eg:

:% s/self/this/g  # 替换 self->this

:1,6 s/self//n    # 查询  计算有1-6行有多少个self

:% s/\<name\>/Name/g # 精确匹配单词



Control + Z切换到命令行

fg 从命令行返回到Vim



### Vim多文件操作

\# 多文件操作

Buffer  打开一个文件的缓冲区

Window  可视化分割区域

Tab     组织窗口为一个工作区

1、Buffer

:ls  列举缓冲区

:b n 跳转到第n个缓冲区

:bpre :bnext :bfirst :blast

:b buffer_name  tab补全

:e filename 打开文件



2、Window

一个缓冲区可以分割为多个窗口

每个窗口也可打开不同缓冲区

窗口可以无限分割

（1）窗口分割

<ctrl + w> + s 水平分割  :sp [filename]

<ctrl + w> + v 垂直分割  :vs [filename]

（2）窗口切换

<ctrl + w> + w 循环切换

<ctrl + w> + h 切换到左边

<ctrl + w> + j 切换到下边

<ctrl + w> + k 切换到上边

<ctrl + w> + l 切换到右边



（3）窗口移动

<ctrl + w> + H 移动到左边

<ctrl + w> + J 移动到下边

<ctrl + w> + K 移动到上边

<ctrl + w> + L 移动到右边



(4)重排窗口

:h window-size

<ctrl + w> + = 所有窗口等宽等高

<ctrl + w> + _  最大化活动窗口高度

<ctrl + w> + |  最大化活动窗口宽度

n + <ctrl + w> + _ 把活动窗口的高度设为n 行

n + <ctrl + w> + | 把活动窗口的宽度设为n 行



3、Tab标签页

一系列窗口的容器:h tabpage

:tabnew {filename}     新标签中打开

:tabe[dit] {filename}  新标签中打开

<ctrl + w> + T 当前窗口移动到一个新标签页

:tabc[lose]  关闭当前标签页及其中的所有窗口 

:tabo[nly]   只保留当前标签页，关闭其他标签页

:tabn[ext] {N} {N}gt  切换到编号N 的标签页

:tabn[ext]       gt    切换到下一个标签页

:tabp[revious]   gT    切换到上一个标签页



插件：ctrlp nerdtree



### 文本对象text object

命令格式：

[number]<command>[text object]

number 次数

command 命令 d(delete), c(change), y(yank), v(visual)

text object 文本对象 w(单词word)， s(句子sentence)，p(段落paragraph)



3dw  删除三个单词

eg:

iw  插入单词

viw 选择模式插入单词

vaw  around word 选中当前单词和单词之后的空格

vis/vas/vip/vap

vi(/)/</>/{/}/"/"/'/'

va(/)/</>/{/}/"/"/'/'

vi"   删除双引号内的内容

3daw

ciw  删除单词并插入

ci{  删除{内容  

插件 vim-go



### Vim 复制粘贴与寄存器的使用

normal模式下复制粘贴分别使用y(ank) 和p(ut) 剪切粘贴d和p

也可以在Visual模式下选中所要复制的地方， 可以直接G或者gg到文件结尾或开头，然后p粘贴

配合文本对象 yiw 复制一个单词， yy复制一行



:set autoindent 自动缩进

:set paste

:set nopaste



#### 寄存器

y复制和d删除的内容都放到了无名寄存器

x删除一个字符，放到无名寄存器， xp 两个字符对调 

"{register}   前缀可以指定寄存器， 不指定就是用无名寄存器

"ayiw  复制一个单词到a寄存器中

"byy复制一行到b寄存器

:reg a 查看a寄存器的内容



"ap  粘贴a寄存器的内容

"" 表示无名寄存器

a-z 都可以当作寄存器

复制专用寄存器 , "0 

系统剪切板 "+ 复制到系统剪切板

"% 当前文件名

". 上次插入的文本

:echo has('clipboard')  1 支持 复制到系统剪切板

:set clipboard=unnamed 可以直接复制的系统剪切板

insert 模式下 ctr+r+'+'

:e! 重新加载文件 ,且不保持



### 宏录制

每行添加双引号

qa a寄存器录制

I + " + Esc + A + "

q 结束录制

shift/^ + V 行xuan 

G 到文件结尾 

: normal @a

@a     



另一种做法不使用宏

V + G全选， :normal I"   

然后 ： Ctrl + p 重复上一条命令， 把I“ 换成 A” 回车即可



### 自动补全

Ctrl + n 和 Ctrl + p补全单词

ctrl + x ctrl + f   补全文件名

ctrl + x ctrl + o 补全代码， 需要开启文件类型检查， 安装插件

: r! echo %:p   当前文件路径

: r! echo %   当前文件名



### 更换主题

:colorscheme回车，显示当前主题

:colorscheme  Ctrl +d 显示所有主题

：colorscheme  主题名  修改当前主题

vim file1 file2 -O 分窗口打开文件名所涉及的文件



网络搜索color scheme



### 编写Vim配置

linux和Mac新建 vim ~/.vimrc

Windows系统 vim $MYVIMRC，通过环境变量编辑配置文件



colorscheme hybrid

noremap <Leader>w :w<cr> 保存文件

自定义的Vimscript函数 vim高手  和插件的配置



```
let mapleader=","
// inoremap表示插入模式下的， cr表示回车， 下面这一条映射表示按下 ,w 之后保存当前文件
inoremap <leader>w <Esc>:w<cr> 
inoremap jj <Esc>
noremap <c-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
命令行下输入source .vimrc 立即生效vimrc

com! FormatJSON %!python3 -m json.tool
```

### 映射

基本映射指的是normal模式下的映射

使用map就可以实现映射， 比如 :map - x 然后按 - 就会删除字符

:map <Space> vim 告诉vim按下空格的时候选中整个单词

:map <c-d> dd 可以使用Ctrl+ d执行dd删除一行

:unmap -  删除 - 的map

nmap、vmap、imap 定义在normal、visual、insert

Vim中 Visual模式下选中的文本按U转成大写的， 按u转成小写的

:vmap \ U

:imap <c-d> <ESC>ddi

map映射存在递归问题， 为解决该问题，构建了非递归映射

nnoremap ---normal下的非递归映射， n --normal, non-recursive 非递归, map---映射；vnoremap --视图模式非递归映射， inoremap ---插入模式非递归

任何时候都要使用非递归映射



```
" 使用jj进入normal模式， 并进入到之前编辑的位置
inoremap jj <Esc>`^
```

笨方法学vimscript https://www.kancloud.cn/kancloud/learn-vimscript-the-hard-way/49321





## Vim插件

Vim-Plug

source ~/.vimrc 然后 :PlugInstall



Github/Google搜索

vimawesome寻找

看别人的vimrc配置



vim-startify

vim-airline





### NerdTree快捷方式

切换工作台和目录

```
ctrl + w + h    光标 focus 左侧树形目录
ctrl + w + l    光标 focus 右侧文件显示窗口
ctrl + w + w    光标自动在左右侧窗口切换
ctrl + w + r    移动当前窗口的布局位置
o       在已有窗口中打开文件、目录或书签，并跳到该窗口
go      在已有窗口 中打开文件、目录或书签，但不跳到该窗口
t       在新 Tab 中打开选中文件/书签，并跳到新 Tab
T       在新 Tab 中打开选中文件/书签，但不跳到新 Tab
i       split 一个新窗口打开选中文件，并跳到该窗口
gi      split 一个新窗口打开选中文件，但不跳到该窗口
s       vsplit 一个新窗口打开选中文件，并跳到该窗口
gs      vsplit 一个新 窗口打开选中文件，但不跳到该窗口
!       执行当前文件
O       递归打开选中 结点下的所有目录
x       合拢选中结点的父目录
X       递归 合拢选中结点下的所有目录
e       Edit the current dif
双击    相当于 NERDTree-o
中键    对文件相当于 NERDTree-i，对目录相当于 NERDTree-e
D       删除当前书签
P       跳到根结点
p       跳到父结点
K       跳到当前目录下同级的第一个结点
J       跳到当前目录下同级的最后一个结点
k       跳到当前目录下同级的前一个结点
j       跳到当前目录下同级的后一个结点
C       将选中目录或选中文件的父目录设为根结点
u       将当前根结点的父目录设为根目录，并变成合拢原根结点
U       将当前根结点的父目录设为根目录，但保持展开原根结点
r       递归刷新选中目录
R       递归刷新根结点
m       显示文件系统菜单
cd      将 CWD 设为选中目录
I       切换是否显示隐藏文件
f       切换是否使用文件过滤器
F       切换是否显示文件
B       切换是否显示书签
q       关闭 NerdTree 窗口
?       切换是否显示 Quick Help
```

在目录下创建文件， 先按 `m` 然后NerdTree会显示操作菜单， 按`a` 添加文件 b, 创建目录的话后面追加一个`\` 

切换标签页

```
:tabnew [++opt选项] ［＋cmd］ 文件      建立对指定文件新的tab
:tabc   关闭当前的 tab
:tabo   关闭所有其他的 tab
:tabs   查看所有打开的 tab
:tabp   前一个 tab
:tabn   后一个 tab


```

,n  自定义的组合键， 快速找到当前打开的文件在NerdTree上的位置

Emmet

https://blog.zfanw.com/zencoding-vim-tutorial-chinese/

EasyMotion

<Leader><leader>w/b

<Leader><Leader>s

```
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)
```

Vim-surround


普通模式
--------
|    | 命令                   | 说明 + 示例                                                                          |
|---:|----------------------|:---------------------------------------------------------------------------------|
|    | ds                   | 删除括号                                                                             |
|  例 | `ds` `"`             | `"Hello world!"` =><br> `Hello world!`                                           |
|    | cs                   | 替换括号                                                                             |
|  例 | `cs` `"(`            | `"Hello world!"` =><br> `(Hello world!)`                                         |
|    | cS                   | 替换括号，括号内文本做新一行                                                                   |
|  例 | `cS` `"{`            | `"Hello world!"` =><br> `{` <br> &nbsp;&nbsp;&nbsp;&nbsp;`Hello world!` <br> `}` |
|    | ys                   | 添加括号(配合vim光标移动)                                                                  |
|  例 | `ys` `w` `[`         | `Hello world!` =><br> `[Hello] world!`                                           |
|  例 | `ys` `w` `<em` Enter | `Hello world!` =><br> `<em>Hello<em> world!`                                     |
|    | yS                   | 添加括号，括号内文本做新一行                                                                   |
|  例 | `yS` `w` `[`         | `Hello world!` =><br> `[` <br> &nbsp;&nbsp;&nbsp;&nbsp; `Hello` <br> `] world!`  |
|    | yss                  | 整行括起来                                                                            |
|  例 | `yss` `(`            | `Hello world!` =><br> `( Hello world! )`                                         |
|    | ySS                  | 整行括起来，括号内文本做新一行                                                                  |
|  例 | `ySS` `{`            | `Hello world!` =><br> `{` <br> &nbsp;&nbsp; `Hello world! ` <br> `}`             |
|  例 | `ySS` `<div` Enter   | `Hello world!` =><br> `<div>` <br> &nbsp;&nbsp; `Hello world! ` <br> `<div>`     |
|    | ySs                  | 与ySs功能相同                                                                         |


可视模式
--------
|    | 命令             | 说明 + 示例                                                           |
|---:|:---------------|:----------------------------------------------------------------------|
|    | S              | 选中的括起来                                                              |
|  例 | 选中world: `S(`  | `Hello world!` =><br> `Hello (world)!`                                |
|    | gS             | 选中的括起来，括号内文本做新一行                                             |
|  例 | 选中world: `gS{` | `Hello world!` =><br> `Hello {` <br> &nbsp;&nbsp; ` world` <br> `}! ` |

----

Ctrlp插件

F5 刷新

Ctrl + j/k 上下选择





Verb + Noun

d for delete

w for word

dw delete word

Commands are repeatable and 

d => delete

c => change

\> => indent

v => Visually select

y => Yank(Copy) 
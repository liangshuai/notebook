# Ag搜索工具	

使用方式

```bash
ag [FILE-TYPE] [OPTIONS] PATTERN [PATH]
```

FILE-TYPE 忽略的话会搜索所有类型

```bash
ag --list-file-types
```



```bash
ag --lua search_pattern
ag -G .lua search_pattern
```



ag搜索时会默认忽略.gitignore 等版本控制系统所指定的忽略文件， 如果需要搜索其中的内容， 使用-U 选项

```bash
ag -U search_pattern
```



Ag如果搜索的pattern是全部小写的话， 自动使用大小写不敏感。 如果包含大写，就改成大小写敏感的匹配方式， 如果想直接大小写不敏感使用 ag -i 选项

`ag -w` 全词匹配， 字符前后都要有合适的分隔符

`ag -v` 对搜索结果取反


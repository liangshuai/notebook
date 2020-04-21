## 10.1 包简介

1. 简化大型程序设计和维护工作
2. 便于独立开发和维护
3. 便于项目共享和重用
4. 作为标识， 避免命名冲突
5. 实现可见性 和 封装特性



Go语言编译速度得益于三个语言特性

1. 所有包必须在开头显示声明， 不用分析整个文件
2. 禁止包的环状以来
3. 编译后包的目标文件不仅包含包本身的导出信息， 还记录了包的依赖关系， 编译器只需要读取每个直接导入包的目标文件， 而不需要遍历所有依赖的文件（间接依赖）



## 10.2 导入路径

```go
import (
    "fmt"
    "math/rand"
    "encoding/json"

    "golang.org/x/net/html"

    "github.com/go-sql-driver/mysql"
)
```



## 10.3 包声明

在每个go源文件的开头必须包含包声明语句， 主要目的是确定当前包被其他包导入时默认的标识符

math/rand包的每个源文件的开头都包含`package rand`包声明语句，所以当你导入这个包，你就可以用rand.Int、rand.Float64类似的方式访问包的成员

默认的包名就是包导入路径名的最后一段， 因此`math/rand` 和 `crypto/rand` 是有相同的包名， 有三个例外情况

1. main包本身的导入路径无关紧要
2. 包所在的目录中可能有一些文件名为`_test.go` 为后缀的go源文件
3. 一些依赖版本号的管理工具会在导入路径后追加版本号信息 `gopkg.in/yaml.v2`



## 10.4 导入声明

```go
import "fmt"
import "os"
import (
    "html/template"
    "crypto/rand"
    mrand "math/rand" // alternative name mrand avoids conflict

    "golang.org/x/net/html"
    "golang.org/x/net/ipv4"
)
```



## 10.5 包的匿名导入

有时我们只想利用导入包产生的副作用： 它会计算包级变量的初始化表达式和执行导入包的`init`初始化函数， 这时使用`_` 来重命名导入的包

```Go
import _ "image/png" // register PNG decoder
```



```Go
package png // image/png

func Decode(r io.Reader) (image.Image, error)
func DecodeConfig(r io.Reader) (image.Config, error)

func init() {
    const pngHeader = "\x89PNG\r\n\x1a\n"
    image.RegisterFormat("png", pngHeader, Decode, DecodeConfig)
}
```



## 10.6 包和命名

当创建一个包时，一般要用短小的包名， 但也不能太短导致难以理解

包名一般采用单数形式



## 10.7 工具

工作区结构, `GOPATH` 对应的工作区目录有三个子目录， 其中

* src用于存储源代码
* pkg用于保存编译后的包目标文件
* bin用于保存编译后的可执行文件

`GOROOT` 用于执行Go的安装目录



go get 获取包

go build 构建包



Go语言的构建工具对包含internal名字的路径段的包导入路径做了特殊处理。这种包叫internal包，一个internal包只能被和internal目录有同一个父目录的包所导入。例如，net/http/internal/chunked内部包只能被net/http/httputil或net/http包导入，但是不能被net/url包导入。不过net/url包却可以导入net/http/httputil包。




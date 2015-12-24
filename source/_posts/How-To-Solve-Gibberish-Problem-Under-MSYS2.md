title: 如何解决MSYS2下的中文乱码问题
date: 2015-12-24 14:57:20
tags:
---
# MSYS2是什么
> MSYS2 （Minimal SYStem 2） 是一个MSYS的独立改写版本，主要用于shell 命令行开发环境。 同时它也是一个在Cygwin （POSIX 兼容性层） 和MinGW-w64（从"MinGW-生成"）基础上产生的，追求更好的互操作性的Windows 软件。

---
# 中文乱码问题
在默认安装完后，会存在中文乱码的问题，通过下面提到的方法可以解决。
## 1. 设置字符编码
点击MSYS2窗口的左上角，打开Options，设置为UTF-8
![](http://7xpfm0.com1.z0.glb.clouddn.com/blog_How-To-Solve-Gibberish-Problem-Under-MSYS2_0.png-default)

## 2. 处理运行Win上命令的乱码
这样设置后，运行Win的命令还是会出现乱码（比如ping，ipconfig等）
### 现象
```
$ ping google.com

▒▒▒▒ Ping google.com [216.58.221.142] ▒▒▒▒ 32 ▒ֽڵ▒▒▒▒▒:
▒▒▒▒ 216.58.221.142 ▒Ļظ▒: ▒ֽ▒=32 ʱ▒▒=9ms TTL=48
▒▒▒▒ 216.58.221.142 ▒Ļظ▒: ▒ֽ▒=32 ʱ▒▒=10ms TTL=48
▒▒▒▒ 216.58.221.142 ▒Ļظ▒: ▒ֽ▒=32 ʱ▒▒=10ms TTL=48
▒▒▒▒ 216.58.221.142 ▒Ļظ▒: ▒ֽ▒=32 ʱ▒▒=9ms TTL=48

216.58.221.142 ▒▒ Ping ͳ▒▒▒▒Ϣ:
    ▒▒▒ݰ▒: ▒ѷ▒▒▒ = 4▒▒▒ѽ▒▒▒ = 4▒▒▒▒ʧ = 0 (0% ▒▒ʧ)▒▒
▒▒▒▒▒г̵Ĺ▒▒▒ʱ▒▒(▒Ժ▒▒▒Ϊ▒▒λ):
    ▒▒▒ = 9ms▒▒▒ = 10ms▒▒ƽ▒▒ = 9ms
```
### 解决方案
新建**/usr/bin/win**：
``` bash
#!/bin/bash
$@ |iconv -f gbk -t utf-8
```
新建**/etc/profile.d/alias.sh**：
``` bash
alias ls="/bin/ls --color=tty --show-control-chars"
alias grep="/bin/grep --color"
alias ll="/bin/ls --color=tty --show-control-chars -l"
 
alias ping="/bin/win ping"
alias netstat="/bin/win netstat"
alias nslookup="/bin/win nslookup"
alias ipconfig="/bin/win ipconfig"
```
效果：
```
$ ping google.com

正在 Ping google.com [216.58.221.46] 具有 32 字节的数据:
来自 216.58.221.46 的回复: 字节=32 时间=8ms TTL=48
来自 216.58.221.46 的回复: 字节=32 时间=9ms TTL=48
来自 216.58.221.46 的回复: 字节=32 时间=9ms TTL=48
来自 216.58.221.46 的回复: 字节=32 时间=9ms TTL=48

216.58.221.46 的 Ping 统计信息:
    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，
往返行程的估计时间(以毫秒为单位):
    最短 = 8ms，最长 = 9ms，平均 = 8ms
```
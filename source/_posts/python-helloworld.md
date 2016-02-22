title: Python入门——HelloWorld
date: 2016-02-22 19:30:36
tags:
---
祝大家元宵节快乐 (′▽`〃)

``` python
#!/usr/bin/env python
# encoding: utf-8
import platform

a = "Hello"
b = "World"
print("%s %s!Python" % (a, b))
# 输出当前的python版本
print(platform.python_version())

'''
代码解析

Line1：使用环境配置的python解析器
指定用2.7的可以改为：#! python2.7
指定用3.*的可以改为：#! python3

Line2：指定编码为UTF-8，python3默认则为utf-8，可以不加

Line3：导入要使用的库

Line5-6：定义变量a为字符串"Hello"，b变量为"Python"

Line7：输出，python3中print改为函数，%为格式化字符，+为连接字符串

Line8：单行注释用#

Line9：输出当前python版本

Line11-31：多行注释用三个单（双）引号
'''
```
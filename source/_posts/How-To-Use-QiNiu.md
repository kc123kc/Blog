title: 如何使用七牛图床
date: 2015-12-23 19:28:39
tags:
---
# 如何使用七牛图床

## 关于图床
图床，就是用来存放图片的空间，同时允许外链到其他网站。
将图片放到图床然后在博客里引用主要有一下几点好处：

> * 减少博客空间的访问流量
> * 便于管理图片
> * 加快网页访问速度
> * 方便对图片进行二次加工，如：加水印，调整图片尺寸等等

## 关于七牛
考虑访问速度，优先选择国内图床。
查找了下相关资料，发现有不少的人推荐使用**七牛**，使用稳定，并且免费用户也能有一定流量。
还能处理图片，例如加水印、放盗链等。
>[有哪些适合开发人员的图床？](https://www.zhihu.com/question/21349585)

## 如何使用

### 1.注册
进入七牛的[注册](https://portal.qiniu.com/signup)界面，填写信息后通过邮件激活就完成注册了。
注册成功后成为**体验用户**
> 体验用户免费额度：
> 储存空间1GB、每月下载流量1GB、创建1个空间

### 2.上传图片
#### 注册成功后，在首页先新建空间
![](http://7xpfm0.com1.z0.glb.clouddn.com/blog_How-To-Use-QiNiu0.png-default)

#### 点击“内容管理”——点击“上传”
由于没有目录结构，为避免图片重名，建议使用 **自定义前缀**
![](http://7xpfm0.com1.z0.glb.clouddn.com/blog_How-To-Use-QiNiu1.png-default)
![](http://7xpfm0.com1.z0.glb.clouddn.com/blog_How-To-Use-QiNiu2.png-default)
上传成功后，可以在这里看到外链地址。
![](http://7xpfm0.com1.z0.glb.clouddn.com/blog_How-To-Use-QiNiu3.png-default)

### 3.图片加工
为了防止图片被盗用以及标识图片的个人信息，一般会对图片进行加水印处理
#### 点击“数据处理”——点击“新建图片样式”
![](http://7xpfm0.com1.z0.glb.clouddn.com/blog_How-To-Use-QiNiu4.png-default)

输入图片**样式名称**(后面会用到)，然后进行**水印设置**(支持文字水印、图片水印)
![](http://7xpfm0.com1.z0.glb.clouddn.com/blog_How-To-Use-QiNiu5.png-default)
除了水印之外，还可以对图片的尺寸，质量进行修正处理。感兴趣的可以试试

#### 使用处理后的图片
在原有的**图片外链后加上样式分隔符(默认为“-”)和样式名称**，就可以得到水印图片了。例如：
> * **外链：**http://domain/a.png
> * **样式分隔符：**-
> * **样式名称：**default

> 使用处理后的图片，访问链接： **http://domain/a.png-default**

![](http://7xpfm0.com1.z0.glb.clouddn.com/blog_How-To-Use-QiNiu6.png-default)

# ChatRoom

*基于JSP开发的简易聊天室*

[基于mvc重新开发的聊天室](https://github.com/JasonLin1230/chatroom-mvc)

>JavaEE编程技术

## 功能描述

* 普通用户登录成功后进入聊天室，聊天室可显示以往聊天记录，可发言，刷新聊天记录

* 登录页面，用户名输入框显示上一次成功登录的用户名，快捷登录

* 主聊天室页面 可显示 当前在线人数 及 在线用户名称

* 普通用户登录，实现用户的登录、注册、修改密码及删除功能（增删改查）

* 管理员登录，实现用户录入、删除、修改、多条件查询并显示功能

* 实现简单的三层架构

## 目录结构

初始的目录结构如下：

~~~
WEB页目录
├─css                     css目录
│  ├─chatroom.css         主聊天页面样式
│  ├─login.css            登录页面样式
│  ├─manage.css           管理界面样式
│  └─modal.css            弹出框样式
│
├─js                      js目录
│  ├─theme                主题目录
│  │  └─default           默认内容目录
│  │     ├─head_1.png     默认头像1
│  │     ├─head_2.png     默认头像2
│  │     ├─head_3.png     默认头像3
│  │     ├─head_4.png     默认头像4
│  │     ├─head_5.png     默认头像5
│  │     ├─icon-ext.png   箭头图标
│  │     ├─icon.png       图标文件
│  │     ├─layer.css      layer样式
│  │     ├─loading-0.gif  加载图标1
│  │     ├─loading-1.gif  加载图标2
│  │     └─loading-2.gif  加载图标3
│  │
│  ├─canvas.js            背景canvas动画
│  ├─chatroom.js          主聊天是页面js文件
│  ├─jquery.min.js        jquery文件
│  ├─layer.js             layer文件
│  ├─login.js             登录页面js文件
│  └─manage.js            管理页面文件
│
├─ChangePass.jsp          更改密码的jsp文件
├─ChatRoom.jsp            主聊天室的jsp文件
├─NewUser.jsp             新增用户的jsp文件
├─changeinfo.jsp          修改用户信息的jsp文件
├─dispose.jsp             销毁用户的jsp文件
├─error.jsp               发生错误时提示的jsp文件
├─index.jsp               默认入口文件
├─login.jsp               登录页面jsp文件
├─manage.jsp              管理员页面jsp文件
├─out.jsp                 用户退出聊天室操作的jsp文件
├─query.jsp               多条件查询的jsp文件
└─say.jsp                 处理用户发送消息的jsp文件
~~~

## 项目截图

*待补充*

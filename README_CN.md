### 简介
[[English](./README.md)] 推送代码到github, gitee, coding, codeup, codehub等代码托管平台，同时封装git推送信息并添加部分中文说明和时间统计。

不上传时耗时
![updated](./updated.gif)

上传时耗时
![update](./update.gif)

### 发行版
* 请到release或发行版页面下载最新deb包安装。

### 安装
* 使用deb安转
> $ sudo dpkg -i gim_shell_x.x.x_linux_amd64.deb # shell-script 2.8K
>
> $ sudo dpkg -i gim_golang_x.x.x_linux_amd64.deb # golang 4.4M

* 使用源码安转
> $ cd shell/ or cd golang/
>
> $ make   
>
> $ make install

### uninstall
* deb卸载
> $ sudo dpkg -r gim
* 源码安装卸载
> $ make uninstall

### 更新日志
* 2020-09-30 上传基本功能(golang脚本)和deb包。
* 2020-09-08 上传基本功能(shell脚本)和deb包。

### 纠错
欢迎issue指出错误，或pull-request更正。

## 使用vagrant新安装的centos7配置
### 安装net-tools获得ifconfig的使用
* sudo yum install -y net-tools

### 编译安装python3
#### 安装依赖
* gcc gcc-c++ zlib zlib-devel bzip2 bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel kernel-level make libffi-devel
#### 下载安装包&解压

```bash
wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz
```

#### 配置
* ./configure --prefix=/usr/local/python3 --enable-shared CFLAGS=-fPIC

#### 编译&安装
* make
* sudo make install

#### 配置

安装完成之后要简单做一下配置：即将python库路径添加到/etc/ld.so.conf配置中，然后执行ldconfig生效；或者添加到$LD_LIBRARY_PATH中，这样在接下来运行python3是就不会报找不到库文件的错误了.

#### 创建链接

```bash
ln -s /usr/local/python3/bin/python3 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
```



### 编译安装vim

#### 安装依赖
* ncurses-devel
* 如果安装ncurses-devel之后进行配置还是提示找不到ncueses,安装openssl-devel

#### 配置
* ./configure --prefix=/usr/local/vim --with-features=huge --enable-python3interp=yes --enable-pythoninterp=yes --enable-rubyinterp=yes

#### 编译安装
* make
* sudo make isntall

### 编译安装tmux
#### 安装依赖
* libevent-devel
* 如果安装libevent-devel之后配置还是提示找不到,安装openssl-devel

#### 配置
* ./configure --prefix=/usr/local/tmux
### 编译安装
* make
* sudo make install

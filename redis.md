## 编译安装redis

### 下载并解压

```bash
wget http://download.redis.io/releases/redis-5.0.4.tar.gz
tar xzf redis-5.0.4.tar.gz
cd redis-5.0.4
```



### 编译安装

```bash
make
# 使用PREFIX指定安装位置
make PREFIX=/usr/local/redis install
```



### 配置

* 将redis源码中的redis.conf配置文件复制到redis安装目录下的配置文件夹(需要创建一个空的配置文件夹)

  ```bash
  mkdir /usr/local/redis/conf
  cp redis.conf /usr/local/redis/conf
  ```

* 修改

  ```bash
  # 守护进程启动
  daemonize yes
  ```

* 启动

  ```bash
  /usr/local/redis/bin/redis-server /usr/local/redis/conf/redis.conf
  ```

  

### systemctl服务

* 提供systemctl启动服务

  ```bash
  vim /lib/systemd/sytem/redis-server.service
  #写入以下内容
  Description=Redis
  After=network.target
  
  [Service]
  Type=forking
  ExecStart=/usr/local/redis/bin/redis-server /usr/local/redis/conf/redis.conf
  ExecStop=/usr/local/redis/bin/redis-cli -h 127.0.0.1 -p 6379 shutdown
  
  [Install]
  WantedBy=multi-user.target
  ```

* 命令

  ```bash
  # 启动
  systemctl start redis-server.service
  # 关闭
  systemctl stop redis-server.service
  # 开机启动
  systemctl enable redis-server.service
  # 取消开机启动
  systemctl disable redis-server.service
  ```

  


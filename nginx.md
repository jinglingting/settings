## 编译安装nginx

### 下载解压

```bash
wget http://nginx.org/download/nginx-1.14.2.tar.gz
tar -zxvf nginx-1.14.2.tar.gz
cd nginx-1.14.2
```



### 编译安装

```bash
# 配置
./configure --prefix=/usr/local/nginx
# 编译
make
# 安装
sudo make install
```

### 配置

* 配置文件目录为/usr/loca/nginx/conf/nginx.conf



### systemctl服务

```bash
# 添加服务文件
vim /lib/systemd/system/nginx.service
# 添加以下内容
[Unit]
Description=nginx - high performance web server
After=network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
# PIDFile=/usr/local/nginx/logs/nginx.pid
ExecStartPre=/usr/local/nginx/sbin/nginx -t -c /usr/local/nginx/conf/nginx.conf
ExecStart=/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
ExecReload=/usr/local/nginx/sbin/nginx -s reload
ExecStop=/usr/local/nginx/sbin/nginx -s stop
ExecQuit=/usr/local/nginx/sbin/nginx -s quit
PrivateTmp=true

[Install]
WantedBy=multi-user.target
```

* 启动服务前需要重载systemctl命令

  ```bash
  systemctl daemon-reload
  ```

* 注意:

  * 如果nginx.service中启用了PIDFile选项,需要和nginx配置文件中设置为同一个文件
  * 默认配置文件中没有开启user,需要设置user  root;


## 安装配置mariadb
### 安装
* sudo yum install -y mariadb mariadb-server mariadb-devel

### 配置
* mysql_install_db
* 然后启动数据库
* mysql_secure_install配置root用户密码

### pip安装mysqlclient
* pip isntall mysqlclient
* 注意:如果上面没有安装mariadb-devel,此处会报错OSError: mysql_config not found

### 注意事项(centos)

* centos中在非root用户下执行mysql_install_db会提示权限不足,但是使用sudo安装后会把/var/lib/mysql目录下的一些文件用户/用户组属性设定为root,导致第二步启动数据库失败

* 正确用法:sudo mysql_install_db --user=mysql指明用户

* 如果之前执行使用sudo mysql_install_db执行过导致失败,需要将受影响的文件用户/用户组属性改为mysql

  ```bash
  cd /var/lib/
  sudo chown -R mysql.mysql mysql
  ```

  

### 导入数据

* 导入有外键的数据时,需要将外键检查关闭,导入完后再开启

  ```sql
  set FOREIGN_KEY_CHECKS=0;
  set FOREIGN_KEY_CHECKS=1;
  ```

  
## vagrant

### 基本命令

```bash
# 初始化
vagrant init centos/7
# 启动
vagrant up
# 关闭
vagrant halt
# 重新加载
vagrant reload
# 销毁
vagrant destroy
# 挂起
vagrant suspend
# 恢复
vagrant resume
```

### 打包以及使用

```bash
# 查看虚拟机列表
$vboxmanage list vms
"centos7" {2ae14d69-6e44-46e6-b170-01505662cd85}
"centos7-dev" {7b89199f-95fb-4db3-b617-8ed78c8e2e4f}
"arch" {34f42991-67af-4464-abe7-6f37d538a973}
"centos7_my" {5d699576-2463-4ad0-bb81-8b15bb19f5f5}
"django-server" {2ab5dffc-689b-42bb-a493-5f0711111c23}
# 打包(使用上面查看到的虚拟机名字)
$ vagrant package --base django-server --output centos7/jing-python-vim-tmux.box
# 添加本地包
$vagrant box add --name centos7-base centos7-jing-python-vim-tmux.box 
==> box: Box file was not detected as metadata. Adding it directly...
==> box: Adding box 'centos7-base' (v0) for provider: 
    box: Unpacking necessary files from: file:///home/jing/vagrant/django-server/centos7-jing-python-vim-tmux.box
==> box: Successfully added box 'centos7-base' (v0) for 'virtualbox'!
#然后就可以用box_name来指定自己的包了
```

### 打包注意事项

#### 密钥登录(使用用户名密码登录的不需要考虑)

* 打包时如果还是使用密钥登录的话,需要将用户目录下的.ssh/authorized_keys替换成vagrant提供的不安全的公钥

* 官方提供的公钥后缀为vagrant insecure public key,而替换后的公钥后缀为vagrant

* sudo -u vagrant wget https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -O   /home/vagrant/.ssh/authorized_keys

* 原因:

  * vagrant管理了一个官方的keypair, 预先放在box中一个公钥，私钥被vagrant管理着。vagrant up的时候，第一次登录虚拟机就是使用这个官方提供的keypair. 

  * 当登录入虚拟机前，vagrant在宿主机生成一个新的keypair, 然后将虚拟机中的公钥替换为新的这个，然后私钥放在宿主机。

  * vagrant up第一次登入的时候

    ```bash
    server-product: Vagrant insecure key detected. Vagrant will automatically replace
    server-product: this with a newly generated keypair for better security.
    ```

### box管理

```bash
# 列出所有box
vagrant box list
# 移除box
vagrant box remove NAME
```



### 配置(单主机)

* 指定安装包名字config.vm.box
  * config.vm.box = "centos7-base"
  * 可以填写添加的本地包名字box_name
* 自动更新设置config.vm.box_check_update

  * config.vm.box_check_update = false停止自动更新

* 修改虚拟机在vbox中显示的名字

  * ```
    config.vm.provider "virtualbox" do |vb|
    	vb.name="virtual_name"
    end
    ```

* 修改网卡配置

  * nat:config.vm.network "private_network", ip: "192.168.1.1"
  * bridge:config.vm.network "public_network",bridge:"en01"

* 端口映射

  * config.vm.network "forwarded_port", guest: 80, host: 8080

* 修改安装后系统的hosts主机名

  * ```
    Vagrant.config("2") do |config|
    	config.vm.hostname = "xxxx"
    ```

* 修改安装后系统的用户名

  * config.ssh.username = "xxx"
  * 一般不要乱修改用户名,ssh连接的时候需要使用这个
  * 官方下载的box往往使用的是"vagrant"这个用户名.
  * 如果自定义的话,需要在用户目录下的.ssh下添加允许的主机的公钥

* 设置文件映射

  * config.vm.synced_folder "/home/jing/samba", "/home/vagrant/samba"

### 配置(多主机)



### 问题:GuestAdditions

* 问题: GuestAdditions seems to be installed (6.0.6) correctly, but not running.

* 解决:(未生效)

  ```bash
  # 先启动
  vagrant up
  # 然后安装
  vagrant vbguest --do install
  # 重新启动
  vagrant reload
  # 查看状态
  vagrant vbguest --status
  ```

* 解决方法:

  ```bash
  # 修复插件
  vagrant plugin repair
  # 修复失败的话,使用下面这条,然后Y确认
  vagrant plugin expunge --reinstall
  # 然后再修复
  vagrant plugin repair
  ```

  
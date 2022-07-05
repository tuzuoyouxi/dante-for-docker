# 安装dante进容器
# dante-for-docker
#一种简易的方式安装dante 进docker
#just for a easy way to build dante into dokcer

#Author QQ:yamano023@qq.com
#       skype: yamano023@yamano023.com
#       mail: yamano023@yamano023.com

Dockerfile介绍
Dockerfile introduce

docker镜像是基于alpine 通过apk 安装dante ，生成配置文件，shell脚本方式添加用户密码和端口（目前还没探索出直接echo -e 方式 是因为echo -e 无法带变量）
docker images base from apline ,  from apk's way to install dante, config file from echo command , USERNAME PASSWORD PORT from shell scripts 

如何启动容器
How to start container
```
docker run -d -it --name=dante001 -e USERNAME=dante001 -e PASSWORD=654321 -e PORT=9999 -p 9999:9999 containerid 
```

Now, you can play
Enjoy yourself

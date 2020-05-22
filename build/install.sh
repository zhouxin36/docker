#!/bin/bash

# 设置docker仓库
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

# 更新并安装 Docker-CE
yum makecache fast
# 安装docker
yum -y install docker-ce docker-ce-cli containerd.io

# 启动docker
systemctl start docker

# run helloworld
docker run hello-world
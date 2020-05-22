#!/bin/bash

# 设置docker仓库
yum -y install yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 安装docker
yum -y install docker-ce docker-ce-cli containerd.io

# 启动docker
systemctl start docker

# run helloworld
docker run hello-world
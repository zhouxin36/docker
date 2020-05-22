#!/bin/bash

# 设置docker仓库
yum -y install yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 安装docker
yum -y install --nobest docker-ce docker-ce-cli
# 安装固定版本container
dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
# 更新docker版本
dnf update docker-ce docker-ce-cli

# 启动docker
systemctl start docker

# run helloworld
docker run hello-world
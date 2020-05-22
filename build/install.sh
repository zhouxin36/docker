#!/bin/bash

MIRROR_URL=http://mirrors.aliyun.com/docker-ce/linux/centos
MIRROR_PACKAGE=${MIRROR_URL}/7/x86_64/stable/Packages

# 设置docker仓库
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo ${MIRROR_URL}/docker-ce.repo

# 安装固定版本container,docker-ce,docker-ce-cli
yum -y install ${MIRROR_PACKAGE}/containerd.io-1.2.6-3.3.el7.x86_64.rpm
yum -y install ${MIRROR_PACKAGE}/docker-ce-cli-19.03.8-3.el7.x86_64.rpm 
yum -y install ${MIRROR_PACKAGE}/docker-ce-19.03.8-3.el7.x86_64.rpm

# 添加镜像加速器
mkdir -p /etc/docker
tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://6eb2jqvr.mirror.aliyuncs.com"]
}
EOF
systemctl daemon-reload

# 启动docker
systemctl start docker

# run helloworld
docker run hello-world
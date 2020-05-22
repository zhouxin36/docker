#!/bin/bash


# 安装git
yum -y install git

# 拉取GitHub仓库
pull(){
	git clone https://github.com/zhouxin36/docker.git
	git clone https://github.com/zhouxin36/kubernetes.git
}

# 检查是否安装成功
if hash git 2>/dev/null; 
then
	# 拉取GitHub仓库
	pull
else
	echo >&2 "git安装失败"; 
	exit 1;
fi
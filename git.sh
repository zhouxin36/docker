#!/bin/bash


# 安装git
yum install git

# 检查是否安装成功
if hash git 2>/dev/null; 
then
	pull
else
	echo >&2 "git安装失败"; 
	exit 1;
fi

pull(){
	git clone https://github.com/zhouxin36/docker.git
	git clone https://github.com/zhouxin36/kubernetes.git
}
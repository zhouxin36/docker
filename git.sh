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
	pull
else
	echo >&2 "git安装失败"; 
	exit 1;
fi

read -p "请输入用户名：" userName
git config --global user.name ${userName}

stty -echo # 不显示用户输入
read -p "请输入密码：" password
git config --global user.password ${password}
stty echo  # 恢复显示用户输入
echo


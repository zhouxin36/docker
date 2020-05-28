#!/bin/bash

install(){
	# 下载hive
wget -O hive-2.tar.gz -c https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-2.3.7/apache-hive-2.3.7-bin.tar.gz

# 解压
mkdir hive && tar -zvxf hive-2.tar.gz -C ./hive --strip-components 1

# 删除压缩包
rm -rf hive-2.tar.gz

# 进入java
cd hive

# 设置环境变量
HIVE_HOME=`pwd` && echo "export HIVE_HOME=${HIVE_HOME}">>/etc/profile
echo 'export PATH=$PATH:$HIVE_HOME/bin'>>/etc/profile

# 刷新缓存
source /etc/profile
}

# 检查是否安装成功
if hash hadoop 2>/dev/null; 
then
	# 安装hive
	install
else
	echo >&2 "请先安装hadoop"; 
	exit 1;
fi


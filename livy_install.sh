#!/bin/bash

# 下载 livy
wget -O livy.zip -c https://mirrors.tuna.tsinghua.edu.cn/apache/incubator/livy/0.7.0-incubating/apache-livy-0.7.0-incubating-bin.zip

# 解压
unzip livy.zip

mv apache-livy-0.7.0-incubating-bin livy

# 删除压缩包
rm -rf livy.zip

# 进入java
cd livy

# 设置环境变量
LIVY_HOME=`pwd` && echo "export LIVY_HOME=${LIVY_HOME}">>/etc/profile
echo 'export PATH=$PATH:$LIVY_HOME/bin'>>/etc/profile

# 刷新缓存
source /etc/profile
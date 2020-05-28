#!/bin/bash

# 下载 livy
wget -O livy.tar.gz -c http://mirrors.hust.edu.cn/apache/incubator/livy/0.5.0-incubating/livy-0.5.0-incubating-bin.zip

# 解压
mkdir livy && tar -zvxf livy.tar.gz -C ./livy --strip-components 1

# 删除压缩包
rm -rf livy.tar.gz

# 进入java
cd livy

# 设置环境变量
LIVY_HOME=`pwd` && echo "export LIVY_HOME=${LIVY_HOME}">>/etc/profile
echo 'export PATH=$PATH:$LIVY_HOME/bin'>>/etc/profile

# 刷新缓存
source /etc/profile
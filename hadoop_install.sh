#!/bin/bash

# 下载hadoop
wget -O hadoop-2.tar.gz -c https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz

# 解压
mkdir hadoop && tar -zvxf hadoop-2.tar.gz -C ./hadoop --strip-components 1

# 删除压缩包
rm -rf hadoop-2.tar.gz

# 进入java
cd hadoop

# 设置环境变量
HADOOP_HOME=`pwd` && echo "export HADOOP_HOME=${HADOOP_HOME}">>/etc/profile
echo 'export PATH=$PATH:$HADOOP_HOME/bin'>>/etc/profile
echo 'export PATH=$PATH:$HADOOP_HOME/sbin'>>/etc/profile

# 刷新缓存
source /etc/profile
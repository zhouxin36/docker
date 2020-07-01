#!/bin/bash

# 下载 spark
wget -O spark-2.tar.gz -c https://mirrors.tuna.tsinghua.edu.cn/apache/spark/spark-2.4.6/spark-2.4.6-bin-hadoop2.7.tgz

# 解压
mkdir spark && tar -zvxf spark-2.tar.gz -C ./spark --strip-components 1

# 删除压缩包
rm -rf spark-2.tar.gz

# 进入java
cd spark

# 设置环境变量
SPARK_HOME=`pwd` && echo "export SPARK_HOME=${SPARK_HOME}">>/etc/profile
echo 'export PATH=$PATH:$SPARK_HOME/bin'>>/etc/profile

# 刷新缓存
source /etc/profile
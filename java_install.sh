#!/bin/bash

# 下载jdk
wget -O java_1.8.tar.gz https://download.java.net/openjdk/jdk8u41/ri/openjdk-8u41-b04-linux-x64-14_jan_2020.tar.gz

# 解压
mkdir java && tar -zvxf java_1.8.tar.gz -C ./java --strip-components 1

# 删除压缩包
rm -rf java_1.8.tar.gz

# 进入java
cd java

# 设置环境变量
JAVA_HOME=`pwd` && echo "export JAVA_HOME=${JAVA_HOME}">>/etc/profile
echo 'export PATH=$PATH:$JAVA_HOME/bin'>>/etc/profile

# 刷新缓存
source /etc/profile
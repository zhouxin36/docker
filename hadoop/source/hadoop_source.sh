#!/bin/bash

# JAVA_HOME=/usr/local/openjdk-8
# HADOOP_HOME=/hadoop

# 下载hadoop
wget -O hadoop-2.tar.gz -c https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz

# 解压
mkdir hadoop && tar -zvxf hadoop-2.tar.gz -C ./hadoop --strip-components 1

# 删除压缩包
rm -rf hadoop-2.tar.gz

# 构建docker镜像
docker build -t registry.cn-shenzhen.aliyuncs.com/zhouxin36/hadoop .

# 上传docker镜像
docker push registry.cn-shenzhen.aliyuncs.com/zhouxin36/hadoop

# 删除文件夹
rm -rf hadoop

# docker run -d --name hadoop registry.cn-shenzhen.aliyuncs.com/zhouxin36/hadoop ping www.baidu.com
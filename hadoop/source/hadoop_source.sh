#!/bin/bash

# 下载hadoop
wget -O hadoop-2.tar.gz -c https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz

# 解压
mkdir hadoop && tar -zvxf hadoop-2.tar.gz -C ./hadoop --strip-components 1

# 删除压缩包
rm -rf hadoop-2.tar.gz
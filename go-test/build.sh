#!/bin/bash


# build
docker build -t registry.cn-shenzhen.aliyuncs.com/zhouxin_go/my-go-test:latest .
echo "构建成功,push......"
docker push registry.cn-shenzhen.aliyuncs.com/zhouxin_go/my-go-test:latest
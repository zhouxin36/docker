#!/bin/bash

docker run -d -p 8088:8088 -v /home/project/superset:/home/superset  --name superset --env FLASK_APP=superset amancevice/superset:0.35.2 

# 设置用户名和密码
docker exec -it superset flask fab create-admin
# 初始化数据库
docker exec -it superset superset db upgrade
# superset初始化
docker exec -it superset superset init
# 开启superset服务
docker exec -it superset superset run -p 8088 --with-threads --reload

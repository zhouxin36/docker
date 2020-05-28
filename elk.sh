#!/bin/bash

docker network create elk

安装 elasticsearch
docker run -d --name elasticsearch --net elk -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:7.7.0

安装 kibana
docker run -d --name kibana --net elk -p 5601:5601 	kibana:7.7.0

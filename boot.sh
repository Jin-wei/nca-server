#!/bin/bash

docker kill $(docker ps -a -q)

docker rm $(docker ps -a -q)

docker run --rm -p 0.0.0.0:33306:3306 --name ercdb -v $PWD/mysql/logs:/logs -v $PWD/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7

docker run --rm -p 127.0.0.1:16379:6379 --name ercredis -d redis:3.2.8

docker run --rm -p 27017:27017 --name ercmongo -v $PWD/mongodb:/data/db -d mongo:3.4

# docker run --rm -p 0.0.0.0:9090:9090 -p 127.0.0.1:9229:9229 --name ncaserver --link ncadb:ncadb --link ncaredis:ncaredis --link ncamongo:ncamongo -v $PWD:/webapp -w /webapp -it node:7.9.0 npm run debug

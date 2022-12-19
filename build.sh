#!/bin/bash

# 创建特定Release的镜像

latest=0
if [ -z "$1" ]
then
  latest=1
  version=`curl -sSfL https://api.github.com/repos/pymumu/smartdns/releases/latest | jq  -r '.tag_name' | sed 's/Release//g'`
else
  version=$1
fi
echo "build ecat/smartdns:$version latest=$latest"
docker build -t ecat/smartdns:$version --build-arg VERSION=$version .
if [ $latest -eq 1 ]
then
  docker build -t ecat/smartdns --build-arg VERSION=$version  .
fi


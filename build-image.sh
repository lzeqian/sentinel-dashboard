#!/bin/bash

DASHBOARDPREFIX=sentinel-dashboard
DASHBOARD_SERVER_VERSION=
while read -r file
do
  if [[ $file =~ ^${DASHBOARDPREFIX}.* ]]; then
    DASHBOARD_SERVER_VERSION=`echo "${file%.*}"  | awk '{s=split($1,arr,"-");print(arr[length(arr)])}'`
  fi
done <<< "$(ls -l ./bin | awk '{print($9)}')"
docker build -t jiaozi/sentinel-dashboard:${DASHBOARD_SERVER_VERSION} --build-arg DASHBOARD_SERVER_VERSION=${DASHBOARD_SERVER_VERSION} -f ./Dockerfile .

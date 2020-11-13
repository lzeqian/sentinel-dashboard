FROM java:alpine
MAINTAINER jiaozi "973465719@qq.com"

ARG DASHBOARD_SERVER_VERSION=1.8.0
# set default environment
ENV BASE_DIR="/home/sentinel" \
    SERVER_PORT="8001" \
    DASHBOARD_SERVER_USERNAME="admin" \
    DASHBOARD_SERVER_PASSWORD="123456" \
    HIDEAPPNOMACHINEMILLIS="60000" \
    REMOVEAPPNOMACHINEMILLIS="120000"\
    SESSIONTIMEOUTNAME="7200" \
    DASHBOARD_SERVER_VERSION=${DASHBOARD_SERVER_VERSION}



WORKDIR /$BASE_DIR

Add bin/sentinel-dashboard-${DASHBOARD_SERVER_VERSION}.jar bin/sentinel-dashboard-${DASHBOARD_SERVER_VERSION}.jar

ADD bin/docker-entrypoint.sh bin/docker-entrypoint.sh
RUN chmod +x bin/docker-entrypoint.sh
# set startup log dir
RUN mkdir -p logs \
	&& cd logs \
	&& touch start.out \
	&& ln -sf /dev/stdout start.out \
	&& ln -sf /dev/stderr start.out
RUN chmod +x bin/docker-entrypoint.sh

EXPOSE $SERVER_PORT
ENTRYPOINT ["bin/docker-entrypoint.sh"]

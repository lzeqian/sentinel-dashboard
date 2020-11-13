#!/bin/sh
RUN_CMD="java"

# 应用参数
RUN_CMD="$RUN_CMD -Dserver.port=\"${SERVER_PORT}\""
RUN_CMD="$RUN_CMD -Dsentinel.dashboard.auth.username=\"${DASHBOARD_SERVER_USERNAME}\""
RUN_CMD="$RUN_CMD -Dsentinel.dashboard.auth.password=\"${DASHBOARD_SERVER_PASSWORD}\""
RUN_CMD="$RUN_CMD -Dsentinel.dashboard.app.hideAppNoMachineMillis=\"${HIDEAPPNOMACHINEMILLIS}\""
RUN_CMD="$RUN_CMD -Dsentinel.dashboard.removeAppNoMachineMillis=\"${REMOVEAPPNOMACHINEMILLIS}\""
RUN_CMD="$RUN_CMD -Dserver.servlet.session.cookie.name=\"${SESSIONTIMEOUTNAME}\""

RUN_CMD="$RUN_CMD $JAVA_OPTS"
RUN_CMD="$RUN_CMD -jar"
RUN_CMD="$RUN_CMD bin/sentinel-dashboard-${DASHBOARD_SERVER_VERSION}.jar"
echo $RUN_CMD
eval $RUN_CMD

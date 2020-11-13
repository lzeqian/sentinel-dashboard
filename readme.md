# Sentinel Dashboard Docker

本项目是Alibaba Sentinel Dashboard [Sentinel](https://github.com/alibaba/Sentinel)的docker构建脚本.

## Dockerfile
用于构建docker镜像的Dockerfile，其中build-image.sh用于构建镜像，该命令会自动查找bin目录下sentinel-dashboard开头的文件，获取对应版本号用于设置镜像版本号


## 通用的参数

| name                         | 描述                            | 默认值                         |
| ---------------------------- | -------------------------------------- | ------------------------------ |
| SERVER_PORT                  | server启动的端口                         | 8001                           |
| DASHBOARD_SERVER_USERNAME    | dashboard登录用户名                  | admin            |
| DASHBOARD_SERVER_PASSWORD    | dashboard登陆密码                     | 123456                   |
| HIDEAPPNOMACHINEMILLIS       | 被监控的客户端在dashboard隐藏超时时间(ms)   | 60000                    |
| REMOVEAPPNOMACHINEMILLIS       | 被监控的客户端在dashboard被删除超时时间(ms)   | 120000                    |
| SESSIONTIMEOUTNAME       | 客户端登录session的超时时间(ms)   | 7200                    |

## 运维
### 构建镜像
```shell script
  git clone https://github.com/lzeqian/sentinel-dashboard.git
  cd sentinel-dashboard && ./build-image.sh
```
### 启动服务
目前dockerhub上已经打包了最新版本的镜像，如果不是拓展参数的需求，构建镜像步骤可以省略。
#### 简易使用
```shell script
  docker run -d -p 8001:8001 liaomin789/sentinel-dashboard:1.8.0
```
#### 拓展参数
```shell script
  docker run -d -p 8001:8001 -e DASHBOARD_SERVER_PASSWORD=1234567 liaomin789/sentinel-dashboard:1.8.0
```
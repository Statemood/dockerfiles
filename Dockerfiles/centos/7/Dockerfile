# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM docker.io/centos:7

LABEL MAINTAINER=Lin.Ru@msn.com

RUN ln -sfv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    rpm -Uvh https://mirrors.tuna.tsinghua.edu.cn/epel/epel-release-latest-7.noarch.rpm && \
    yum update  -y                  && \
    yum clean all                   && \
    rm -rf /var/log/anaconda /anaconda-post.log /var/lib/yum
# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/centos:7

LABEL MAINTAINER="Lin Ru <Lin.Ru@msn.com>"

COPY run.sh             /
COPY init.password.sql  /

RUN yum update  -y  && \
    yum install -y libaio-devel numactl-libs && \
    yum clean all   && \
    rpm -ivh https://mirrors.tuna.tsinghua.edu.cn/mysql/downloads/MySQL-5.7/mysql-community-server-minimal-5.7.21-1.el7.x86_64.rpm && \
    chmod 755  /run.sh && rm -rf /var/lib/mysql

COPY my.cnf             /etc/
ENTRYPOINT ["/run.sh"]

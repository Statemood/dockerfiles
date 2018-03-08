# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/centos:7

LABEL MAINTAINER="Lin Ru <Lin.Ru@msn.com>"

COPY mongodb.conf /etc
COPY run.sh       /

RUN  yum update -y && \
     yum install -y openssl-devel openssl && \
     yum clean all && \
     rpm -ivh https://mirrors.tuna.tsinghua.edu.cn/mongodb/yum/el7-3.4/RPMS/mongodb-org-server-3.4.9-1.el7.x86_64.rpm && \
     chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]

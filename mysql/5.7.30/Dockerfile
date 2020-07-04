# --------------------------------------------
# Created by Lin Ru, 2018.01.06
#            Lin.Ru@msn.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM centos:7

RUN yum update  -y  && \
    yum install -y libaio-devel numactl-libs && \
    yum clean all   && \
    yum install -y http://mirrors.ustc.edu.cn/mysql-repo/yum/mysql-5.7-community/docker/x86_64/mysql-community-server-minimal-5.7.30-1.el7.x86_64.rpm && \
    mkdir -p /etc/mysql                      && \
    rm -rf /var/lib/mysql /var/tmp/*

COPY run.sh     /
COPY my.cnf     /etc/mysql
COPY init.sql   /usr/share/mysql

RUN  chmod 755 /run.sh          && \
     mkdir -p /var/lib/mysql    && \
     touch /etc/my.exxtra.cnf   && \
     chown -R mysql /etc/mysql /var/lib/mysql

USER mysql

ENTRYPOINT ["/run.sh"]
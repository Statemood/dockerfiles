# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/centos:7

COPY run.sh     /
COPY init-db.sh /

RUN yum update -y && \
    yum install -y libaio-devel numactl-libs net-tools perl perl-Data-Dumper-Names && \
    yum clean all && \
    for pkg in devel shared client server; \
    do rpm -ivh https://mirrors.tuna.tsinghua.edu.cn/mysql/yum/mysql56-community-el7/mysql-community-$pkg-5.6.35-2.el7.x86_64.rpm; done && \
    chmod 755  /run.sh /init-db.sh && rm -rf /var/lib/mysql

ENTRYPOINT ["/run.sh"]

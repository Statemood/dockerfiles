# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/centos:7

LABEL MAINTAINER="Lin Ru <Lin.Ru@msn.com>"

ADD run.sh    /
RUN yum update -y             && \
    yum install -y memcached  && \
    yum clean all             && \
    chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]

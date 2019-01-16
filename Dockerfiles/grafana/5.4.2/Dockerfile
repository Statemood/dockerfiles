# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM img.linge.io/library/centos:7

COPY run.sh /

RUN yum update  -y                                  && \
    yum install -y  fontconfig freetype urw-fonts   && \
    yum clean all                                   && \
    v="5.4.0"                                       && \
    g="grafana"                                     && \
    curl -L https://s3-us-west-2.amazonaws.com/$g-releases/release/$g-$v.linux-amd64.tar.gz | \
    tar zxf -                       && \
    mv $g-$v  /$g                   && \
    chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
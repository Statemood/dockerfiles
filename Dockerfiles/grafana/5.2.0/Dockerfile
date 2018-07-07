# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM centos:7

ENV VERSION 5.2.0

COPY run.sh /

RUN yum update  -y  && \
    yum install -y  fontconfig freetype urw-fonts && \
    yum clean all   && \
    curl -L https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.2.0.linux-amd64.tar.gz | \
    tar zxf -       && \
    mv grafana-$VERSION /grafana && \
    chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
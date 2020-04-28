# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/centos:7

ENV VERSION 4.6.3

COPY run.sh /

RUN yum update  -y  && \
    yum install -y  fontconfig freetype urw-fonts && \
    yum clean all   && \
    curl -Lskj https://dl.rulin.me/grafana/grafana-$VERSION.linux-x64.tar.gz | \
    tar zxf -       && \
    mv grafana-$VERSION /grafana && \
    chmod 755 /run.sh

ADD conf /grafana/conf

ENTRYPOINT ["/run.sh"]

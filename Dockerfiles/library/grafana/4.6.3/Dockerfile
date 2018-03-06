FROM registry.daoxila.com/library/centos:7

ENV VERSION 4.6.3

COPY run.sh /

RUN yum update  -y  && \
    yum install -y  fontconfig freetype urw-fonts && \
    yum clean all   && \
    curl -Lskj https://downloads.daoxila.com/packages/grafana/grafana-$VERSION.linux-x64.tar.gz | \
    tar zxf -       && \
    mv grafana-$VERSION /grafana && \
    chmod 755 /run.sh

ADD conf /grafana/conf

ENTRYPOINT ["/run.sh"]

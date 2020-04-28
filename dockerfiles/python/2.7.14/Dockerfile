FROM statemood/alpine:3.7

COPY job.sh         /

RUN apk update		&& \
    apk upgrade		&& \
    c="gcc make autoconf g++ python2-dev mysql-dev" && \
    pi="mirrors.aliyun.com"                         && \
    ps="http://$pi/pypi/simple"                     && \
    args="-i $ps --trusted-host=$pi"                && \
    apk add "python2~=2.7.14" py2-pip $c jq         && \
    pip install --upgrade pip $args                 && \
    pip install ssh toml MySQL-python==1.2.5 $args  && \
    cp /usr/lib/libmysqlclient.so.18 /              && \
    apk del $c                                      && \
    mv /libmysqlclient.so.18 /usr/lib               && \
    chmod 755 /job.sh
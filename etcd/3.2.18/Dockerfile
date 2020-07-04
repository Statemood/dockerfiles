# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/alpine:3.7

COPY run.sh   /

ENV ETCD_VERSION="v3.2.18"
RUN apk update		&& \
    apk upgrade		&& \
    curl -Ljk https://github.com/coreos/etcd/releases/download/$ETCD_VERSION/etcd-$ETCD_VERSION-linux-amd64.tar.gz | tar zxf - && \
    mv etcd-$ETCD_VERSION-linux-amd64/etcd* /usr/local/bin && \
    rm -rf etcd-$ETCD_VERSION-linux-amd64   && \
    chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
FROM alpine:3.11

LABEL Maintainer="Lin.Ru@msn.com"


COPY run.sh /
COPY init-cluster.sh /

ENV  REDIS_DIRS="/var/lib/redis /var/run/redis /var/log/redis" \
     REDIS_CONF="/etc/redis.conf"

RUN  apk update               && \
     apk upgrade              && \
     chmod -v 755 /run.sh init-cluster.sh               && \
     apk add "redis~=5.0.7" bash expect                 && \
     sed -i 's/^bind .*/bind 0.0.0.0/'      $REDIS_CONF && \
     sed -i 's/^daemonize .*/daemonize no/' $REDIS_CONF && \
     chown 1000 $REDIS_DIRS

COPY redis-sentinel.conf /etc

ENTRYPOINT ["/run.sh"]
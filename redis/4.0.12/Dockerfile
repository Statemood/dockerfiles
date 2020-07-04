FROM statemood/alpine:3.8

LABEL Maintainer="Lin.Ru@msn.com"

COPY run.sh /

ENV  REDIS_DIRS="/var/lib/redis /var/run/redis /var/log/redis" \
     REDIS_CONF="/etc/redis.conf"

RUN  apk update               && \
     apk upgrade              && \
     apk add "redis~=4.0.12"  && \
     chmod -v 755 /run.sh     && \
     sed -i 's/^bind .*/bind 0.0.0.0/'      $REDIS_CONF && \
     sed -i 's/^daemonize .*/daemonize no/' $REDIS_CONF && \
     chown 1000 $REDIS_DIRS

COPY redis-sentinel.conf /etc

ENTRYPOINT ["/run.sh"]
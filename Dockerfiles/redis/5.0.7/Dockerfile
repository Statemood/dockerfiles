FROM statemood/alpine:3.11

LABEL Maintainer="Lin.Ru@msn.com"

ENV  REDIS_DIRS="/var/lib/redis /var/run/redis /var/log/redis" \
     REDIS_CONF="/etc/redis.conf"

RUN  apk update               && \
     apk upgrade              && \
     apk add "redis~=5.0.7"   && \
     sed -i 's/^bind .*/bind 0.0.0.0/'      $REDIS_CONF && \
     sed -i 's/^daemonize .*/daemonize no/' $REDIS_CONF && \
     chown -R redis. $REDIS_DIRS

CMD ["redis-server"]
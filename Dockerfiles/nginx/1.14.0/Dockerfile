FROM statemood/alpine:3.8

COPY files  /

RUN apk update		&& \
    apk upgrade		&& \
    apk add "nginx~=1.14.0"   && \
    chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
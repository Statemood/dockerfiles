FROM statemood/alpine:3.7

COPY job.sh         /

RUN apk update		&& \
    apk upgrade		&& \
    pi="mirrors.aliyun.com"             && \
    ps="http://$pi/pypi/simple"         && \
    args="-i $ps --trusted-host=$pi"    && \
    apk add "python3~=3.6.3" py3-pip jq && \
    chmod 755 /job.sh                   && \
    pip3 install --upgrade pip $agrs
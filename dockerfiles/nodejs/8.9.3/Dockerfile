FROM statemood/alpine:3.7

COPY job.sh                            /
RUN  apk update                     && \
     apk upgrade                    && \
     chmod 755 /job.sh              && \
     apk add "nodejs~=8.9.3"        && \
     cd /usr/lib && npm i cross-env
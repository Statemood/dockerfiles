FROM statemood/alpine:edge

RUN  apk update                 && \
     apk upgrade                && \
     apk add "nodejs~=8.12.0"   && \
     apk add "npm~=8.12.0"      && \
     cd /usr/lib && npm i cross-env
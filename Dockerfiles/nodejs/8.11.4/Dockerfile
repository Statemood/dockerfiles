FROM statemood/alpine:3.8

RUN  apk update     && \
     apk upgrade    && \
     apk add "nodejs~=8.11.4"   && \
     apk add "npm~=8.11.4"      && \
     cd /usr/lib && npm i cross-env
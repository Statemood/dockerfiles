# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM docker.io/alpine:3.7

COPY files    /

RUN  apk update         && \
     apk upgrade        && \
     apk add sudo curl  && \
     adduser www -D

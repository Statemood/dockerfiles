# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/alpine:3.7

LABEL MAINTAINER="Lin Ru <Lin.Ru@msn.com>"

COPY mongodb.yaml /etc
COPY run.sh       /

RUN  apk update                   && \
     apk upgrade                  && \
     apk add "mongodb~=3.4.10"    && \
     chmod 755 /run.sh            && \
     test -d /mongodb/data || mkdir -p /mongodb/data && \
     test -d /mongodb/log  || mkdir -p /mongodb/log  && \
     chown -R 1000:1000 /mongodb  

ENTRYPOINT ["/run.sh"]
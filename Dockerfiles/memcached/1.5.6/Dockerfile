# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/alpine:3.7

LABEL MAINTAINER="Lin Ru <Lin.Ru@msn.com>"

ADD run.sh    /
RUN apk upgrade                 && \
    apk update                  && \
    apk add "memcached~=1.5.6"  && \
    chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]

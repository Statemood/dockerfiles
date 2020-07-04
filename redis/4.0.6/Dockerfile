# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/alpine:3.7

LABEL Maintainer="Lin.Ru@msn.com"

COPY run.sh /

RUN  apk update             && \
     apk add "redis~=4.0.6" && \
     chmod -v 755 /run.sh

CMD ["/run.sh"]
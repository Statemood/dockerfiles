# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/jre:8u151

ENV   version=2.5.1
LABEL MAINTAINER="Lin Ru <Lin.Ru@msn.com>"

COPY run.sh     /
RUN  apk upgrade        && \
     chmod 755 /run.sh  && \
     curl -sL "https://search.maven.org/remote_content?g=io.zipkin.java&a=zipkin-server&v=$version&c=exec" -o zipkin.jar

ENTRYPOINT      ["/run.sh"]

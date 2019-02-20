# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/jre:8u191

COPY run.sh /

ENV  ES_VERSION="6.6.1"

RUN  apk update                             && \
     apk upgrade                            && \
     apk add bash coreutils sudo            && \
     v="$ES_VERSION"                        && \
     e="elasticsearch"                      && \
     adduser -D -g 1000 $e                  && \
     curl -jk https://artifacts.elastic.co/downloads/$e/$e-$v.tar.gz | \
     tar zxf -                              && \
     mv $e-$v $e                            && \
     rm -rfv $s/bin/*.bat $e/bin/*.exe      && \
     chown -R $e:$e /$e/config              && \
     chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
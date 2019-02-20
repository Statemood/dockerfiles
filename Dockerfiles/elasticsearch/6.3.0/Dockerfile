# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/jre:8u181

COPY run.sh /

ENV  ES_VERSION="6.3.0"

RUN  apk update                             && \
     apk upgrade                            && \
     apk add bash coreutils sudo            && \
     v="$ES_VERSION"                        && \
     e="elasticsearch"                      && \
     curl -jk https://artifacts.elastic.co/downloads/$e/$e-$v.tar.gz | \
     tar zxf -                              && \
     mv $e-$v $e                            && \
     rm -rfv $s/bin/*.bat $e/bin/*.exe      && \
     chmod 644 /$e/config/*                 && \
     chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/jre:8u151

COPY run.sh /

ENV   ES_VERSION="6.2.2"           \
     ES_RUN_USER="www"

RUN  apk update                 && \
     apk upgrade                && \
     apk add bash coreutils     && \
     curl -jk https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ES_VERSION.tar.gz      | \
     tar zxf -                  && \
     id $ES_RUN_USER            ||   adduser -D $ES_RUN_USER    && \
     mv elasticsearch-$ES_VERSION elasticsearch                 && \
     rm -rfv elasticsearch/bin/*.bat elasticsearch/bin/*.exe    && \
     chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
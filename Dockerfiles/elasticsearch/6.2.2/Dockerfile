# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/jre:8u151

COPY run.sh /

ENV  ES_VERSION="6.2.2"

RUN  apk upgrade    && \
     adduser -D www && \
     curl -jsk https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ES_VERSION.tar.gz | \
     tar zxf -      && \
     mv elasticsearch-$ES_VERSION elasticsearch && \
     chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]

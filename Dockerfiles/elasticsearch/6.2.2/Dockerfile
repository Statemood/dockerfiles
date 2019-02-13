# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/jre:8u181

COPY run.sh /
ENV  ES_RUN_USER    "www"

RUN  apk update                     && \
     apk upgrade                    && \
     apk add bash coreutils sudo    && \
     es_ver="6.2.2"                 && \
     e="elasticsearch"              && \
     curl -jk https://artifacts.elastic.co/downloads/$e/$e-$es_ver.tar.gz | \
     tar zxf -                                      && \
     id $ES_RUN_USER || adduser -D $ES_RUN_USER     && \
     mv $e-$es_ver $e                               && \
     rm -rfv $e/bin/*.bat $e/bin/*.exe              && \
     chmod 644 $e/config/*                          && \
     chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
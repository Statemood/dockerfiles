# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/jre:8u181

COPY run.sh /

ENV  ES_VERSION="6.5.3"

RUN  apk update                             && \
     apk upgrade                            && \
     apk add bash coreutils                 && \
     v="$ES_VERSION"                        && \
     e="elasticsearch"                      && \
     curl -jk https://artifacts.elastic.co/downloads/$e/$e-$v.tar.gz | \
     tar zxf -                              && \
     mv $e-$v $e                            && \
     rm -rfv $s/bin/*.bat $e/bin/*.exe      && \
     ES_PLUGIN_IK=$e-analysis-ik            && \
     /$e/bin/$e-plugin install                 \
     https://github.com/medcl/$ES_PLUGIN_IK/releases/download/v$v/$ES_PLUGIN_IK-$v.zip && \
     ES_CFG=$e/config                       && \
     chmod 644 $ES_CFG/*                    && \
     chmod 644 $ES_CFG/analysis-ik/*        && \
     chmod 755 $ES_CFG/analysis-ik          && \
     chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
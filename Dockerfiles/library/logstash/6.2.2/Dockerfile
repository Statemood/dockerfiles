# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/jre:8u151

LABEL MAINTAINER="Lin Ru <Lin.Ru@msn.com>"

ENV  ls_name="logstash-6.2.2"

COPY run.sh /

RUN  curl -jsk https://dl.rulin.me/elastic/logstash/$ls_name.tar.gz | \
     tar zxf -                  && \
     mv $ls_name logstash       && \
     rm -rf /logstash/bin/*.bat && \
     chmod 755 /run.sh          && \
     apk upgrade

ENTRYPOINT ["/run.sh"]

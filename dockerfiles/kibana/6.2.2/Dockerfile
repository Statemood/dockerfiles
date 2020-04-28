# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/centos:7

COPY run.sh /

RUN  yum update -y      && \
     yum clean all      && \
     chmod 755 /run.sh  && \
     curl -jsk https://dl.rulin.me/elastic/kibana/kibana-6.2.2-linux-x86_64.tar.gz | \
     tar zxf -          && \
     mv kibana-6.2.2-linux-x86_64 kibana

COPY kibana.yml /kibana/config

ENTRYPOINT ["/run.sh"]

# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/jre:8u151

COPY run.sh /

### Options 1 BEGIN
##  Get elasticsearch-6.2.2.tar.gz from your downloads server

RUN  apk upgrade    && \
     curl -jsk https://dl.rulin.me/elastic/elasticsearch/elasticsearch-6.2.2.tar.gz | \
     tar zxf -      && \
     mv elasticsearch-6.2.2 elasticsearch && \
     chmod 755 /run.sh

### Options 2 BEGIN
##  Copy elasticsearch-6.2.2.tar.gz to container
##  Uncomment the following commands to use

#COPY elasticsearch-6.2.2.tar.gz /
#RUN  apk upgrade                          && \
#     tar zxf /elasticsearch-6.2.2.tar.gz  && \
#     mv elasticsearch-6.2.2 elasticsearch && \
#     chmod 755 /run.sh

### Option 2 END

ENTRYPOINT ["/run.sh"]

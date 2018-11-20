# --------------------------------------------
# Created by Statemood, 2018.03.22
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/jre:8u151

LABEL MAINTAINER="Lin Ru <Lin.Ru@msn.com>"

COPY run.sh     /

RUN  apk update	                    && \
     apk upgrade	                && \
     n="sonarqube"                  && \
     v="7.1"                        && \
     curl -sLO https://sonarsource.bintray.com/Distribution/$n/$n-$v.zip && \
     unzip -q $n-$v.zip             && \
     mv $n-$v $n                    && \
     adduser sonar -D               && \
     chmod 755 /run.sh              && \
     apk add bash                   && \
     rm -rf $n/extensions $n/data $n-$v.zip && \
     chown -R sonar:sonar /$n

ENTRYPOINT ["/run.sh"]
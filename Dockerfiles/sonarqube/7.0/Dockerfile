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

ENV  S_NAME="sonarqube" S_VER="7.0"

RUN  curl -sLO https://sonarsource.bintray.com/Distribution/$S_NAME/$S_NAME-$S_VER.zip && \
     unzip -q $S_NAME-$S_VER.zip    && \
     mv $S_NAME-$S_VER $S_NAME      && \
     adduser sonar -D               && \
     chmod 755 /run.sh              && \
     apk add bash                   && \
     rm -rf $S_NAME/extensions $S_NAME/data $S_NAME-$S_VER.zip && \
     chown -R sonar:sonar /$S_NAME

ENTRYPOINT ["/run.sh"]

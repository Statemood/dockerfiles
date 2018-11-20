# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/jre:8u151

COPY run.sh /

RUN  apk update                 && \
     apk upgrade                && \
     apk add bash coreutils     && \
     v="0.8.1"                  && \
     c="cerebro"                && \
     curl -L https://github.com/lmenezes/$c/releases/download/v$v/$c-$v.tgz | \
     tar zxf -                  && \
     mv $c-$v $c                && \
     chown -R root:root $c      && \
     chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
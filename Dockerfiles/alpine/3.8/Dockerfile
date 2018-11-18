# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM docker.io/alpine:3.8

RUN  rs="https://mirrors.ustc.edu.cn/alpine/v3.8"   && \
     rf="/etc/apk/repositories"                     && \
     tz="Asia/Shanghai"                             && \
     echo "$rs/main/"        > $rf                  && \
     echo "$rs/community/"  >> $rf                  && \
     apk update                                     && \
     apk upgrade                                    && \
     apk add curl acl tzdata                        && \
     cp -rfv /usr/share/zoneinfo/$tz /etc/localtime && \
     echo "$tz" > /etc/timezone                     && \
     apk del tzdata 
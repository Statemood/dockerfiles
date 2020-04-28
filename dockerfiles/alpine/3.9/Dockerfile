# --------------------------------------------
# Created by Lin Ru, 2018.01.06
#            Lin.Ru@msn.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM alpine:3.9

RUN  rs="https://mirrors.ustc.edu.cn/alpine/v3.9"   && \
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
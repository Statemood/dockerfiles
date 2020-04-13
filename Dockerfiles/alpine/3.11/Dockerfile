# --------------------------------------------
# Created by Lin Ru, 2018.01.06
#            Lin.ru@msn.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM alpine:3.11

RUN  rs="https://mirrors.ustc.edu.cn/alpine/v3.11"  && \
     rf="/etc/apk/repositories"                     && \
     tz="Asia/Shanghai"                             && \
     echo -e "$rs/main/\n$rs/community/" > $rf      && \
     apk update                                     && \
     apk upgrade                                    && \
     apk add curl acl tzdata                        && \
     cp -rfv /usr/share/zoneinfo/$tz /etc/localtime && \
     echo "$tz" > /etc/timezone                     && \
     apk del tzdata 
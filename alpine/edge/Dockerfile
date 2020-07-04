# --------------------------------------------
# Created by Lin Ru, 2018.01.06
#            Lin.Ru@msn.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM alpine:edge

RUN  rs="https://mirrors.aliyun.com/alpine/edge"    && \
     rf="/etc/apk/repositories"                     && \
     tz="Asia/Shanghai"                             && \
     echo -e "$rs/main/\n$rs/community/" > $rf      && \
     apk update                                     && \
     apk upgrade                                    && \
     apk add curl acl tzdata                        && \
     cp -rfv /usr/share/zoneinfo/$tz /etc/localtime && \
     echo "$tz" > /etc/timezone                     && \
     apk del tzdata                                 
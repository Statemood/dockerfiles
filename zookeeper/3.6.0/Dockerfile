# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

FROM statemood/jre:1105

RUN apk update                               && \
    apk upgrade                              && \
    ZK=zookeeper                             && \
    ZK_USER=$ZK                              && \
    ZK_DIST=$ZK-3.6.0                        && \
    zk_file=apache-$ZK_DIST-bin.tar.gz       && \
    addgroup -g 567 $ZK_USER                 && \
    adduser $ZK_USER -G $ZK_USER -D -u 567   && \
    apk add bash                             && \
    curl -Os "https://mirrors.aliyun.com/apache/$ZK/$ZK_DIST/$zk_file" && \
    tar xzf $zk_file -C /opt                 && \
    rm -r "$zk_file"                         && \
    ln -s /opt/${zk_file%.tar*} /opt/$ZK     && \
    chown -R 567 /opt/$ZK/conf               && \
    rm -rf /opt/$ZK/CHANGES.txt                 \
    /opt/$ZK/README.txt                         \
    /opt/$ZK/NOTICE.txt                         \
    /opt/$ZK/CHANGES.txt                        \
    /opt/$ZK/README_packaging.txt               \
    /opt/$ZK/bin/*.cmd                          \
    /opt/$ZK/build.xml                          \
    /opt/$ZK/config                             \
    /opt/$ZK/contrib                            \
    /opt/$ZK/dist-maven                         \
    /opt/$ZK/docs                               \
    /opt/$ZK/ivy.xml                            \
    /opt/$ZK/ivysettings.xml                    \
    /opt/$ZK/recipes                            \
    /opt/$ZK/src                                \
    /opt/$ZK/$ZK_DIST.jar.*

# Copy configuration generator script to bin
COPY zkOk.sh zkMetrics.sh /opt/zookeeper/bin/
COPY run.sh /

RUN  ln -sv /opt/zookeeper/bin/*.sh /usr/bin    && \
     ln -sv /tmp /opt/zookeeper/logs            && \
     chmod 755 /opt/zookeeper/bin/*.sh /run.sh

CMD ["/run.sh"]
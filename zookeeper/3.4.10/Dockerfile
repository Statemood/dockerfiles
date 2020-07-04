FROM statemood/jre:8u181

RUN apk update                              && \
    apk upgrade                             && \
    apk add bash sudo                       && \
    ZK=zookeeper                            && \
    ZK_USER=$ZK                             && \
    ZK_DATA_DIR=/var/lib/$ZK/data           && \
    ZK_DATA_LOG_DIR=/var/lib/$ZK/log        && \
    ZK_LOG_DIR=/var/log/$ZK                 && \
    ZK_DIST=$ZK-3.4.10                      && \
    addgroup -g 567 $ZK_USER                && \
    adduser $ZK_USER -G $ZK_USER -D -u 567  && \
    mkdir /opt                              && \
    curl -Os "https://mirrors.aliyun.com/apache/$ZK/$ZK_DIST/$ZK_DIST.tar.gz" && \
    tar xzf "$ZK_DIST.tar.gz" -C /opt       && \
    rm -r "$ZK_DIST.tar.gz"                 && \
    ln -s /opt/$ZK_DIST /opt/$ZK            && \
    rm -rf /opt/$ZK/CHANGES.txt           \
    /opt/$ZK/README.txt                   \
    /opt/$ZK/NOTICE.txt                   \
    /opt/$ZK/CHANGES.txt                  \
    /opt/$ZK/README_packaging.txt         \
    /opt/$ZK/bin/*.cmd                    \
    /opt/$ZK/build.xml                    \
    /opt/$ZK/config                       \
    /opt/$ZK/contrib                      \
    /opt/$ZK/dist-maven                   \
    /opt/$ZK/docs                         \
    /opt/$ZK/ivy.xml                      \
    /opt/$ZK/ivysettings.xml              \
    /opt/$ZK/recipes                      \
    /opt/$ZK/src                          \
    /opt/$ZK/$ZK_DIST.jar.asc             \
    /opt/$ZK/$ZK_DIST.jar.md5             \
    /opt/$ZK/$ZK_DIST.jar.sha1         && \
    mkdir -p $ZK_DATA_DIR $ZK_DATA_LOG_DIR $ZK_LOG_DIR /usr/share/$ZK /tmp/$ZK /usr/etc/            && \
    chown -R "$ZK_USER:$ZK_USER" /opt/$ZK/conf $ZK_DATA_DIR $ZK_LOG_DIR $ZK_DATA_LOG_DIR /tmp/$ZK   && \
    ln -s  /opt/$ZK/conf/          /usr/etc/$ZK     && \
    ln -s  /opt/$ZK/$ZK_DIST.jar   /usr/share/$ZK/  && \
    ln -s  /opt/$ZK/lib/*          /usr/share/$ZK             

# Copy configuration generator script to bin
COPY zkGenConfig.sh zkOk.sh zkMetrics.sh /opt/zookeeper/bin/
COPY user-zookeeper-chown-dir /etc/sudoers.d/
COPY init-dir.sh /

RUN  ln -sv /opt/zookeeper/bin/*.sh /usr/bin    && \
     chmod 755 /opt/zookeeper/bin/*.sh /init-dir.sh 
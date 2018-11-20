FROM statemood/centos:7

LABEL MAINTAINER="Lin.Ru@msn.com"

COPY job.sh /

RUN yum makecache                                   && \
    yum update  -y                                  && \
    yum install -y make gcc zlib-devel glibc-devel     \
                   cpp glibc-headers libmpc            \
                   kernel-headers mpfr libgomp         \
                   openssl-devel                    && \
    ver="3.6.5"                                     && \
    pkg="Python-$ver"                               && \
    cd /tmp                                         && \
    curl -L https://www.python.org/ftp/python/$ver/$pkg.tgz |  \
    tar zxf -                                               && \
    cd $pkg                                                 && \
    LDFLAGS=-L/usr/lib64 CPPFLAGS=-I/usr/include               \
    ./configure --enable-ipv6  --with-ensurepip=install     && \
    make                        && \
    make install                && \
    rm -rf /tmp/*               && \
    chmod 755 /job.sh           && \
    pip3 install --upgrade pip
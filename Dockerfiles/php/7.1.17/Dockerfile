FROM statemood/alpine:3.7

LABEL MAINTAINER="Lin.Ru@msn.com"

ENV BUILD_TOOLS="m4 autoconf gcc g++ make file bash"  \
    PHP_LOG="/data/logs/php"                          \
    PHP_VERSION="7.1.17"                              \
    PHP_REDIS_V="3.1.4"                               \
    PHP_DEPS="libxml2 libxml2-dev openssl openssl-dev           \
              bzip2 bzip2-dev libcurl curl-dev re2c libevent    \
              libjpeg-turbo libjpeg-turbo-dev libpng libpng-dev \
              libevent-dev                                      \
              freetype freetype-dev readline readline-dev       \
              libmcrypt libmcrypt-dev libxslt libxslt-dev"
ENV PHP_REDIS="php7-redis~=$PHP_REDIS_V"                        \
    PHP_EXTS="bcmath bz2 calendar ctype curl dba dom exif       \
              fileinfo gd gettext gmp iconv json mbstring       \
              mcrypt mysqli pdo_mysql pdo_sqlite pcntl phar     \
              posix shmop simplexml soap sockets sqlite3        \
              sysvmsg sysvshm sysvsem tokenizer wddx opcache    \
              xml xmlreader xmlwriter xmlrpc xsl zip pear"      \
    PHP_PKGS="php7~=$PHP_VERSION php7-dev~=$PHP_VERSION php7-fpm~=$PHP_VERSION"

RUN apk update                                  && \
    apk upgrade                                 && \
    apk add $SYSTEM_CMDS                        && \
    apk add $PHP_DEPS $BUILD_TOOLS              && \
    apk add $PHP_PKGS $PHP_REDIS                && \
    for i in $PHP_EXTS;do apk add php7-$i;done  && \
    apk del $BUILD_TOOLS                        && \
    test -d "$PHP_LOG" || mkdir -p "$PHP_LOG"   && \
    rm -rf /t /tmp/*                            

COPY files /

ENV SYSTEM_CMDS=""  BUILD_TOOLS=""   PHP_PKGS=""   \
    PHP_REDIS_V=""  PHP_DEPS=""      PHP_REDIS=""  \
    PHP_EXTS=""
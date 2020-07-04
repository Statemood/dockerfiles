#! /bin/bash

# --------------------------------------------
# Created by Statemood, 2018.03.22
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

if [ -z "$@" ]
then
    v="$S_VER"
    u="sonar"
    h="/$S_NAME"

    export SONAR_HOME="$h"

    s="/data/$S_NAME"
    e="$s/extensions"
    d="$s/data"
    c="$s/conf"

    test -d $e || mkdir -p $e
    test -d $d || mkdir -p $d

    test -d $h/extensions   || ln -s $e $h/extensions
    test -d $h/data         || ln -s $d $h/data
    test -d $c              && rm -rf   $h/conf && ln -s $c $h/conf

    chown -R $u:$u $s

    su - "$u" -c "java -jar $SONARQUBE_WEB_JVM_OPTS $h/lib/sonar-application-$v.jar        \
    -Dsonar.log.console=true                         \
    -Dsonar.jdbc.username='$SONARQUBE_JDBC_USERNAME' \
    -Dsonar.jdbc.password='$SONARQUBE_JDBC_PASSWORD' \
    -Dsonar.jdbc.url='$SONARQUBE_JDBC_URL'"
else
    "$@"
fi

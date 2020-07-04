#! /bin/sh

# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

if [ -z "$@" ]
then
    zpk_args="STORAGE_TYPE=elasticsearch"
    zpk_args="$zpk_args ES_HOSTS=$ES_HOST:$ES_PORT"

    export $zpk_args
    java -jar $JAVA_OPTS /zipkin.jar
else
    "$@"
fi

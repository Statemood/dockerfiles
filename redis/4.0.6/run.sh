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
    config=/etc/redis.conf

    # Set bind address to '0.0.0.0'
    sed -i 's/^bind .*/bind 0.0.0.0/'       $config

    # Set daemonize to 'no'
    sed -i 's/^daemonize .*/daemonize no/'  $config

    # Start Redis Server
    redis-server $config
else
    "$@"
fi
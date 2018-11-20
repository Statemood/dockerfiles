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
    conf=/etc/redis.conf

    if [ -z "$REDIS_PASSWORD" ]
    then
        echo "Redis password auth is disabled"
    else
        echo "Redis password auth is ENABLED."

        echo "$REDIS_PASSWORD" | egrep -qi "enable|true|random|yes"
        if [ $? = 0 ]
        then
            REDIS_PASSWORD="`cat /dev/urandom | sed 's/[^a-zA-Z0-9]//g' | strings -n 12 | head -1`"
        fi
    
        echo "requirepass \"$REDIS_PASSWORD\"" >> $conf
    fi
    
    # Start Redis Server
    redis-server $conf
else
    "$@"
fi
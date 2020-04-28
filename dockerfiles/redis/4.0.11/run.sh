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
    pass=/var/lib/redis/password

    if [ -z "$REDIS_PASSWORD" ]
    then
        echo "Redis password auth is disabled"
    else
        echo "Redis password auth is ENABLED."
        if [ -f $pass ]
        then
            password="`cat $pass`"

            if [ -z "$password" ]
            then
                REDIS_PASSWORD="$password"
            fi
        fi

        echo "$REDIS_PASSWORD" | egrep -qi "enable|true|random|yes"
        if [ $? = 0 ]
        then
            REDIS_PASSWORD="`cat /dev/urandom | sed 's/[^a-zA-Z0-9]//g' | strings -n 12 | head -1`"
        fi

        echo "$REDIS_PASSWORD"                  > $pass
        echo "requirepass \"$REDIS_PASSWORD\"" >> $conf

    fi
    if [ "$REDIS_CLUSTER" = "true" ]
    then
        echo "Enable Cluster"
        echo 'cluster-enabled yes' >> $conf
    fi

    # Start Redis Server
    redis-server $conf
else
    "$@"
fi
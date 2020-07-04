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
    senc=/etc/redis-sentinel.conf
    pass=/var/lib/redis/password

    if [ ! -z "$REDIS_PASSWORD" ]
    then
        if [ -f $pass ]
        then
            password="`cat $pass`"

            test -z "$password" && REDIS_PASSWORD="$password"
        fi

        echo "$REDIS_PASSWORD"                  > $pass
        echo "requirepass \"$REDIS_PASSWORD\"" >> $conf

    fi

    if [ "$REDIS_CLUSTER" = "true" ]
    then
        ccf="cluster-config-file"
        ccp="/var/lib/redis/nodes.conf"
        echo 'cluster-enabled yes' >> $conf
        grep "^$ccf" -q $conf
        test $? = 0 && sed -i "s#$ccf.*#$ccf $ccp#" $conf || echo "$ccf $ccp" >> $conf
    fi

    test -z "$REDIS_MODE"            && REDIS_MODE="master"
    test -z "$REDIS_MASTER_SVC_HOST" && REDIS_MASTER_SVC_HOST="redis-master"
    test -z "$REDIS_MASTER_SVC_PORT" && REDIS_MASTER_SVC_PORT=6379

    echo "Start Redis with `echo $REDIS_MODE | tr a-z A-Z`"

    case $REDIS_MODE in
        cluster)
            # TD
            ;;
        master)
            redis-server $conf
            ;;
        slave)
            echo "masterauth $REDIS_PASSWORD"       >> $conf

            # See https://redis.io/topics/sentinel
            echo "slave-announce-ip `hostname -i`"  >> $conf

            redis-server $conf --slaveof $REDIS_MASTER_SVC_HOST $REDIS_MASTER_SVC_PORT
            ;;
        sentinel)
            test ! -z "$REDIS_PASSWORD" && echo "sentinel auth-pass mymaster $REDIS_PASSWORD" >> $senc

            sed -i "s/REDIS_MASTER_HOST/$REDIS_MASTER_SVC_HOST/" $senc
            sed -i "s/REDIS_MASTER_PORT/$REDIS_MASTER_SVC_PORT/" $senc

            # See https://redis.io/topics/sentinel
            echo "sentinel announce-ip `hostname -i`"         >> $senc

            redis-server $senc --sentinel --protected-mode no
            ;;
    esac
else
    "$@"
fi
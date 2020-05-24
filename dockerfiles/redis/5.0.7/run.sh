#! /bin/sh

# --------------------------------------------
# Created by Statemood, 2018.01.06
#            Lin.Ru@msn.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

test -z "$MYIP" && MYIP=`hostname -i`

sentinelProcess(){
    conf=/etc/redis.conf
    senc=/etc/redis-sentinel.conf

    test -z "$REDIS_MODE"               && REDIS_MODE=master
    test -z "$REDIS_MASTER_SVC_HOST"    && REDIS_MASTER_SVC_HOST=redis-master
    test -z "$REDIS_MASTER_SVC_PORT"    && REDIS_MASTER_SVC_PORT=6379

    test -z "$REDIS_SENTINEL_SVC_HOST"  && REDIS_SENTINEL_SVC_HOST=redis-sentinel
    test -z "$REDIS_SENTINEL_SVC_PORT"  && REDIS_SENTINEL_SVC_PORT=26379

    test -z "$REDIS_CLUSTER_NAME"       && REDIS_CLUSTER_NAME=mymaster

    # Who am I? What can I do?
    master_info="`redis-cli -i 3 -h $REDIS_SENTINEL_SVC_HOST -p $REDIS_SENTINEL_SVC_PORT info 2> /dev/null | \
                  grep $REDIS_CLUSTER_NAME      | \
                  awk -F ',' '{print $3}'       | \
                  awk -F '=' '{print $2}'`"

    if [ ! -z "$master_info" ]
    then
        REDIS_MASTER_SVC_HOST="`echo $master_info | awk -F ':' '{print $1}'`"
        REDIS_MASTER_SVC_PORT="`echo $master_info | awk -F ':' '{print $2}'`"

        if [ "${REDIS_MASTER_SVC_HOST}" != "$MYIP" ]
        then
            test "$REDIS_MODE" = "master" && REDIS_MODE=slave
        fi
    fi
}

if [ -z "$@" ]
then
    conf=/etc/redis.conf

    # Read password form environment variables.
    if [ ! -z "$REDIS_PASSWORD" ]
    then
        echo "Redis password auth is ENABLED."

        echo "masterauth  \"$REDIS_PASSWORD\"" >> $conf
        echo "requirepass \"$REDIS_PASSWORD\"" >> $conf
    fi

    echo "Start Redis with `echo $REDIS_MODE | tr a-z A-Z`"

    case $REDIS_MODE in
        cluster)
            ccp="/var/lib/redis/nodes.conf"
            echo "cluster-enabled yes"                  >> $conf
            echo "cluster-announce-ip $MYIP"            >> $conf
            echo "cluster-config-file $ccp"             >> $conf

            test -f $ccp && sed -i -e "/myself/ s/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/$MYIP/" $ccp

            echo -e "My self is $MYIP"

            redis-server $conf
            ;;
        master)
            sentinelProcess
            redis-server $conf
            ;;
        slave)
            sentinelProcess
            echo "masterauth \"$REDIS_PASSWORD\""       >> $conf

            # See https://redis.io/topics/sentinel
            echo "slave-announce-ip $MYIP"              >> $conf

            redis-server $conf --slaveof $REDIS_MASTER_SVC_HOST $REDIS_MASTER_SVC_PORT
            ;;
        sentinel)
            sentinelProcess
            test ! -z "$REDIS_PASSWORD" && \
                echo "sentinel auth-pass $REDIS_CLUSTER_NAME \"$REDIS_PASSWORD\"" >> $senc

            sed -i "s/REDIS_MASTER_HOST/$REDIS_MASTER_SVC_HOST/" $senc
            sed -i "s/REDIS_MASTER_PORT/$REDIS_MASTER_SVC_PORT/" $senc

            # See https://redis.io/topics/sentinel
            echo "sentinel announce-ip `hostname -i`"         >> $senc

            redis-server $senc --sentinel --protected-mode no
            ;;
        standard)
            redis-server $conf
            ;;
    esac
else
    "$@"
fi
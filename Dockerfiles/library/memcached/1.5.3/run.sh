#! /bin/sh

# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

    port=$MEMCACHED_PORT
 max_mem=$MEMCACHED_MAX_MEM
max_conn=$MEMCACHED_MAX_CONN

test -z "$port"     &&     port=11211
test -z "$max_mem"  &&  max_mem=64
test -z "$max_conn" && max_conn=1024

if [ -z "$@" ]
then
    echo "Start memceched with options: port $port, max mempry $max_mem, max connection $max_conn"
    memcached -m $max_mem -u nobody -p $port -c $max_conn
else
    "$@"
fi

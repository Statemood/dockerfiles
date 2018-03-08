#! /bin/sh

# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

    port="`env | grep MEMCACHED_PORT     | awk -F '=' '{print $2}'`"
 max_mem="`env | grep MEMCACHED_MAX_MEM  | awk -F '=' '{print $2}'`"
max_conn="`env | grep MEMCACHED_MAX_CONN | awk -F '=' '{print $2}'`"

test -z "$port"     &&     port=11211
test -z "$max_mem"  &&  max_mem=512
test -z "$max_conn" && max_conn=1024

if [ -z "$@" ]
then
    memcached -m $max_mem -u nobody -p $port -c $max_conn
else
    "$@"
fi

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
    test -z "$ETCD_NAME" && ETCD_NAME="default"

         ip="`hostname -i`"
    ld_2379="http://$ip:2379"
    ld_2380="http://$ip:2380"

    test -z "$ETCD_HOME" && ETCD_HOME="/var/lib/etcd"
    test -z "$ETCD_DATA" && ETCD_DATA="$ETCD_HOME/data"

    test -d "$ETCD_DATA" && ETCD_STATE="existing" || ETCD_STATE="new"

    echo "Start etcd server named: $ETCD_NAME, listening $ip"

    etcd  --name $ETCD_NAME                       \
          --data-dir $ETCD_DATA                   \
          --wal-dir  $ETCD_HOME/wal               \
          --listen-peer-urls $ld_2380             \
          --listen-client-urls $ld_2379           \
          --initial-advertise-peer-urls $ld_2380  \
          --initial-cluster "$ETCD_NAME=$ld_2380" \
          --initial-cluster-state "$ETCD_STATE"   \
          --initial-cluster-token 'etcd-cluster'  \
          --advertise-client-urls $ld_2379
else
    "$@"
fi
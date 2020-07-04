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
    # Run USER
    user="$ES_RUN_USER"
    name="elasticsearch"
    home="/data/$name"
     cmd="/$name/bin/$name"
     net="-Enetwork.host=0.0.0.0"

    # path.logs
     log="-Epath.logs=/$name/logs"
     cfd="/$name/config"
     cfg="$cfd/$name.yml"
    data="-Epath.data=$home"
    jvmf="$cfd/jvm.options"

    test -z "$JAVA_OPTS"        &&    JAVA_OPTS="-Xms1g -Xmx1g"
    test -z "$ES_NODE_NAME"     && ES_NODE_NAME="$HOSTNAME"
    test -n "$ES_CLUSTER_NAME"  &&       c_name="-Ecluster.name=$ES_CLUSTER_NAME"
    test -n "$ES_NODE_NAME"     &&       n_name="-Enode.name=$ES_NODE_NAME"
    test -n "$ES_NODE_DATA"     &&      es_data="-Enode.data=$ES_NODE_DATA"
    test -n "$ES_NODE_MASTER"   &&    es_master="-Enode.master=$ES_NODE_MASTER"
    test -n "$ES_HTTP_ENABLED"  &&      es_http="-Ehttp.enabled=$ES_HTTP_ENABLED"
    test -n "$ES_UNICAST_HOSTS" &&   ES_UNICAST="-Ediscovery.zen.ping.unicast.hosts=$ES_UNICAST_HOSTS"

    ES_OPTS="$c_name $n_name $es_data $es_master $es_http $ES_UNICAST"

    # Set jvm options to file jvm.options
    sed -i '/-Xm[sx].g/d' $jvmf

    for x in $JAVA_OPTS
    do
        echo "Set $x"
        echo $x >> $jvmf
    done

    test -d $home       || mkdir -p $home
    test -d /$name/logs || mkdir -p /$name/logs
    chown -R $user:$user $home /$name/logs $cfd

    es_cmd="$cmd $ES_JAVA_OPTS $log $data $net $ES_OPTS"
    echo "Start $name with cmd: $es_cmd"

    if [ "$K8S_ES_DEBUG" = "true" ]
    then
        echo "`date +'%F %T'`Waiting for debug, 600s"
        sleep 600
    fi

    sudo -u $user $es_cmd 
else
    "$@"
fi
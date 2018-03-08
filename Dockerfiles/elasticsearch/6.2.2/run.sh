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
    user="www"
    name="elasticsearch"
    home="/data/$name"
     cmd="/$name/bin/$name"
     net="-Enetwork.host=0.0.0.0"

    # path.logs
     log="-Epath.logs=/$name/logs"
    data="-Epath.data=$home"
    jvmf="/$name/config/jvm.options"

    test -z "$JAVA_OPTS"        &&    JAVA_OPTS="-Xms1g -Xmx1g"
    test -z "$ES_JAVA_OPTS"     && ES_JAVA_OPTS="$JAVA_OPTS"
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

    for x in $ES_JAVA_OPTS
    do
        echo "Set $x"
        echo $x >> $jvmf
    done

    test -d $home || mkdir -p $home
    chown -R $user:$user $home /$name/logs

    echo "Start $name with options: $ES_OPTS"

    su - $user -c "/bin/sh $cmd $log $data $net $ES_OPTS"
else
    "$@"
fi

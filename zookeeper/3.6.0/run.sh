#!/bin/sh

set -e

z=/opt/zookeeper

test -z "$ZK_CONF_DIR" && ZK_CONF_DIR=$z/conf
test -z "$ZK_DATA_DIR" && ZK_DATA_DIR=/data/zk
test -z "$ZK_REPLICAS" && ZK_REPLICAS=3

# Generate the config only if it doesn't exist
if [ ! -f $ZK_CONF_DIR/zoo.cfg ]
then
    conf=$ZK_CONF_DIR/zoo.cfg
    echo "Generate ZK config"
    {
        echo "dataDir=${ZK_DATA_DIR}"

        echo "tickTime=${ZK_TICK_TIME:-2000}"
        echo "initLimit=${ZK_INIT_LIMIT:-10}"
        echo "syncLimit=${ZK_SYNC_LIMIT:-5}"

        echo "autopurge.snapRetainCount=${ZK_SNAP_RETAIN_COUNT:-7}"
        echo "autopurge.purgeInterval=${ZK_PURGE_INTERVAL:-24}"
        echo "maxClientCnxns=${ZK_MAX_CLIENT_CNXNS:-20}"
        echo "reconfigEnabled=true"
        echo "standaloneEnabled=${ZK_STANDALONE_ENABLED:-false}"
        echo "admin.enableServer=${ZK_ADMINSERVER_ENABLED:-true}"
        echo "4lw.commands.whitelist=${ZK_4LW_COMMANDS_WHITELIST:-'ruok'}"
    } >> $conf

    count=0
    total=$ZK_REPLICAS

    let total--

    while true
    do
        s="server.$count=zk-$count.`hostname -d`:2888:3888;2181"
        echo "$s" >> $conf
        echo "$s"
        test $count = $total && break
        echo $((count++)) > /dev/null
    done
fi

# Write myid only if it doesn't exist
echo "${HOSTNAME##*-}" > $ZK_DATA_DIR/myid

echo '- - - - - - -= Zookeeper Configuration =- - - - - - -'
echo -e "myid: `cat $ZK_DATA_DIR/myid`\n"
cat $conf
echo '- - - - - - -= Zookeeper Configuration =- - - - - - -'

test -z "$@" && exec $z/bin/zkServer.sh start-foreground || exec "$@"
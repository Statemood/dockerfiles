#! /bin/bash

while true
do
    ping $REDIS_NAME-5.$SUB_DOMAIN -c 2 > /dev/null 2>&1
    test $? = 0 && break
    sleep 5
    echo -e "`date +'%F %T'` Waiting for last redis is ready"
done

members="`for i in {0..5}; do echo -n $(ping $REDIS_NAME-$i.$SUB_DOMAIN -c 1 | head -1 | awk -F '[()]' '{print $2}'):6379' ' ; done`"

expect <<EOF
spawn redis-cli -a $REDIS_PASSWORD --cluster create --cluster-replicas 1 $members
expect {
    "Can I set the above configuration?*"   { send "yes\n"  ; exp_continue  }
    "*All 16384 slots covered."             { exit 0                        }
}
EOF
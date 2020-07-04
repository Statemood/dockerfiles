#! /bin/bash

# --------------------------------------------
# Created by Lin Ru, 2018.01.06
#            Lin.Ru@msn.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

if [ -z "$@" ]
then
    ###############################################
    # NOTE: DO NOT include '/' in the PASSWORD!!! #
    ###############################################
    conf="/etc/mysql/my.cnf"
    mysql_default_password="X75b6bK68Zf3761"
    MYSQL_DATA_DIR="/data/mysql"
    MYSQL_SERVER_ID="$RANDOM"

    test -z "$MYSQL_RUN_OPTS"       && MYSQL_RUN_OPTS="--datadir=$MYSQL_DATA_DIR --user=mysql"
    test -z "$MYSQL_ROOT_PASSWORD"  && MYSQL_ROOT_PASSWORD="$mysql_default_password"

    if [ -d "$MYSQL_DATA_DIR/mysql" ] && [ -d "$MYSQL_DATA_DIR/sys" ]
    then
        echo "Exist MySQL data detected, loading... "
        chown -R $MYSQL_USER:$MYSQL_GROUP $MYSQL_DATA_DIR
    else
        irp="/usr/share/mysql/init.sql"
        ips="/tmp/mysql.init.sql"
        echo "Initial NEW MySQL"

        sed -i "s/MYSQL_SERVER_ID/$MYSQL_SERVER_ID/" $conf

        if [ "$MYSQL_RUN_ROLE" = "MM" ]
        then
            grep -q auto_increment_increment   $conf
            test $? = 1 && echo 'auto_increment_increment=2' >> $conf

            # Require Kubernetes STATEFULSET
            grep -q '^auto_increment_offset' $conf

            if [ $? = 1 ]
            then
                # set mm-0 offset=1, others to 2
                test ${HOSTNAME##*-} -gt 0 && offset=2 || offset=1
                echo "auto_increment_offset=$offset" >> $conf
            fi
        fi

        cp -rfv $irp $ips

        echo "Update MySQL root Password"

        sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/" $ips
        sed -i   "s/MYSQL_HC_PASSWORD/$MYSQL_HC_PASSWORD/"   $ips

        echo "Initial MySQL"
        mysqld --initialize-insecure --init-file=$ips $MYSQL_RUN_OPTS

        test $? = 0 || exit 1

        test -f $ips && rm -f $ips && echo "Removed $ips"
    fi

    echo "`date +'%F %T'` Start mysqld"
    exec mysqld --defaults-file=$conf --defaults-extra-file=/etc/my.extra.cnf
else
    exec "$@"
fi
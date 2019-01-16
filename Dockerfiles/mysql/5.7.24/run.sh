#! /bin/bash

# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

if [ -z "$@" ]
then
    ###############################################
    # NOTE: DO NOT include '/' in the PASSWORD!!! #
    ###############################################
    mysql_default_password="qwe123"

    test -f "$MYSQL_CONFIG_FILE"    && cp -fv "$MYSQL_CONFIG_FILE" /etc/my.cnf

    test -v MYSQL_RUN_USER       ||  MYSQL_RUN_USER="mysql"
    test -v MYSQL_RUN_GROUP      || MYSQL_RUN_GROUP="mysql"
    test -v MYSQL_DATA_DIR       ||  MYSQL_DATA_DIR="/var/lib/mysql"

    test -v MYSQL_ROOT_PASSWORD  || MYSQL_ROOT_PASSWORD="$mysql_default_password"

    test -d "$MYSQL_DATA_DIR/lost+found" && rm -rf "$MYSQL_DATA_DIR/lost+found"

    if [ "$MYSQL_ROLE" = "replica" ]
    then
        test -v MYSQL_SERVER_ID || MYSQL_SERVER_ID=2
        echo "Set Server ID to $MYSQL_SERVER_ID"
        sed -i "s/server-id .*/server-id = $MYSQL_SERVER_ID/" /etc/my.cnf 
    fi 

    if [ -d "$MYSQL_DATA_DIR/mysql" ] && [ -d "$MYSQL_DATA_DIR/sys" ]
    then
        echo "Exist mysql data detected, loading... "
        chown -R $MYSQL_RUN_USER:$MYSQL_RUN_GROUP $MYSQL_DATA_DIR
    else
        ips="/init.password.sql"

        echo "Initial new mysql"

        if [ ! -f $ips ]
        then
            echo "ERROR: File not found: $ips"
            exit 1
        fi

        echo "Replace MySQL password"

        sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/" $ips

        echo "Initial MySQL"
        mysqld --initialize-insecure \
               --user=$MYSQL_RUN_USER \
               --datadir=$MYSQL_DATA_DIR \
               --init-file=$ips

        test $? = 0 || exit 1

        test -f $ips && rm $ips && echo "Removed $ips"
    fi

    echo "Start mysqld"
    mysqld
else
    "$@"
fi
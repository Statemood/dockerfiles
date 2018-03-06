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
    if [ ! -z "$MYSQL_CONFIG_FILE" ]
    then
        test -f $MYSQL_CONFIG_FILE && cp -fv $MYSQL_CONFIG_FILE /etc/my.cnf
    fi

    d="/var/lib/mysql/mysql"

    test -d "$d" && chown -R mysql:mysql $d || /init-db.sh
    mysqld --user=mysql
else
    "$@"
fi

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
    ef="/etc/mongodb.yaml"
    lg="/mongodb/log"
    db="/mongodb/data"
    df="$db/$(basename $ef)"

    test -d "$db" || mkdir -p $db
    test -d "$lg" || mkdir -p $lg
    test -f $df && f="$df" || f="$ef"

    echo "Using config: $f"
    mongod -f $f
else
    "$@"
fi
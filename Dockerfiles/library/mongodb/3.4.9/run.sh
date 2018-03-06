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
    ef="/etc/mongodb.conf"
    df="/mongodb/$(basename $ef)"

    test -f $df && f="$df" || f="$ef"

    echo "Using config: $f"
    mongod -f $f
else
    "$@"
fi

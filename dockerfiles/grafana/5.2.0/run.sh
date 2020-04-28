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
    d="/grafana/data"

    p="$d/plugins"
    t="/var/lib/grafana"

    test -d $p || mkdir $p
    test -d $t || mkdir $t

    ln -s $p $t/plugins

    cd /grafana
    ./bin/grafana-server
else
    "$@"
fi
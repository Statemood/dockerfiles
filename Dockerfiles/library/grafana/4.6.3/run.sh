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
    d="/data/grafana"

    test -d "$d" && ln -sv $d /var/lib/grafana

    cd /grafana
    ./bin/grafana-server
else
    "$@"
fi

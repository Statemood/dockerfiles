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

    cfg="/kibana/config/kibana.yml"
    dir="/kibana"

    Keys="ES_PROT
          ES_HOST
          KIBANA_PORT"
    for key in $Keys
    do
        value="`env | grep \"$key=\" | awk -F '=' '{print $2}'`"
        sed -i "s/$key/$value/" $cfg
    done

    $dir/node/bin/node --no-warnings $dir/src/cli -c $cfg
else
    "$@"
fi

#! /bin/sh

if [ -z "$@" ]
then
    echo "Start nginx"

    test -d "/run/nginx" || mkdir -p /run/nginx

    nginx
else
    "$@"
fi 
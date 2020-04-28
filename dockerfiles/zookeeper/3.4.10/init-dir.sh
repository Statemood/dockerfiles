#! /bin/sh

h=/var/lib/zookeeper
d=$h/data
test -d $d || mkdir -p $d 
test -d $h && chown -Rv 567:567 $h
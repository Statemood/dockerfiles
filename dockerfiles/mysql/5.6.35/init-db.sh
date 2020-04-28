#! /bin/bash

# --------------------------------------------
# Created by Statemood, 2018.01.06
#            I.am.RuLin@gmail.com
#
# Project dockerfiles:
#    https://github.com/Statemood/dockerfiles
# --------------------------------------------

# MySQL default PASSWORD
m_p="KKxxmt2"

dbdir="/var/lib/mysql"

test -d "$dbdir/mysql" || mysql_install_db
chown -R mysql:mysql $dbdir

echo "Start MySQL Server"
su - mysql -s /bin/bash -c "mysqld &"

echo "Wait 5 seconds for MySQL start"
sleep 5

echo "Set password for root(defautl is: $m_p)"
mysqladmin -u root password $m_p

echo "Update privilege for root"
mysql -u root -p$m_p -e "grant all on *.* to root@'%' identified by '$m_p' with grant option;"

# Stop MySQL Server & Start MySQL Server
pid=`ps aux | grep "[m]ysql" | awk '{print $2}'`
kill -9 $pid

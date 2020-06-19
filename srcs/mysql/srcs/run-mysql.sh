nohup sh setup-mysql.sh &

telegraf --config /telegraf.conf &
sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
/usr/bin/mysql_install_db --user=mysql --datadir="/mysql"
/usr/bin/mysqld_safe --datadir="/mysql"
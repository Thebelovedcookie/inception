#!/bin/bash

echo -e "Starting MariaDB setup..."

if ! pgrep -x "mariadb" > /dev/null; then
    service mariadb start
else
    echo -e "MariaDB is already running."
fi

sleep 5

# init database with script sql
echo "Initialisation de la base de données..."
mysql -u root <<-EOSQL
    CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
    CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';
    FLUSH PRIVILEGES;
EOSQL


mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

echo -e "Starting MariaDB..."

exec mysqld_safe --defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf

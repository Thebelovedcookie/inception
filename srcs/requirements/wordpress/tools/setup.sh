#!/bin/bash

sleep 10

echo "blabla"

nc -z mariadb 3306

mysqladmin ping -h mariadb -u"$MYSQL_USER" -p"$MYSQL_PASSWORD"



wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root
wp theme install twentytwentyfour --activate --allow-root

php-fpm7.4 --nodaemonize
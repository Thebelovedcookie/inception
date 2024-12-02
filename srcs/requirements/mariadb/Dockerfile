FROM debian:11

RUN apt update && apt install -y mariadb-server

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql

COPY ./tools/init-db.sh /docker-entrypoint-initdb.d/init-db.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh

EXPOSE 3306

CMD ["/docker-entrypoint-initdb.d/init-db.sh"]

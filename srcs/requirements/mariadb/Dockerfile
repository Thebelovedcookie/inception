FROM debian:11
RUN apt update && apt install -y mariadb-server \
			&& systemctl start mariadb.service
WORKDIR /
# COPY <src> <dest> (files de dehors a mettre dedans)
CMD [bash]
ENV TEST="test"
EXPOSE 9000
# ARG
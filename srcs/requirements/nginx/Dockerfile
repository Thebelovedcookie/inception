FROM debian:11

#install nginx
RUN apt update && apt install nginx -y \
		&& apt clean && rm -rf /var/lib/apt/lists/*

#define work directories
WORKDIR /

#copy our conf on the default conf ?
COPY  ./conf/nginx.conf /etc/nginx/nginx.conf
COPY  ./tools/server.crt /etc/nginx/certs/server.crt
COPY  ./tools/server.key /etc/nginx/certs/server.key

#run nginx
CMD ["nginx", "-g", "daemon off;"]


ENV TEST="test"
EXPOSE 9000
# ARG

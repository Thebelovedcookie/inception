FROM debian:11

#install nginx
RUN apt update && apt install curl nginx -y \
		&& apt clean && rm -rf /var/lib/apt/lists/*

#define work directories
WORKDIR /

#copy our conf on the default conf ?
COPY  ./conf/nginx.conf /etc/nginx/nginx.conf
COPY  ./tools/42_inception.crt /etc/nginx/certs/42_inception.crt
COPY  ./tools/42_inception.key /etc/nginx/certs/42_inception.key

#run nginx
CMD ["nginx", "-g", "daemon off;"]


ENV TEST="test"
EXPOSE 443


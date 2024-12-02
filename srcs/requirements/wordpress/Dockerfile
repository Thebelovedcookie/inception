FROM debian:11

# Eviter les messages interactifs et optimiser apt
ENV DEBIAN_FRONTEND=noninteractive

# install depandancies

RUN apt update && apt install -y \
    php \
    php-fpm \
    php-mysql \
    mariadb-client \
    curl \
    wget \
    netcat \
    && apt clean && rm -rf /var/lib/apt/lists/*

#installer wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


# Installer WordPress
RUN mkdir -p /var/www/html && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz --strip-components=1 -C /var/www/html && \
    rm latest.tar.gz

COPY ./conf/wp-config.php /var/www/html
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
    
# Définir le répertoire de travail
WORKDIR /var/www/html

# Fixer les permissions (important pour éviter les problèmes d'accès)
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

#directory non existant a l'installation
RUN mkdir -p /run/php && chown www-data:www-data /run/php

# Exposer le port utilisé par PHP-FPM
EXPOSE 9000

COPY ./tools/setup.sh /var/www/html
RUN chmod +x /var/www/html/setup.sh

# CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]
CMD ["/var/www/html/setup.sh"]

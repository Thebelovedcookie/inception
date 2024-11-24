FROM debian:11

# Eviter les messages interactifs et optimiser apt
ENV DEBIAN_FRONTEND=noninteractive


# install depandancies
RUN apt update && apt install -y \
    php \
    php-fpm \
    php-mysql \
    curl \
    wget \
    && apt clean && rm -rf /var/lib/apt/lists/*

# Installer WordPress
RUN mkdir -p /var/www/html && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz --strip-components=1 -C /var/www/html && \
    rm latest.tar.gz

COPY ./conf/wp-config.php /var/www/html/wp-config.php

# Définir le répertoire de travail
WORKDIR /var/www/html

# Fixer les permissions (important pour éviter les problèmes d'accès)
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Exposer le port utilisé par PHP-FPM
EXPOSE 9000

# Copier un fichier de configuration personnalisé si nécessaire
# COPY php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

# Lancer PHP-FPM au démarrage
CMD ["php-fpm", "--nodaemonize"]
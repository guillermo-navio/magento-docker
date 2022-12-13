FROM php:8.1-fpm

COPY --from=composer /usr/bin/composer /usr/bin/composer

# Extensiones
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd bcmath ctype curl dom fileinfo iconv intl json mbstring openssl pcre pdo_mysql soap sockets sodium xmlwriter xsl zip

# Modo desarrollo
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

VOLUME /var/www
WORKDIR /var/www/html

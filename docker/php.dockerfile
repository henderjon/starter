# https://docs.docker.com/engine/reference/builder/
FROM php:8.1-fpm-alpine

WORKDIR /usr/src/myapp

RUN apk update
RUN apk add --no-cache build-base
RUN apk add --no-cache curl
RUN apk add --no-cache autoconf
RUN apk add --no-cache pkgconfig
RUN apk add --no-cache libmemcached-dev
RUN apk add --no-cache zlib-dev

# RUN pecl config-set php_ini "path/to/php.ini"

# PECL IGBINARY and REDIS
RUN pecl channel-update pecl.php.net;
RUN pecl install igbinary;
RUN pecl bundle redis && cd redis && phpize && ./configure --enable-redis-igbinary && make && make install;
RUN pecl bundle memcached && cd memcached && phpize && ./configure --enable-memcached-igbinary && make && make install;

# PHP EXT CONFIG
# RUN docker-php-ext-configure ...

# PHP EXT INSTALL
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql

# PHP EXT ENABLE
RUN docker-php-ext-enable igbinary
RUN docker-php-ext-enable redis
RUN docker-php-ext-enable memcached
RUN docker-php-ext-enable pdo_mysql

# LOAD CONFIGS
COPY ./conf/php /usr/local/etc/php

# LOAD APP
COPY ./myapp /usr/src/myapp

CMD [ "php", "./phpinfo.php" ]

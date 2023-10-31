ARG PHP_VERSION
FROM php:${PHP_VERSION}-fpm

RUN mkdir /usr/local/etc/php/pool.d/ && mkdir /www/

RUN apt-get update  && \
    apt-get install -y libzip-dev && \
    apt-get install -y libpng-dev && \
    apt-get install -y gdb && \
    apt-get install -y git && \
    apt-get install -y zsh && \
    apt-get install -y unzip && \
    apt-get install -y vim

RUN docker-php-ext-install pdo_mysql && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install gd && \
    docker-php-ext-install zip && \
    docker-php-ext-install pcntl && \
    docker-php-ext-install posix && \
    docker-php-ext-install exif && \
    docker-php-ext-install gettext

#---------------------------------------------
# COMPOSER
#---------------------------------------------
ARG INSTALL_COMPOSER=false
RUN if [ ${INSTALL_COMPOSER} = true ]; then \
    curl -s http://getcomposer.org/installer | php && \
    echo "export PATH=${PATH}:/var/www/vendor/bin" >> ~/.bashrc && \
    mv composer.phar /usr/local/bin/composer \
;fi

#---------------------------------------------
# PHP_XDEBUG
#---------------------------------------------

ARG INSTALL_XDEBUG=false
RUN if [ ${INSTALL_XDEBUG} = true ]; then \
    # Install the xdebug extension
    # https://xdebug.org/docs/compat
    # if [ $(php -r "echo PHP_MAJOR_VERSION;") = "8.1" ] || { [ $(php -r "echo PHP_MAJOR_VERSION;") = "7" ] && { [ $(php -r "echo PHP_MINOR_VERSION;") = "4" ] || [ $(php -r "echo PHP_MINOR_VERSION;") = "3" ] ;} ;}; then \
    #     pecl install xdebug-3.1.5; \
    # else \
    #     if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
    #         pecl install xdebug-2.5.5; \
    #     else \
    #         if [ $(php -r "echo PHP_MINOR_VERSION;") = "0" ]; then \
    #             pecl install xdebug-2.9.0; \
    #         else \
    #             pecl install xdebug-2.9.8; \
    #         fi \
    #     fi \
    # fi && \

    pecl install xdebug-3.1.5; \
    ln -s /usr/local/etc/php.conf/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini \
;fi

COPY ./conf.d/xdebug.ini /usr/local/etc/php/conf.d

#---------------------------------------------
# REDIS
#---------------------------------------------

ARG INSTALL_REDIS=false

RUN if [ ${INSTALL_REDIS} = true ]; then \
    printf "\n" | pecl install -o -f redis && \
    rm -rf /tmp/pear && \
    ln -s /usr/local/etc/php.conf/redis.ini /usr/local/etc/php/conf.d/redis.ini \
;fi
FROM php:8-fpm

COPY ./src /application
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /application

# "docker-compose"でBindしているため、"docker-compose exec"してもvendorの中身は見えないが
# "docker run"すれば、vendorの中にライブラリは存在します。
RUN apt-get update && apt-get install -y \
            git \
            zip \
            unzip \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && docker-php-ext-install pdo_mysql \
    && composer install 

RUN php artisan cache:clear \
     && php artisan config:clear \
     && php artisan route:clear \
     && php artisan view:clear
     
RUN chown -R www-data:www-data storage
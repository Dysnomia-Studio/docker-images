FROM debian:buster

RUN apt-get update
RUN apt install -y curl wget

RUN curl -sSL https://packages.sury.org/php/README.txt | bash -x
RUN apt-get update

# Apache2 server / PHP
RUN apt install -y apache2 php7.4-fpm php7.4-pgsql

# Apache modules
RUN a2enmod proxy_fcgi setenvif rewrite
RUN a2enconf php7.4-fpm

COPY ./apache-server/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./apache-server/start.sh /start.sh

RUN chown -R www-data:www-data /var/www/

CMD ["bash","/start.sh"];
FROM debian:buster

RUN apt-get update
RUN apt install -y curl wget

RUN apt-get -y install apt-transport-https lsb-release ca-certificates curl
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

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
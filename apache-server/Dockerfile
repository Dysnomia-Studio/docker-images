FROM debian:buster

RUN apt-get update
RUN apt install -y curl wget

RUN curl -sSL https://packages.sury.org/php/README.txt | bash -x
RUN apt-get update

# Apache2 server / Certbot SSL Tool / User tools
RUN apt install -y apache2 php7.4-fpm php-pgsql

# Apache modules
RUN a2enmod proxy_fcgi setenvif
RUN a2enconf php7.4-fpm

COPY ./apache-server/000-default.conf /etc/apache2/sites-available/000-default.conf

CMD ["bash","start.sh"];
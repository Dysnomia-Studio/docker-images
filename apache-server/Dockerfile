FROM debian:12

RUN apt-get update
RUN apt install -y curl wget

RUN apt-get -y install apt-transport-https lsb-release ca-certificates curl
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

RUN apt-get update

# Apache2 server / PHP
RUN apt install -y apache2 php8.3-fpm php8.3-pgsql

# Apache modules
RUN a2enmod proxy_fcgi setenvif rewrite
RUN a2enconf php8.3-fpm

COPY ./apache-server/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./apache-server/security.conf /etc/apache2/conf-available/security.conf
COPY ./apache-server/start.sh /start.sh

RUN chmod +x /start.sh

RUN chown -R www-data:www-data /var/www/

RUN sed -i s/\;clear_env\ \=\ no/clear_env\ \=\ no/ /etc/php/8.3/fpm/pool.d/www.conf

RUN apt-get install -y curl
HEALTHCHECK --interval=5m --timeout=3s CMD service apache2 status && service php8.3-fpm status && curl -f http://localhost/ || exit 1

CMD ["bash", "/start.sh"]

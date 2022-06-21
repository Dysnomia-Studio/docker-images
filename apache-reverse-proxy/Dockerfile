FROM debian:buster

RUN apt-get update

# Apache2 server / Certbot SSL Tool / User tools
RUN apt install -y apache2 wget nano curl

# Apache modules
RUN a2enmod headers
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod proxy_wstunnel
RUN a2enmod cache_disk
RUN a2enmod http2

HEALTHCHECK --interval=5m --timeout=3s CMD service apache2 status && curl -f http://localhost/ || exit 1
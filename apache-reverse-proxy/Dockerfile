FROM debian:buster

RUN apt-get update

# Apache2 server / Certbot SSL Tool / User tools
RUN apt install -y apache2 certbot nano

# Apache modules
RUN a2enmod headers
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod proxy_wstunnel
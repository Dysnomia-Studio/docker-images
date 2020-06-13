FROM debian:buster

RUN apt-get update

# Apache2 server / Certbot SSL Tool / User tools
RUN apt install -y apache2 certbot nano

# Apache modules
RUN a2enmod proxy
RUN a2enmod rewrite
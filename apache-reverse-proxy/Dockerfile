FROM debian:buster

RUN apt-get update

# Apache2 server / Certbot SSL Tool / User tools
RUN apt install -y apache2 wget nano

# Apache modules
RUN a2enmod headers
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod proxy_wstunnel

# Certbot
RUN wget https://dl.eff.org/certbot-auto
RUN mv certbot-auto /usr/local/bin/certbot-auto
RUN chown root /usr/local/bin/certbot-auto
RUN chmod 0755 /usr/local/bin/certbot-auto
#!/bin/bash

service apache2 start
service php7.4-fpm start

tail -F /var/www/logs/error.log
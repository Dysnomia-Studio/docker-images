#!/bin/bash

service apache2 start
service php8.3-fpm start

tail -F /var/www/logs/error.log
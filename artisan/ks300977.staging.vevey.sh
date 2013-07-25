#!/bin/bash

cd /var/www/vhosts/antoniocarlosribeiro.com/vevey.com.br/staging/ 

php artisan store:notifications --env=staging

#!/bin/bash

cd /var/www/vevey 

php artisan store:notifications --env=development

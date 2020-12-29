#!/bin/bash

cd /var/www/adachin

php artisan migrate  --force
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear

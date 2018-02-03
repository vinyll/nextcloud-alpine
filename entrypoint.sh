#!/usr/bin/env sh

./occ maintenance:install --admin-user=admin --admin-pass=admin --data-dir=/data
php -S 0.0.0.0:8080

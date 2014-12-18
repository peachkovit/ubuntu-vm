#!/bin/bash

echo "==> Adding extra apt repositories"
apt-get -y install software-properties-common

# git
add-apt-repository -y ppa:git-core/ppa

# nginx
echo deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx > /etc/apt/sources.list.d/nginx-mainline.list
echo deb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx >> /etc/apt/sources.list.d/nginx-mainline.list
wget --quiet -O - http://nginx.org/keys/nginx_signing.key | apt-key add -

# postgresql
echo deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main > /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# php 5.5
add-apt-repository -y ppa:ondrej/php5

# erlang & rabbitmq
echo deb http://packages.erlang-solutions.com/ubuntu trusty contrib > /etc/apt/sources.list.d/erlang.list
wget --quiet -O - http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | apt-key add -

echo deb http://www.rabbitmq.com/debian/ testing main > /etc/apt/sources.list.d/rabbitmq.list
wget --quiet -O - http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add -

apt-get -y update

echo "==> Installing some software"
apt-get -y install git dos2unix gdebi-core htop

source /etc/profile.d/rvm.sh
rvm install ruby-2.1 --default
rvm use --default ruby-2.1

gem install fpm

reboot
sleep 60

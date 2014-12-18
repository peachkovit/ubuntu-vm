#!/bin/bash

# rvm and ruby
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable
usermod -aG rvm vagrant
usermod -aG rvm root

reboot
sleep 60

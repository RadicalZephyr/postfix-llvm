#!/usr/bin/env bash

# Setup dotfiles, and the build folder as the vagrant user
cd ~

wget https://github.com/RadicalZephyr/home/archive/master.zip

unzip master.zip

shopt -s dotglob

mv -vn home-master/* ./
mv -vn home-master/.ssh/* .ssh/

shopt -u dotglob

mkdir -p postfix-build
cd postfix-build

cmake /vagrant

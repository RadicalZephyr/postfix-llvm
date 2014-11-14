#!/usr/bin/env bash

apt-get update

# General development dependencies
apt-get install -y cmake build-essential

# Install llvm libraries
apt-get install -y llvm llvm-dev llvm-runtime

# Install clang compiler
apt-get install -y clang


# Setup my personal configuration files
apt-get install -y unzip

pushd ~ >/dev/null 2>&1

wget https://github.com/RadicalZephyr/home/archive/master.zip

unzip master.zip

shopt -s dotglob

mv -vn home-master/* ./
mv -vn home-master/.ssh/* .ssh/

shopt -u dotglob

popd >/dev/null 2>&1

# Setup the build folder as the vagrant user
su vagrant

mkdir -p postfix-build
cd postfix-build

cmake /vagrant

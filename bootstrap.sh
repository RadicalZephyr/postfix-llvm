#!/usr/bin/env bash

apt-get update

# General development dependencies
apt-get install -y cmake build-essential

# Install llvm libraries
apt-get install -y llvm-3.5 llvm-3.5-dev llvm-3.5-doc llvm-3.5-examples llvm-3.5-runtime llvm-3.5-tools

# Install clang compiler
apt-get install -y clang-3.5 clang-3.5-doc clang-3.5-examples


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

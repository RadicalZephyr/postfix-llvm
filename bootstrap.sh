#!/usr/bin/env bash

set -e

apt-get update

# General development dependencies
apt-get install -y cmake build-essential unzip gnupg

mkdir -p llvm-build
cd llvm-build

# Download llvm sources
wget http://llvm.org/releases/3.5.0/llvm-3.5.0.src.tar.xz
wget http://llvm.org/releases/3.5.0/llvm-3.5.0.src.tar.xz.sig

# Verify llvm sources
gpg --verify llvm-3.5.0.src.tar.xz.sig llvm-3.5.0.src.tar.xz || exit 1

tar xf llvm-3.5.0.src.tar.xz

# Rename to a more sane name
mv llvm-3.5.0.src llvm-3.5

# Download clang
wget http://llvm.org/releases/3.5.0/cfe-3.5.0.src.tar.xz
wget http://llvm.org/releases/3.5.0/cfe-3.5.0.src.tar.xz.sig

# Verify clang sources
gpg --verify cfe-3.5.0.src.tar.xz.sig cfe-3.5.0.src.tar.xz || exit 1

tar xf cfe-3.5.0.src.tar.xz -C llvm-3.5/tools

# Rename to a sane thing for building
mv llvm-3.5/tools/cfe-3.5.0.src llvm-3.5/tools/clang


# Do the actual build via cmake
mkdir build
cd build

cmake ../llvm-3.5 -G 'Unix Makefiles' -DCMAKE_INSTALL_PREFIX:PATH=/usr

make && make install

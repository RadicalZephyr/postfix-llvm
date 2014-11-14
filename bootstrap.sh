#!/usr/bin/env bash

cat >> /etc/apt/sources.list <<EOF
deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty main
deb-src http://llvm.org/apt/trusty/ llvm-toolchain-trusty main
# 3.4
deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.4 main
deb-src http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.4 main
# 3.5
deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.5 main
deb-src http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.5 main
EOF

wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | apt-key add -

apt-get update

# General development dependencies
apt-get install -y cmake build-essential

# Install llvm libraries
apt-get install -y libllvm3.4 libllvm3.4-dbg lldb-3.4 llvm-3.4 llvm-3.4-dev llvm-3.4-doc llvm-3.4-examples llvm-3.4-runtime  lldb-3.4-dev

# Install clang compiler
apt-get install -y clang-3.4 clang-3.4-doc libclang-common-3.4-dev libclang-3.4-dev libclang1-3.4 libclang1-3.4-dbg

# Other clang based tools
apt-get install -y clang-modernize-3.4 clang-format-3.4

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

#!/usr/bin/env bash

apt-get update

# General development dependencies
apt-get install -y cmake build-essential

# Install llvm libraries
apt-get install -y llvm-3.5 llvm-3.5-dev llvm-3.5-doc llvm-3.5-examples llvm-3.5-runtime llvm-3.5-tools

# Install clang compiler
apt-get install -y clang-3.5 clang-3.5-doc clang-3.5-examples

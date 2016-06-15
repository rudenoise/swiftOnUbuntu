#!/bin/bash

set -e

# get the gz
wget https://swift.org/builds/swift-3.0-preview-1/ubuntu1510/swift-3.0-preview-1/swift-3.0-preview-1-ubuntu15.10.tar.gz
# get the sig
wget https://swift.org/builds/swift-3.0-preview-1/ubuntu1510/swift-3.0-preview-1/swift-3.0-preview-1-ubuntu15.10.tar.gz.sig

# get the gpg keys
gpg --keyserver hkp://pool.sks-keyservers.net \
      --recv-keys \
      '7463 A81A 4B2E EA1B 551F  FBCF D441 C977 412B 37AD' \
      '1BE1 E29A 084C B305 F397  D62A 9F59 7F4D 21A5 6D5F' \
      'A3BA FD35 56A5 9079 C068  94BD 63BC 1CFE 91D3 06C6'

# refresh the keys
gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift

# gpg verify
gpg --verify swift-3.0-preview-1-ubuntu15.10.tar.gz.sig swift-3.0-preview-1-ubuntu15.10.tar.gz

# extract
tar -zxvf swift-3.0-preview-1-ubuntu15.10.tar.gz

# tidy
rm swift-3.0-preview-1-ubuntu15.10.tar.*

# add dependencies
sudo apt-get install -y git cmake ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config libblocksruntime-dev

# setup vim
./vim.sh

# move tools and add to path
mv swift-3.0-preview-1-ubuntu15.10/usr ~/swift
rm -fr swift-3.0-preview-1-ubuntu15.10

echo "PATH=$PATH:~/swift/bin" >> ~/.bashrc

#!/bin/bash

# Ensure to exit on all kinds of errors
set -eu
set -o pipefail

echo Compiling inside docker
docker run -v $TRAVIS_BUILD_DIR/travis-build:/scripts -v $(pwd)/hyperscan:/tmp/hyperscan -it centos:centos7 /bin/bash -ci /scripts/docker-script.sh

cd hyperscan/build
echo Replacing library in git repository
mkdir -p $TRAVIS_BUILD_DIR/src/main/resources/linux-x86-64
cp lib/libhs.so $TRAVIS_BUILD_DIR/src/main/resources/linux-x86-64

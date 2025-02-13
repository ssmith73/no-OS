#!/bin/bash

set -e

sudo apt-get update

. ./ci/travis/lib.sh

build_astyle() {
    . ./ci/travis/astyle.sh
}

build_cppcheck() {
    . ./ci/travis/cppcheck.sh
}

build_ad9361_generic() {
    sudo apt-get install libmatio-dev
    make -C ./ad9361/sw -f Makefile.generic
}

build_ad9361_linux() {
    sudo apt-get install libmatio-dev
    make -C ./ad9361/sw -f Makefile.linux
}

build_drivers() {
    sudo apt-get install gcc-arm-none-eabi libnewlib-arm-none-eabi
    make -C ./drivers -f Makefile
}

build_${BUILD_TYPE}

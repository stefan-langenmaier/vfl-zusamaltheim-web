#!/bin/bash

set +e
set +x

# is the generator installed
if [[ ! -d ./scripts/hugo ]] ; then
    mkdir ./scripts/hugo
    cd ./scripts
    ARCH=$(uname -m)
    if [[ $ARCH = "x86_64" ]] ; then
        wget "https://github.com/gohugoio/hugo/releases/download/v0.51/hugo_0.51_Linux-64bit.tar.gz"
    else
        wget "https://github.com/gohugoio/hugo/releases/download/v0.51/hugo_0.51_Linux-ARM.tar.gz"
    fi
    tar xvf hugo*.tar.gz  -C ./hugo
    cd ..
fi

# build the site
./scripts/hugo/hugo

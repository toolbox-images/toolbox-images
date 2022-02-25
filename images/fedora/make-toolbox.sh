#!/bin/bash

VERSION=${1:-36}

if [ ! -f Dockerfile ]; then
    if [ ! -d fedora-toolbox ]; then
        git clone https://src.fedoraproject.org/container/fedora-toolbox.git
    fi
    cd fedora-toolbox
    if [ -n "$1" -a "0$1" -lt 36 ]; then
        git switch f$VERSION
    else
        git switch rawhide
    fi
fi
podman pull fedora:$VERSION
# remove dnf clean
# todo: check if image exists
buildah bud -t fedora-toolbox:$VERSION

n=0
while podman container exists fedora-toolbox-$VERSION$SUFFIX; do
    ((n++))
    SUFFIX=".$n"
done
toolbox create -i localhost/fedora-toolbox:$VERSION -c fedora-toolbox-$VERSION$SUFFIX

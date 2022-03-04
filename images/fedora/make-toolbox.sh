#!/bin/bash

set -e

if [ $# -eq 0 ]; then
    echo "please specify fedora release number"
    exit 1
fi

VERSION=$1

case $PWD in
    */fedora-toolbox)
        git pull
        ;;
    *)
        if [ ! -d fedora-toolbox ]; then
            git clone https://src.fedoraproject.org/container/fedora-toolbox.git
            cd fedora-toolbox
        else
            cd fedora-toolbox
            git pull
        fi
        ;;
esac
if git rev-parse --quiet --verify origin/f$VERSION; then
    git switch f$VERSION
else
    git switch rawhide
fi
podman pull $(grep FROM Dockerfile | sed -e 's/FROM //')
# remove dnf clean
# todo: check if image exists
buildah bud -t fedora-toolbox:$VERSION

set +e
n=0
while podman container exists fedora-toolbox-$VERSION$SUFFIX; do
    ((n++))
    SUFFIX=".$n"
done
toolbox create -i $(podman image list --filter reference=fedora-toolbox:$VERSION --format '{{.ID}}') -c fedora-toolbox-$VERSION$SUFFIX

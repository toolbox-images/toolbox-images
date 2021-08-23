#!/bin/sh

if [ ! -f Dockerfile ]; then
  git clone https://src.fedoraproject.org/container/fedora-toolbox.git
  cd fedora-toolbox
fi
podman pull fedora:36
# remove dnf clean
# todo: check if image exists
buildah bud -t fedora-toolbox:36

# todo: check if container exists
toolbox create -i localhost/fedora-toolbox:36 -c fedora-toolbox-36

#!/bin/sh

if [ ! -f Dockerfile ]; then
  git clone https://src.fedoraproject.org/container/fedora-toolbox.git
  cd fedora-toolbox
fi
podman pull fedora:36
# remove dnf clean
buildah bud -t fedora-toolbox:36

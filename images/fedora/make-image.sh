#!/bin/sh

git clone https://src.fedoraproject.org/container/fedora-toolbox.git

cd fedora-toolbox

buildah bud -t fedora-toolbox:36

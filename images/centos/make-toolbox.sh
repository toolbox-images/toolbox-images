#!/bin/sh

VERSION=${1:-stream8}

toolbox create --image quay.io/centos/centos:$VERSION

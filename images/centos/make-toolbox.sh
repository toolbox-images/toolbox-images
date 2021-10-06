#!/bin/sh

VERSION=${1:-stream8}

toolbox create --image centos:$VERSION

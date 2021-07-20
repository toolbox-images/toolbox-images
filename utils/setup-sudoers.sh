#!/bin/sh

CONTAINER=$1

# container needs to be running already
podman copy ../etc/sudoers.d/wheel-nopasswd $CONTAINER:/etc/sudoers.d/wheel-nopasswd

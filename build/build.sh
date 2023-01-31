#!/bin/bash

IMAGE_TAG=${IMAGE_TAG:-latest}
IMAGE_NAME=ubuntu-binary-neutron-openvswitch-agent-yoga-aarch64

if ! command -v docker --version &> /dev/null
then
    echo docker must be installed
    exit 1
fi
if [ $(uname -i) = "aarch64" ]
then
    docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
else
    if ! command -v qemu-aarch64-static &> /dev/null
    then
        echo qemu-user-static and binfmt-support ust be installed
        exit 1
    fi

    if ! command -v docker buildx ls &> /dev/null
    then
        echo docker buildx must be installed
        exit 1
    fi
    docker buildx build --platform linux/arm64 -t ${IMAGE_NAME}:${IMAGE_TAG} .
fi


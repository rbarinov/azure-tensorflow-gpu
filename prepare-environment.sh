#!/bin/bash

mkdir training

docker run \
    --runtime=nvidia \
    --name tensorflow \
    -u $(id -u):$(id -g) \
    -p 6006:6006 \
    -p 8888:8888 \
    -v $(pwd)/training:/training \
    --workdir /training \
    rbarinov/tensorflow:latest-gpu-py3-jupyter \
    echo "Complete"

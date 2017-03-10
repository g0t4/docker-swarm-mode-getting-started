#!/bin/bash

command=$@

set -x
for host in 201 211 212 213; do
    export DOCKER_HOST=192.168.99.$host
    eval $command
done

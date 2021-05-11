#!/bin/bash
set -e
set -o pipefail

docker login -u="$DOCKER_PRO_REGISTRY_USER" -p="$DOCKER_PRO_REGISTRY_PASSWORD" docker.seadrive.org
docker pull docker.seadrive.org/seafileltd/seafile-pro-mc:latest
docker tag docker.seadrive.org/seafileltd/seafile-pro-mc:latest ngxq/seafile-pro-mc:latest
# refer: https://docs.travis-ci.com/user/docker/#branch-based-registry-pushes
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push ngxq/seafile-pro-mc:latest
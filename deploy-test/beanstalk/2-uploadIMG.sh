#!/bin/bash

echo ""
# GIT tags
GIT_SHORT_SHA=$(git rev-parse --short HEAD)
GIT_DESCRIBE=$(git describe --tags $GIT_SHOR_SHA)
GIT_TAG=$(git describe --tags --abbrev=0)
GIT_TAG_SHA=$(git describe --tags)
IMG_VER=$GIT_TAG"-"$GIT_SHORT_SHA
echo "Currrnt IMAGE VERSION is : "$IMG_VER
echo ""

# quay.io registry
DOCKER_REGISTRY="quay.io"
DOCKER_IMAGE="{image}:{tag}"
echo ""


# upload 'gateway' image to registry
docker push $DOCKER_REGISTRY/$DOCKER_IMAGE:$IMG_VER


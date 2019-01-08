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

cd $(dirname "${BASH_SOURCE[0]}")
DIR=$(pwd)
# echo $DIR

EB_RollingUpdate () {
    AWS_ENVIRONMENT=$1
    AWS_CMD="aws elasticbeanstalk update-environment \
            --environment-name $AWS_ENVIRONMENT \
            --version-label $AWS_ENVIRONMENT-$IMG_VER"
    docker run --rm -i -v $(pwd)/.aws:/root/.aws orbweb/aws:latest $AWS_CMD
}

set -x -e

# WEB

EB_RollingUpdate "{AWS_ENVIRONMENT_NAME}"

set +x +e
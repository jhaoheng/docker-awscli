#!/bin/bash

checkERR () {
    ret=$?; 
    if [[ 0 -ne $ret ]]; then 
        echo "ERROR AT : "$1; 
        # exit $ret; 
    fi
}

echo ""
# # GIT tags
# GIT_SHORT_SHA=$(git rev-parse --short HEAD);checkERR "GIT_SHORT_SHA"
# GIT_DESCRIBE=$(git describe --tags $GIT_SHOR_SHA);checkERR "GIT_DESCRIBE" 
# GIT_TAG=$(git describe --tags --abbrev=0);checkERR "GIT_TAG" 

# GIT_TAG_SHA=$(git describe --tags)
# IMG_VER=$GIT_TAG"-"$GIT_SHORT_SHA
IMG_VER="Not Set GIT-TAG"
echo "Currrnt IMAGE VERSION is : "$IMG_VER
echo ""

# quay.io registry
DOCKER_REGISTRY="quay.io"
DOCKER_IMAGE="{groupName}/{repoName}"
echo ""

ROOT_DIR=$(pwd)
echo $ROOT_DIR

buildIMG () {
    ORIGIN_APP=$1
    TMP_APP="tmp-$ORIGIN_APP"
    cp -R $ROOT_DIR/$ORIGIN_APP ./DeployIMG/$TMP_APP

    # build image
    docker build -t $DOCKER_REGISTRY/$GATEWAY_DOCKER_IMAGE:$IMG_VER -f {Dockerfile} .
    rm -rf ./DeployIMG/$TMP_APP
}


set -x -e
buildIMG "{your-app-folder-name}"
set +x +e


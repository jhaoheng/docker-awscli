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

S3BUCKET="{S3-BUCKET-NAME}"

CreateNew_EB_VERSION () {
    EB_APP_NAME="wow"
    APPLICATION_NAME=$1
    AWS_CMD="aws elasticbeanstalk create-application-version \
            --application-name $EB_APP_NAME \
            --version-label $APPLICATION_NAME-$IMG_VER \
            --source-bundle S3Bucket=$S3BUCKET,S3Key=$APPLICATION_NAME/versions/$IMG_VER.zip"
    docker run --rm -i -v $(pwd)/.aws:/root/.aws orbweb/aws:latest $AWS_CMD
}

echo "Create Elastic-beanstalk NEW VERSION"

set -x -e

CreateNew_EB_VERSION "{application-name}"

set +x +e
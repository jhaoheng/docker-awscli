#!/bin/bash

# AWS 變數名稱
S3BUCKET="{S3-BUCKET-NAME}"

echo ""
# GIT tags
GIT_SHORT_SHA=$(git rev-parse --short HEAD)
GIT_DESCRIBE=$(git describe --tags $GIT_SHOR_SHA)
GIT_TAG=$(git describe --tags --abbrev=0)
GIT_TAG_SHA=$(git describe --tags)
IMG_VER=$GIT_TAG"-"$GIT_SHORT_SHA
echo "Currrnt IMAGE VERSION is : "$IMG_VER
echo ""

DIR=$(pwd)
ZIP_FOLDER="s3Zip"

generateZIP () {
    Target=$1
    mkdir $DIR/$ZIP_FOLDER/$IMG_VER
    cp -R $DIR/buildConfig/$Target/Dockerrun.aws.json $DIR/$ZIP_FOLDER/$IMG_VER/Dockerrun.aws.json
    cd $DIR/$ZIP_FOLDER/$IMG_VER;
    zip -r $Target-confg-pkg.zip .
    mv $Target-confg-pkg.zip ..
    cd $DIR
    rm -rf $DIR/$ZIP_FOLDER/$IMG_VER
}

uploadToS3 () {
    APPLICATION_NAME=$1
    ZIP="$APPLICATION_NAME-confg-pkg.zip"
    AWS_CMD="aws s3 cp /tmp/$ZIP s3://$S3BUCKET/$APPLICATION_NAME/versions/$IMG_VER.zip"
    docker run --rm -i -v $(pwd)/.aws:/root/.aws -v $(pwd)/$ZIP_FOLDER:/tmp orbweb/aws:latest $AWS_CMD
}

set -e

generateZIP "{config-name}"

# Upload config to S3
echo ""
echo "Upload Config to S3"
uploadToS3 "{application-name}"

set +e
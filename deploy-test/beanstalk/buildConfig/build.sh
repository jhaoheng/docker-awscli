#!/bin/bash

CONFIG="sample"
# sample.json 變數參數
BUCKET_VAL="{S3-BUCKET-NAME}"
KEY_VAL="auth/amazon@quay.io"
DOCKER_IMAGE_VAL="{image}:{tag}"


echo "[Start build $CONFIG config]"

#
cd  $( dirname "${BASH_SOURCE[0]}")
DIR=$(pwd)

# DOCKERRUN FILE
TMP_DOCKERRUN_JSON=$DIR"/$CONFIG/sample.json"
DOCKERRUN_JSON=$DIR"/$CONFIG/Dockerrun.aws.json"


# SET jq ARG
ARG_BUCKET="BUCKET $BUCKET_VAL"
ARG_KEY="KEY $KEY_VAL"
ARG_DOCKERIMAGE="DOCKER_IMAGE $DOCKER_IMAGE_VAL"
JSON_DESCRIBE='.authentication.key=$KEY'
JSON_DESCRIBE=$JSON_DESCRIBE'|.authentication.bucket=$BUCKET'
JSON_DESCRIBE=$JSON_DESCRIBE'|.containerDefinitions[0].image=$DOCKER_IMAGE'


# Build Dockerrun.aws.json
docker run --rm -i stedolan/jq \
--arg $ARG_BUCKET \
--arg $ARG_KEY \
--arg $ARG_DOCKERIMAGE \
$JSON_DESCRIBE <$TMP_DOCKERRUN_JSON >$DOCKERRUN_JSON

cd - >> /dev/null
echo "...end"
echo ""
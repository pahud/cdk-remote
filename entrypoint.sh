#!/bin/bash

export AWS_REGION
export AWS_DEFAULT_REGION

REPO=$1
shift
CDK_CMD=$@

GIT_BASE_PATH=$(echo $REPO | cut -d/ -f1-3)
GIT_EXTEND_PATH=$(echo $REPO | cut -d/ -f4-)
GIT_REMOTE_URL="https://${GIT_BASE_PATH}.git"

echo "checking out $GIT_REMOTE_URL"
git clone $GIT_REMOTE_URL repo && \
cd repo/${GIT_EXTEND_PATH} && \
npm i && \
bash -c "cdk ${CDK_CMD}"

#!/bin/bash

WORKDIR=/tmp/workdir

# INPUT=pahud/cdk-samples/typescript
IFS='/' read -r -a myarray <<< "${INPUT}"

account="${myarray[0]}"
repo="${myarray[1]}"
repo_path="${myarray[2]}"
stack_name="${myarray[3]}"

echo "[INFO] Trying to CDK deploy $stack_name from $account/$repo/$repo_path"

git clone https://github.com/${account}/${repo}.git ${WORKDIR}/${repo}

cd ${WORKDIR}/${repo}/${repo_path}
npm install
npm run build
# echo "=> cdk list"
# cdk list
echo "=> cdk deploy $stack_name"
cdk deploy $stack_name
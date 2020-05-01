![Docker Image CI](https://github.com/pahud/cdk-remote/workflows/Docker%20Image%20CI/badge.svg) ![cdk-remote: Experimental](https://img.shields.io/badge/cdk--remote-experimental-important.svg?style=plastic)


# cdk-remote

`cdk-remote` is a docker image that helps you deploy AWS CDK apps without installing `aws-cdk CLI` at local or even without installing `npm` or `node`.

## Docker Image

`pahud/cdk-remote:latest`

## Example

create a `cdk-remote` shell script under your system `$PATH` and chmod +x it

```sh
#!/bin/bash

docker run -ti \
-e AWS_DEFAULT_REGION={AWS_DEFAULT_REGION-us-east-1} \
-e AWS_REGION=${AWS_REGION-${AWS_DEFAULT_REGION}} \
-v ${HOME}/.aws:/root/.aws pahud/cdk-remote $@
```

To deploy CDK application hosted on https://github.com/pahud/aws-cdk-serverless-sample

```bash
# view the diff before deployment
$ cdk-remote github.com/pahud/aws-cdk-serverless-sample diff
# deploy it
$ cdk-remote github.com/pahud/aws-cdk-serverless-sample deploy
```

To deploy the `EksStack` stack from https://github.com/pahud/cdk-samples/typescript

```bash
# view the diff before deployment
$ cdk-remote github.com/pahud/cdk-samples/typescript diff EksStack -c enable_stack=EksStack -c use_default_vpc=1
# deploy it
$ cdk-remote github.com/pahud/cdk-samples/typescript deploy EksStack -c enable_stack=EksStack -c use_default_vpc=1
```

To deploy the `Bottlerocket` stack with Amazon EKS cluster from https://github.com/pahud/cdk-samples/typescript

```bash
# view the diff before deployment
$ cdk-remote github.com/pahud/cdk-samples/typescript diff Bottlerocket -c enable_stack=Bottlerocket
# deploy it
$ cdk-remote github.com/pahud/cdk-samples/typescript deploy Bottlerocket -c enable_stack=Bottlerocket
```



## Security

Please note `cdk-remote` will mount your AWS credentials with `docker -v` into the docker container and deploy remote CDK apps on behalve of yourself to your AWS environment. Make sure you trust the remote application before deploying it.

# cdk-remote

`cdk-remote` is a docker image to help you deploy AWS CDK apps without installing `aws-cdk CLI` at local or even without `npm` or `node` required.

## Docker Image

`pahud/cdk-remote:latest`

## Example

```sh
# make 'cdk-remote' alias
$ alias cdk-remote="docker run -ti \
-e AWS_DEFAULT_REGION='ap-northeast-1' \
-e AWS_REGION=${AWS_REGION-${AWS_DEFAULT_REGION}} \
-v ${HOME}/.aws:/root/.aws pahud/cdk-remote"
```

To deploy CDK application hosted on https://github.com/pahud/aws-cdk-serverless-sample

```bash
$ cdk-remote github.com/pahud/aws-cdk-serverless-sample deploy
```

To deploy the `EksStack` from https://github.com/pahud/cdk-samples/typescript

```bash
# view the diff before deployment
$ cdk-remote github.com/pahud/cdk-samples/typescript diff EksStack
# deploy it
$ cdk-remote github.com/pahud/cdk-samples/typescript deploy EksStack
```


## Security

Please note `cdk-remote` will mount your AWS credentials with `docker -v` into the docker container and deploy remote CDK apps on behalve of yourself to your AWS environment. Make sure you trust the remote application before deploying it.
# cdk-remote

`cdk-remote` is a docker image to help you deploy AWS CDK apps without installing `aws-cdk CLI` at local or even without `npm` or `node` required.

## Docker Image

`pahud/cdk-remote:latest`

## Exsample

To deploy CDK application hosted on `https://github.com/pahud/aws-cdk-serverless-sample`:

```bash
# make 'cdk-remote' alias
$ alias cdk-remote="docker run -ti -v ${HOME}/.aws:/root/.aws pahud/cdk-remote"
$ cdk-remote deploy github.com/pahud/aws-cdk-serverless-sample
```

![](https://pbs.twimg.com/media/ERXH9RkUwAA-330?format=jpg&name=4096x4096)

![](https://pbs.twimg.com/media/ERXH9RmU4AAGsWS?format=jpg&name=4096x4096)

![](https://pbs.twimg.com/media/ERXH9RoUYAAfKbm?format=jpg&name=4096x4096)


## Security

Please note `cdk-remote` will mount your AWS credentials with `docker -v` into the docker container and deploy remote CDK apps on behalve of yourself to your AWS environment. Make sure you trust the remote application before deploying it.
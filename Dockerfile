FROM node:lts-alpine as runtime

RUN apk add --no-cache git bash

WORKDIR /workdir

RUN npm i -g aws-cdk

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

ENV AWS_DEFAULT_REGION='us-west-2'


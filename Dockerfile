FROM node:10-alpine

ENV AWS_DEFAULT_REGION=us-east-1

RUN \
	mkdir -p /aws && \
	apk -Uuv add groff less python3 bash git && \
	pip3 install awscli && \
	rm /var/cache/apk/*

RUN npm i -g aws-cdk

COPY entrypoint.sh /root/

CMD ["bash", "-c", "/root/entrypoint.sh"]

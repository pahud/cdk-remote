TAG ?= 'pahud/cdk-remote:latest'

build:
	docker build -t $(TAG) .


run:
	docker run -v $(HOME)/.aws:/root/.aws -e INPUT=pahud/cdk-samples/typescript/FargateAlbService -ti pahud/cdk-remote:latest
-include .make.env

IMAGE_NAME ?= sinusbot
VERSION ?= latest

CONTAINER_NAME ?= $(IMAGE_NAME)
VOLUMES ?= -v /home/sinusbot
PORTS ?= -p 8087:8087

build: Dockerfile
	docker build -t $(IMAGE_NAME):$(VERSION) .

run:
	docker run --rm -it $(VOLUMES) $(PORTS) --name $(CONTAINER_NAME) $(IMAGE_NAME):$(VERSION)

start:
	docker run -d $(VOLUMES) $(PORTS) --name $(CONTAINER_NAME) $(IMAGE_NAME):$(VERSION)

stop:
	docker stop $(CONTAINER_NAME)

remove-container:
	docker rm -v $(CONTAINER_NAME)

remove-image:
	docker rmi $(IMAGE_NAME):$(VERSION)

clean:
	-make stop
	-make remove-container
	-make remove-image
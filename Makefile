IMAGE_NAME = front
VERSION = 1.0
DOCKERHUB_USERNAME = e.diakoo
PRIVATE_REGISTRY = registry-7ccff2c6bc-app.apps.ir-thr-ba1.arvancaas.ir
PLATFORM=linux/amd64
PORT=80

build:
	docker build -t $(PRIVATE_REGISTRY)/$(DOCKERHUB_USERNAME)/$(IMAGE_NAME):$(VERSION) --platform $(PLATFORM) .

run: build
	docker run --rm --name $(IMAGE_NAME) -p $(PORT):$(PORT) -d $(PRIVATE_REGISTRY)/$(DOCKERHUB_USERNAME)/$(IMAGE_NAME):$(VERSION)

push:
	docker tag $(PRIVATE_REGISTRY)/$(DOCKERHUB_USERNAME)/$(IMAGE_NAME):$(VERSION) $(PRIVATE_REGISTRY)/$(DOCKERHUB_USERNAME)/$(IMAGE_NAME):$(VERSION)
	docker push $(PRIVATE_REGISTRY)/$(DOCKERHUB_USERNAME)/$(IMAGE_NAME):$(VERSION)


.PHONY: build run push
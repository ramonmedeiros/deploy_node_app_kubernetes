TEST_TAG=test-app-tag

default: run-container

build-container:
	docker build . --tag=$(TEST_TAG)

run-container: build-container
	docker run -d $(TEST_TAG)

publish-image:
	$(eval COMMIT := $(shell git rev-parse --short HEAD))
	docker tag $(TEST_TAG) ramonmedeiros/k8s_test:$(COMMIT)
	docker login --username $(DOCKER_USERNAME) --password $(DOCKER_PASSWORD)
	docker push ramonmedeiros/k8s_test:$(COMMIT)

TEST_TAG=test-app-tag

default: run-container

build-container:
	docker build . --tag=$(TEST_TAG)

run-container: build-container
	docker run -d $(TEST_TAG)

publish-image:
	$(eval COMMIT := $(shell git rev-parse --short HEAD))
	docker tag $(TEST_TAG) ramonmedeiros/k8s_test:$(COMMIT)
	echo $(DOCKER_PASSWORD) | docker login --username $(DOCKER_USERNAME) --password-stdin
	docker push ramonmedeiros/k8s_test:$(COMMIT)

run-on-k8s:
	kubectl create -f simple_app_deployment.yaml
	kubectl create -f simple_app_service.yaml

cleanup-k8s:
	kubectl delete service simple-app
	kubectl delete deployment simple-app

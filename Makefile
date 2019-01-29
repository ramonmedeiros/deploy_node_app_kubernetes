TEST_TAG=test-app-tag

default: run-container

build-container:
	docker build . --tag=$(TEST_TAG)

run-on-localhost: build-container
	docker run -p 30000:80 -d $(TEST_TAG)
	@echo http://localhost:30000

publish-image:
	$(eval COMMIT := $(shell git rev-parse --short HEAD))
	docker tag $(TEST_TAG) ramonmedeiros/k8s_test:$(COMMIT)
	docker push ramonmedeiros/k8s_test:$(COMMIT)

run-on-k8s:
	kubectl create -f simple_app_deployment.yaml
	kubectl create -f simple_app_service.yaml
	# TODO: search a similar command from minikube service <service> --url
	@echo http:`kubectl cluster-info | grep "Kubernetes master" | awk '{print $6}' | cut -d: -f2`:30000

cleanup-k8s:
	kubectl delete service simple-app
	kubectl delete deployment simple-app

test:
	python -m unittest discover -v tests

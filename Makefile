TEST_TAG=test-app-tag

default: run-test-container

build-container:
	docker build . --tag=$(TEST_TAG)

run-test-container: build-container
	docker run $(TEST_TAG)

run-production-conainer: build-container
	docker run -e "NODE_ENV=production" $(TEST_TAG)
	

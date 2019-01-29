TEST_TAG=test-app-tag

default: run-container

build-container:
	docker build . --tag=$(TEST_TAG)

run-container: build-container
	docker run $(TEST_TAG)


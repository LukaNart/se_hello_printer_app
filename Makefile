
.PHONY: test
USERNAME=luknar
SERVICE_NAME=hello-world-printer
MY_DOCKER_NAME=$(SERVICE_NAME)
TAG=$(USERNAME)/$(MY_DOCKER_NAME)

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt
lint:
	flake8 hello_world test
test:
	PYTHONPATH=. py.test  --verbose -s
run:
	python main.py
test_smoke:
		curl -I --fail 127.0.0.1:5000
docker_build:
	docker build -t $(MY_DOCKER_NAME) .
docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d $(MY_DOCKER_NAME)
docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag $(MY_DOCKER_NAME) $(TAG); \
	docker push $(TAG); \
	docker logout;
test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=.
test_xunit:
	PYTHONPATH=. py.test --verbose -s --cov=. --junit-xml=test_results.xml

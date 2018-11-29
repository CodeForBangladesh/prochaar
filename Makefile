PROJECT = codeforbd/prochar
VERSION = v0.1.0

.PHONY: docker-build
docker-build:
	docker build -t ${PROJECT}:${VERSION} -f scripts/docker/Dockerfile .
	docker tag ${PROJECT}:${VERSION} ${PROJECT}:latest

.PHONY: docker-push
docker-push: docker-build
	docker push ${PROJECT}:${VERSION}
	docker push ${PROJECT}:latest

.PHONY: docker-up
docker-up: docker-build
	docker-compose -f scripts/docker/docker-compose.yaml up -d --remove-orphans

	# Following commands are needed only once on server startup. --rm removes the container when it is ran
	# once successfully.
	docker-compose -f scripts/docker/docker-compose.yaml run --rm prochar-backend-api rake db:create --trace
	docker-compose -f scripts/docker/docker-compose.yaml run --rm prochar-backend-api rake db:migrate --trace
	docker-compose -f scripts/docker/docker-compose.yaml run --rm prochar-backend-api rake db:seed --trace

,PHONY: docker-down
docker-down:
	docker-compose -f scripts/docker/docker-compose.yaml down

.PHONY: docker-clean
docker-clean: docker-down
	docker rmi ${PROJECT}:${VERSION} ${PROJECT}:latest


.PHONY: clean
clean: docker-clean

# TODO (@sadlil)
# bootstrap:
# test:
# .PHONY: install
# install:
#	@echo "Installing dependencies"
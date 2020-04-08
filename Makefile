.PHONY: sh ut lint

IMAGE := ikerry/aws-es-proxy
DCB := docker-compose build --pull
DCR := docker-compose run --rm

sh:
	$(DCB) sh
	$(DCR) sh

ut:
	docker-compose kill && docker-compose rm -vf
	$(DCB) nightwatch
	docker-compose up --remove-orphans -d selenium-hub chrome firefox opera
	sleep 5
	docker-compose up nightwatch

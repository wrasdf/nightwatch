.PHONY: sh ut lint

IMAGE := ikerry/aws-es-proxy
DCB := docker-compose build
DCR := docker-compose run --rm

sh:
	$(DCB) sh
	$(DCR) sh

ut:
	docker-compose kill && docker-compose rm -vf
	$(DCB) selenium-hub nightwatch chrome firefox chrome-debug firefox-debug
	docker-compose up --remove-orphans -d selenium-hub chrome firefox
	sleep 5
	docker-compose up nightwatch

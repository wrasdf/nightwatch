.PHONY: sh ut lint

IMAGE := ikerry/aws-es-proxy
DCB := docker-compose build
DCR := docker-compose run --rm

sh:
	$(DCB) sh
	$(DCR) sh

ut:
	docker-compose kill && docker-compose rm -vf
	$(DCB) hub nightwatch chrome firefox
	docker-compose up nightwatch

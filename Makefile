.ONESHELL:

all: auth.json

auth.json:
	jq -S '{auths: {"docker.io": .auths["docker.io"]}}' ~/.docker/config.json > auth.json

logs:
	kubectl -n build-rpi-container-image-builder logs --tail=-1 --follow -l app=build-rpi-container-image-builder

rebuild:
	kubectl -n build-rpi-container-image-builder delete job -l app=build-rpi-container-image-builder
	kubectl apply -k .

build:
	kubectl apply -k .

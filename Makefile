.ONESHELL:

all: auth.json

auth.json:
	jq -S '{auths: {"docker.io": .auths["docker.io"]}}' ~/.docker/config.json > auth.json

logs:
	kubectl -n build-rpi-container-image-builder logs --tail=-1 --follow -l app=build-rpi-container-image-builder

rebuild: auth.json
	kubectl -n build-rpi-container-image-builder delete job -l app=build-rpi-container-image-builder
	kubectl apply -k .

build: auth.json
	kubectl apply -k .

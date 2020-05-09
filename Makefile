NAME ?= build-rpi-container-image-builder

.ONESHELL:
all: auth.json

auth.json:
	jq -S '{auths: {"docker.io": .auths["docker.io"]}}' ~/.docker/config.json > auth.json

get-pods:
	kubectl -n ${NAME} get pod -o wide

get-logs:
	kubectl -n ${NAME} logs --tail=-1 --follow -l app=${NAME}

rebuild: auth.json
	kubectl -n ${NAME} delete job -l app=${NAME}
	kubectl apply -k .

build: auth.json
	kubectl apply -k .

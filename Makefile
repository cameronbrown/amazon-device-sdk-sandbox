all: setup config build test

setup:
	./initial-setup.sh

config:
	./config-sample-app.sh

build:
	./build-sample-app.sh

test:
	./run-sample-app.sh

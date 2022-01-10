APP ?= demo
BIN_NAME ?= zig
BIN_DIR ?= bin
IMAGE ?= demo
TAG ?=
OPT ?= ReleaseSafe

.PHONY: build docker-build

build:
	zig build -Doptimize=$(OPT)
	@mkdir -p $(BIN_DIR)
	cp zig-out/bin/$(BIN_NAME) $(BIN_DIR)/$(APP)

docker-build:
	docker build --build-arg OPT=$(OPT) -t $(IMAGE)$(if $(TAG),:$(TAG),:latest) .

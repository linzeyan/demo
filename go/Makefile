APP ?= demo
BIN_DIR ?= bin
IMAGE ?= demo
TAG ?=
LDFLAGS ?= -s -w

define go_build
	@mkdir -p $(BIN_DIR)
	go build -trimpath $(if $(1),-tags $(1),) -ldflags "$(LDFLAGS)" -o $(BIN_DIR)/$(APP)$(if $(1),-$(1),) .
endef

define docker_build
	docker build $(if $(1),--build-arg BUILD_TAGS=$(1),) -t $(IMAGE)$(if $(1),:$(1),:latest) .
endef

.PHONY: build build-nethttp build-gin build-echo build-httprouter build-iris build-beego build-goframe build-fiber build-chi
.PHONY: docker-build docker-build-nethttp docker-build-gin docker-build-echo docker-build-httprouter docker-build-iris docker-build-beego docker-build-goframe docker-build-fiber docker-build-chi
.PHONY: build-all

build:
	$(call go_build,$(TAG))

build-nethttp:
	$(call go_build,)

build-gin:
	$(call go_build,gin)

build-echo:
	$(call go_build,echo)

build-httprouter:
	$(call go_build,httprouter)

build-iris:
	$(call go_build,iris)

build-beego:
	$(call go_build,beego)

build-goframe:
	$(call go_build,goframe)

build-fiber:
	$(call go_build,fiber)

build-chi:
	$(call go_build,chi)

build-all:
	@$(MAKE) build-nethttp
	@for tag in gin echo httprouter iris beego goframe fiber chi; do \
		$(MAKE) build-$$tag; \
	done

docker-build:
	$(call docker_build,$(TAG))

docker-build-nethttp:
	$(call docker_build,)

docker-build-gin:
	$(call docker_build,gin)

docker-build-echo:
	$(call docker_build,echo)

docker-build-httprouter:
	$(call docker_build,httprouter)

docker-build-iris:
	$(call docker_build,iris)

docker-build-beego:
	$(call docker_build,beego)

docker-build-goframe:
	$(call docker_build,goframe)

docker-build-fiber:
	$(call docker_build,fiber)

docker-build-chi:
	$(call docker_build,chi)

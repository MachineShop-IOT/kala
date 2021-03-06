APP := kala
VERSION := $(shell git describe --tags --always --dirty)
GOPATH := $(CURDIR)/Godeps/_workspace:$(GOPATH)
PATH := $(GOPATH)/bin:$(PATH)

bin/$(APP): bin
	go build -v -o $@ -ldflags "-X main.Version='${VERSION}'"

bin: clean
	mkdir -p bin

clean:
	rm -rf bin

start: bin/$(APP)
	./bin/$(APP) run -v

start-consul: bin/$(APP)
	./bin/$(APP) run --jobDB=consul -v

test:
	go test -v ./...

.PHONY: bin/$(APP) bin clean start test

build-static:
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix nocgo -o /kala .
docker-build:
	docker build . -t machineshop/kala
docker-push:
	docker build . -t 921779095203.dkr.ecr.us-east-1.amazonaws.com/kala
	docker push 921779095203.dkr.ecr.us-east-1.amazonaws.com/kala
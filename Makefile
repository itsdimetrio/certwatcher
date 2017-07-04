MAINTAINER := Ad Hoc Ops <ops@adhocteam.us>
VERSION_STRING ?= $(shell git describe --tags --long --dirty --always)
APPNAME=certwatcher

.PHONY: rpm clean

clean:
	rm -rf pkg/

test:
	go test -v .

build: deps
	gox -osarch="linux/amd64 darwin/amd64" \
	-output="pkg/{{.OS}}_{{.Arch}}/" .

deps:
	go get -u github.com/mitchellh/gox
	go get

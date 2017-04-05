#!/bin/bash

set -e

IGNITION_DIR="$HOME/Projects/go/src/github.com/octoblu/go-meshblu-connector-ignition"
CURRENT_DIR="$PWD"

main(){
  pushd "$IGNITION_DIR" > /dev/null
    echo "* building ignition script"
    env GOOS="linux" GOARCH="amd64" \
      go build -a -tags netgo -installsuffix cgo -ldflags "-w" \
      -o "$CURRENT_DIR/tests/better/start" .
  popd > /dev/null
  echo "* building base image"
  docker build -t local/connector-test:base -f Dockerfile .
  echo "* building og image"
  docker build -t local/connector-test:og -f Dockerfile-og .
  echo "* building better image"
  docker build -t local/connector-test:better -f Dockerfile-better .
}

main "$@"

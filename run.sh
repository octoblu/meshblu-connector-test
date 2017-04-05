#!/bin/bash

set -e

main() {
  docker run --rm --detach --name connector-test-og \
    --memory 100M --cpus=".5" local/connector-test:og
  docker run --rm --detach --name connector-test-better \
    --memory 100M --cpus=".5" local/connector-test:better
}

main "$@"

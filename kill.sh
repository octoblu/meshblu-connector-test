#!/bin/bash

main() {
  docker ps \
    | grep 'connector-test-og' \
    | grep -v CONTAINER \
    | awk '{print $1}' \
    | xargs docker kill

  docker ps \
    | grep 'connector-test-better' \
    | grep -v CONTAINER \
    | awk '{print $1}' \
    | xargs docker kill
}

main "$@"

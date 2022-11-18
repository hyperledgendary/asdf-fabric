#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -eq 0 ]; then
    version=${ASDF_FABRIC_VERSION}
else
    version=$1
fi

echo "Tagging docker images at $version as the latest docker files (if they exist)"
docker images --filter=reference="hyperledger/*:$version" --format "{{.Repository}}" | xargs --verbose -I {} docker tag {}:${version}  {}:latest


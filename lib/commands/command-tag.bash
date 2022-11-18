#!/usr/bin/env bash

set -euo pipefail

current_script_path=${BASH_SOURCE[0]}
plugin_dir=$(dirname "$(dirname "$current_script_path")")

version=${ASDF_FABRIC_VERSION}

echo "Tagging version with $version as the latest docker files"
docker images --filter=reference="hyperledger/*:$version" --format "{{.Repository}}" | xargs --verbose -I {} docker tag {}:${version}  {}:latest
# todo validate the value ok
# or latest
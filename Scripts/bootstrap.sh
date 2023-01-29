#!/bin/bash

set -eou pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

mint bootstrap

mint run swiftgen config run --config "GravieChallenge/Application/Support/swiftgen.yml"

mint run xcodegen xcodegen

#!/bin/bash

set -ev

git clone https://github.com/purescript/pursuit.git /pursuit-build
cd /pursuit-build

stack upgrade
stack update

stack setup
stack build --dry-run --prefetch
stack install --fast --keep-going --no-test --no-haddock

cd /
rm -rf /pursuit-build

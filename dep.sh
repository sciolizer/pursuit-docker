#!/bin/bash
set -ev

stack build $1 --fast --keep-going --no-test --no-haddock

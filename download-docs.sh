#!/bin/bash

set -ev

mkdir -p /pursuit/data
git --git-dir=/temp.git clone --depth=1 https://github.com/purescript/pursuit-backups.git /pursuit/data/verified
rm -rf /temp.git

#!/bin/bash

BUILD_REMOTE="origin"
BUILD_BRANCH="main"

cd ./storage/app/static
sudo chown -R pi:pi .
[[ -d .git ]] || git init -b $BUILD_BRANCH
git config pull.rebase false
git remote | grep $BUILD_REMOTE >/dev/null
[[ $? -eq 0 ]] || git remote add $BUILD_REMOTE git@github.com:elazar/elazar.github.io.git
git fetch $BUILD_REMOTE $BUILD_BRANCH
git checkout -f $BUILD_BRANCH
git add *
git commit -m 'Build'
git push $BUILD_REMOTE $BUILD_BRANCH

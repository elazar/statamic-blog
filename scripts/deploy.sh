#!/bin/bash

BUILD_REMOTE="origin"
BUILD_BRANCH="main"
BUILD_PATH="./storage/app/static"

[[ -d $BUILD_PATH ]] || mkdir -p $BUILD_PATH
cd $BUILD_PATH
[[ -d .git ]] || git init -b $BUILD_BRANCH
git config pull.rebase false
git remote | grep $BUILD_REMOTE >/dev/null
[[ $? -eq 0 ]] || git remote add $BUILD_REMOTE git@github.com:elazar/elazar.github.io.git
git fetch $BUILD_REMOTE $BUILD_BRANCH
git checkout -f $BUILD_BRANCH
git add *
git commit -m 'Build'
git push $BUILD_REMOTE $BUILD_BRANCH

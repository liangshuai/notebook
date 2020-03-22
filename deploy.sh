#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

# now deploy
cd book

git init
git config user.name "Liang Shuai"
git config user.email "mail@liangshuai.me"

git add -A .
git commit -m "rebuild pages at ${rev}"
git push --force --quiet "https://${GH_TOKEN}@github.com/liangshuai/notebook.git" master:gh-pages

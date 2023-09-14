#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:ALeo75C/products_list_vue.git master:gh-pages

cd -
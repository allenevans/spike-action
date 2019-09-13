#!/bin/sh -l

pwd

ls

cat README.md

echo "hello $1" >> README.md

printenv

echo "node version: $(node -v)"
echo "lerna version: $(lerna -v)"
echo "js version: $(jq --version)"

lerna changed --json --loglevel=silent | jq -c -r 'map(.name) | if (. | length) == 1 then join("") else join(",") | "{" + . + "}" end'

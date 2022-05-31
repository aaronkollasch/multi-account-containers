
test:
	npm run test

run:
	web-ext run -s src/

build:
	./bin/build-addon.sh

sign:
	#!/usr/bin/env bash
	set -euxo pipefail
	cd src
	if [ -z ${WEB_EXT_API_KEY+x} ]; then
		read -s -p "WEB_EXT_API_KEY: " WEB_EXT_API_KEY
		echo
	fi
	if [ -z ${WEB_EXT_API_SECRET+x} ]; then
		read -s -p "WEB_EXT_API_SECRET: " WEB_EXT_API_SECRET
		echo
	fi
	web-ext sign --api-key $WEB_EXT_API_KEY --api-secret $WEB_EXT_API_SECRET

rebase:
	git fetch upstream && git rebase upstream

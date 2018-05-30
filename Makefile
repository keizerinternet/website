phony: setup watch

setup:
	scripts/bootstrap.sh

watch:
	hugo server --watch --buildDrafts


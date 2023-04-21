
all: build

.PHONY: build
build:
	sass --style=compressed scss:public/css
	npx tsc --build tsconfig.json

.PHONY: watch
watch:
	sass --watch scss:css

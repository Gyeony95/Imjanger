ROOT := $(shell git rev-parse --show-toplevel)
FLUTTER := $(shell which flutter)

buildDev :
	@echo "Run Pub build runner"
	@${FLUTTER} build appbundle -t lib/dev_main.dart

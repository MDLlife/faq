#!/usr/bin/env bash

default: start

watch: #sudo apt-get install inotify-tools
	inotifywait -qrm --event modify --format '%w%f' $(PWD) | grep '\*.*' | hugo --watch=false

start:
	hugo server --watch=false

start-watch:
	hugo server --watch=true

build:
	hugo;
	gulp build;

.PHONY: start start-watch watch

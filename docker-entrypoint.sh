#!/bin/bash

set -e

if [ ! -h config.yaml ]; then
	echo >&2 "Copying example 'config.example.yaml' into data volume, creating symbolic link."

	if [ ! -e /data/config.yaml ]; then
		mv config.example.yaml /data/config.yaml
	fi

	ln -s "/data/config.yaml" config.yaml
fi

exec "$@"

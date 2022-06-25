#!/usr/bin/env bash

docker save $(docker images -q) -o config/includes.chroot/opt/csrd-cloud/images/data.tar
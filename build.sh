#!/usr/bin/env bash

while [ ! -f ./live-image-amd64.hybrid.iso ]
do
    make fast;
done


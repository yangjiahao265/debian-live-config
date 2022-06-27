#!/usr/bin/env bash

make clean

while [ ! -f ./live-image-amd64.hybrid.iso ]
do
    make fast;
done


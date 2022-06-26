#!/usr/bin/env bash

# docker save $(docker images --format={{.Repository}}:{{.Tag}}) -o config/includes.chroot/opt/csrd-cloud/images/data.tar

tag=$(cat config/includes.chroot/opt/csrd-cloud/docker/.env | grep CSRD_CLOUD_VERSION | cut -d= -f 2)
repo=$(cat config/includes.chroot/opt/csrd-cloud/docker/.env | grep DOCKER_REGISTRY | cut -d= -f 2)
data="config/includes.chroot/opt/csrd-cloud/images/data.tar.gz"
images=$(docker images --format='{{.Repository}}:{{.Tag}}' | grep $repo/csrd-cloud/csrd-cloud-* | grep $tag)

echo "[Info]: Saving [ $images ] to [ $data ]" 
docker save $images | gzip > $data
echo "[Info]: Current $data szie is $(ls -sh $data | cut -d' ' -f 1)"

# for item in $images; do
    # echo "saving ${item} to $data"
    # docker save ${item} >> $data
    # size=$(ls -sh config/includes.chroot/opt/csrd-cloud/images/data.tar | cut -d" " -f 1);
    # echo "Current data.tar size: $size)"
# done

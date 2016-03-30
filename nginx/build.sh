#!/bin/bash

PROJECT_ID="aerobic-furnace-111811"
TAG=nginx-personal-server
VER=v0.17
GCR_TAG=gcr.io/${PROJECT_ID}/${TAG}

docker build -t ${TAG}:${VER} .
docker tag -f ${TAG}:${VER} ${TAG}:latest
docker tag -f ${TAG}:${VER} ${GCR_TAG}:${VER}
docker tag -f ${TAG}:${VER} ${GCR_TAG}:latest
gcloud docker push ${GCR_TAG}:${VER}
gcloud docker push ${GCR_TAG}:latest

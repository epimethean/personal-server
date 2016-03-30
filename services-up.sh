#!/bin/bash

PROJECT_ID="aerobic-furnace-111811"

kubectl create -f postgres-service.yaml
kubectl create -f owncloud-service.yaml
kubectl create -f nginx-service.yaml

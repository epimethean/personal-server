#!/bin/bash

PROJECT_ID="aerobic-furnace-111811"

kubectl create -f postgres-rc.yaml
kubectl create -f owncloud-rc.yaml
kubectl create -f nginx-rc.yaml

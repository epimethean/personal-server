#!/bin/bash

PROJECT_ID="aerobic-furnace-111811"

kubectl create -f postgres.yaml
kubectl create -f owncloud.yaml

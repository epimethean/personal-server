#!/bin/bash

PROJECT_ID="aerobic-furnace-111811"

kubectl delete services owncloud-service
kubectl delete services postgres-service
kubectl delete services nginx-service

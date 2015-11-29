#!/bin/bash

PROJECT_ID="aerobic-furnace-111811"

kubectl delete services owncloud-frontend
kubectl delete services postgres-service

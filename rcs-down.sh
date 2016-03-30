#!/bin/bash

PROJECT_ID="aerobic-furnace-111811"

kubectl delete rc postgres-rc
kubectl delete rc owncloud-rc
kubectl delete rc nginx-rc

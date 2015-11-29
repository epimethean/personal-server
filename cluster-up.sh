#!/bin/bash

PROJECT_ID="aerobic-furnace-111811"

gcloud container clusters create ellis-cluster --num-nodes 1 -m n1-standard-2

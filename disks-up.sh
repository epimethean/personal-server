#!/bin/bash

gcloud compute disks create --size 200GB owncloud-disk
gcloud compute disks create --size 200GB postgres-disk

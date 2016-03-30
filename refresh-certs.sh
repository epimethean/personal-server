#!/bin/bash

PROJECT_ID="aerobic-furnace-111811"

kubectl delete pod nginx
kubectl delete rc nginx-rc
kubectl create -f nginx-letsencrypt-rc.yaml
NAME=$(kubectl get pods | grep nginx-rc | awk '{ print $1 }')
kubectl exec -it $NAME /bin/bash -- -c 'EMAIL=ellis.rahhal@gmail.com DOMAINS=onru.sh ./fetch_certs.sh'
kubectl exec -it $NAME /bin/bash -- -c 'DOMAINS=onru.sh ./save_certs.sh'
kubectl exec -it $NAME /bin/bash -- -c 'EMAIL=ellis.rahhal@gmail.com DOMAINS=rahh.al ./fetch_certs.sh'
kubectl exec -it $NAME /bin/bash -- -c 'DOMAINS=rahh.al ./save_certs.sh'
kubectl delete rc nginx-rc
kubectl create -f nginx.yaml

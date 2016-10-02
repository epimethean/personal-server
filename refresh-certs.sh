#!/bin/bash

kubectl delete rc nginx-rc
kubectl create -f nginx-letsencrypt-rc.yaml
while ! kubectl get pods | grep nginx-rc | grep Running > /dev/null; do
    echo "waiting for nginx-rc letsencrypt pod to go up..."
    sleep 1
done
NAME=$(kubectl get pods | grep nginx-rc | grep Running | awk '{ print $1 }')
kubectl delete secret onru.sh
kubectl exec -it $NAME /bin/bash -- -c 'EMAIL=ellis.rahhal@gmail.com DOMAINS=onru.sh ./fetch_certs.sh'
kubectl exec -it $NAME /bin/bash -- -c 'SECRET_NAME=onru.sh DOMAINS=onru.sh ./save_certs.sh'
kubectl delete secret rahh.al
kubectl exec -it $NAME /bin/bash -- -c 'EMAIL=ellis.rahhal@gmail.com DOMAINS=rahh.al ./fetch_certs.sh'
kubectl exec -it $NAME /bin/bash -- -c 'SECRET_NAME=rahh.al DOMAINS=rahh.al ./save_certs.sh'
kubectl delete rc nginx-rc
kubectl create -f nginx-rc.yaml

Personal Server Install
=======================

### Files needed to get server running on Kubernetes

Current services

* Owncloud
* Postgres

### To refresh certs

Below is copypasta of the refresh-certs.sh script, which is not complete.
These can be executed sequentially, but with waits in between

```
kubectl delete rc nginx-rc
kubectl create -f nginx-letsencrypt-rc.yaml
NAME=$(kubectl get pods | grep nginx-rc | awk '{ print $1 }')
kubectl exec -it $NAME /bin/bash -- -c 'EMAIL=ellis.rahhal@gmail.com DOMAINS=onru.sh ./fetch_certs.sh'
kubectl exec -it $NAME /bin/bash -- -c 'SECRET_NAME=onru.sh DOMAINS=onru.sh ./save_certs.sh'
kubectl exec -it $NAME /bin/bash -- -c 'EMAIL=ellis.rahhal@gmail.com DOMAINS=rahh.al ./fetch_certs.sh'
kubectl exec -it $NAME /bin/bash -- -c 'SECRET_NAME=onru.sh DOMAINS=rahh.al ./save_certs.sh'
kubectl delete rc nginx-rc
kubectl create -f nginx-rc.yaml
```

### References

* http://blog.ployst.com/development/2015/12/22/letsencrypt-on-kubernetes.html

### TODOS

* Update refresh-certs.sh to wait for pods to be destroyed and created before moving to next step
* Update architecture to support a letsencrypt service that restarts the nginx frontend
* Upgrade owncloud to 9.0
* Create scripts to download owncloud db and files
* Delete old docker images from gcr.io
* Merge scripts and add commands, like git.
    * backup data
    * restore data
    * create volumes
    * delete volumes (with backup warning)
    * backup secrets
    * bring up ephemeral bits
    * take down ephemeral bits
* Add tagspaces
* Add a blog

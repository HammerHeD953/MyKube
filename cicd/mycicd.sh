#!/bin/bash
dockerhubrepo=avoevoda/mypython3
version=latestv8


echo "start docker build $dockerhubrepo:$version"
docker build -t $dockerhubrepo:$version .
echo "start docker push $dockerhubrepo:$version"
docker push $dockerhubrepo:$version

kubectl get nodes

kubectl apply -f mypython-kubernetes/deployment.yaml -n mypython3

kubectl -n mypython3 set image deployment/mypython3-deployment  mypython3=$dockerhubrepo:$version



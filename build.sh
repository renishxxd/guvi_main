#!/bin/bash
docker build -t task37 .
echo Hyyy
docker login -u renish38 -p renish40#
docker tag task37 renish38/devops
docker push renish38/devops
kubectl apply -f  deploy.yaml --validate=false
kubectl apply -f svc.yaml --validate=false

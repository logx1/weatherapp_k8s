#!/bin/bash
k3d cluster delete weatherapp-cluster
k3d cluster create weatherapp-cluster --servers 1 --agents 1 --port 3306:3306@loadbalancer

kubectl create secret generic mysql-secret \
  --from-literal=root-password='secure-root-pw' \
  --from-literal=auth-password='my-secret-pw' \
  --from-literal=secret-key='xco0sr0fh4e52x03g9mv'

kubectl create configmap mysql-config --from-file=init.sql=./mysql/init.sql
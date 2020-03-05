#!/usr/bin/env bash

cd ../terraform
terraform init
terraform apply -auto-approve
cd ..
kubectl apply -f zulip.yaml 
#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=dheemonk/monkimages:natalie
# Step 2:
# Run the Docker Hub container with kubernetes
kubectl run monkimages --image=$dockerpath --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/monkimages 8000:80

#PLEASE NOTE THAT I USED THE "kubernetes_config.yml" for configuration isntead of the script. 
#The alternative the above script is:
#Step 1: Create the deployment
#kubectl apply -f kubernetes_config.yaml
#Step 2: Create a Kubernetes service that exposes the deployment
#kubectl expose deployment microservice --type=NodePort --port=80
#Step 3: minikube service microservice --url 

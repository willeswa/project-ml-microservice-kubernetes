[![CircleCI](https://dl.circleci.com/status-badge/img/gh/willeswa/project-ml-microservice-kubernetes/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/willeswa/project-ml-microservice-kubernetes/tree/main)
### Project Overview
This project demostrates my knowledge of operationalizing a machine learning model by deploying a pre-trained `sklearn` model that predicts housing prices in Boston. The project itself is a Flask app. 

The following tasks are accomplished:

- Use a `Makefile` to build a run the project locally
- Dockerize the the project on a Debian OS running `python:3.7.3-stretch` as the base image
- Host the Docker image on Docker Hub
- Deploy the Docker image to a Kubernetes cluster. This is done locally using minikube

### Running the project locally
Running the project locally is pretty straight forward:
- Start by creating a virtual environment: `python3.7 -m venv .env`. If you don't have python3.7, you can use [`pyenv`](https://github.com/pyenv/pyenv) to run more than one python interpreter.
- Activate the envronment: `source .env/bin/activate`
- Install the requirements: `make install`
- Finally, run the project: `python app.py`

### Running the Docker Container
- To build and run the docker container, simply run the `./run_docker.sh` script.
- You might need to install some extra dependencies like the following: `apt-get update && apt-get install -y gfortran liblapack-dev libopenblas-dev` to make everything work.


### Deploy to Kubernetes
- First, we push the image to [DockerHub](https://hub.docker.com/): `./upload_docker.sh`
- Then create a K8 cluster: `kubectl apply -f kubernetes_config.yaml`
- Create a K8 service that exposes port 80: `kubectl expose deployment microservice --type=NodePort --port=80`
- Optionally, you can foward connection to a specific port i.e (8080): `kubectl port-forward deployment/microservice 8080:80`
- Finally, you can ask minikube to give you the test url: minikube service microservice --url 

### Tools used
The following tools are used:
- circleCI
- kubectl
- minikube
- kubernetes
- docker
- makefile

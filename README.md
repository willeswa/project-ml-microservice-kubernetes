### Project Overview
This project demostrates my knowledge of operationalizing a machine learning model by deploying a pre-trained `sklearn` model that predicts housing prices in Boston. The project itself is a Flask app. 

The following tasks are accomplished:

- Use a `Makefile` to build a run the project locally
- Dockerize the the project on a Debian OS running `python:3.7.3-stretch` as the base image
- Add Logging 


### Running the project locally
Running the project locally is pretty straight forward:
- Start by creating a virtual environment: `python3.7 -m venv .env`. If you don't have python3.7, you can use [`pyenv`](https://github.com/pyenv/pyenv) to run more than one python interpreter.
- Activate the envronment: `source .env/bin/activate`
- Install the requirements: `make install`
- Finally, run the project: `python app.py`

### Running the Docker Container
- To build and run the docker container, simply run the `./run_docker.sh` script.
- You might need to install some extra dependencies like the following: `apt-get update && apt-get install -y gfortran liblapack-dev libopenblas-dev` to make everything work.

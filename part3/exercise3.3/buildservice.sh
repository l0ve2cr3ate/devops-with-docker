#!/bin/bash

echo "Please provide a Github Repository:"
read GITHUB_REPO 
if [ -z "$GITHUB_REPO" ]
then
    echo "GITHUB_REPO variable is required"
    exit
fi

git clone $GITHUB_REPO repository
cd repository
echo Cloned github repository: $GITHUB_REPO

if test ! -f "Dockerfile"
then
    echo "The Github Repository should contain a Dockerfile. Please provide a repository containing a Dockerfile."
    exit
fi

echo "Please provide container name"
read CONTAINER_NAME

if [ -z "$CONTAINER_NAME" ]
then
    echo "CONTAINER_NAME variable is required"
    exit
fi

docker build -t $CONTAINER_NAME .

echo "Please provide your Docker username"
read DOCKER_USERNAME

if [ -z "$DOCKER_USERNAME" ]
then
    echo "DOCKER_USERNAME variable is required"
    exit
fi

echo "Please provide the name of the Docker repository where you want to publish your image"
read DOCKER_REPO

if [ -z "$DOCKER_REPO" ]
then
    echo "DOCKER_REPO variable is required"
    exit
fi

docker login

docker tag $CONTAINER_NAME $DOCKER_USERNAME/$DOCKER_REPO
docker push $DOCKER_USERNAME/$DOCKER_REPO

echo "Your image has been pushed to Docker Hub repository $DOCKER_USERNAME/$DOCKER_REPO"



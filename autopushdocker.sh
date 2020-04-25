#/bin/sh

export GRADLE_HOME=/opt/gradle/gradle-6.3
export PATH=${GRADLE_HOME}/bin:${PATH}

gradle jibDockerBuild
docker tag demo:0.0.1-SNAPSHOT frmnjn/hello:latest
docker push frmnjn/hello:latest

set -e

DOCKER_IMAGE="frmnjn/hello:latest"
CONTAINER_NAME="hello"

echo "Deploying Hello World to Docker Container"

#Check for running container & stop it before starting a new one
if [ $(docker inspect -f '{{.State.Running}}' $CONTAINER_NAME) = "true" ]; then
    docker stop hello
fi

echo "Starting Hello World using Docker Image name: $DOCKER_IMAGE"

docker run -d --rm=true -p 8080:8080  --name hello $DOCKER_IMAGE

docker ps -a

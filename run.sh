#!/usr/bin/bash

echo "Cloning the source repository..."
git clone $SOURCE_REPOSITORY_URL

echo "Entering directory `basename ${SOURCE_REPOSITORY_URL%%.*}`"
cd `basename ${SOURCE_REPOSITORY_URL%%.*}`

echo "Building the image with tag ${TAG}"
docker build -t $TAG ${REPO_PATH##/}

TO=${DOCKER_REGISTRY_SERVICE_HOST}:${DOCKER_REGISTRY_SERVICE_PORT}/$TAG

docker tag ${TAG} ${TO}

echo "Pushing the image to registry (${TO})"
docker push ${TO}


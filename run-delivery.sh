#!/usr/bin/bash


FULL_FROM=${DOCKER_REGISTRY_SERVICE_HOST}:${DOCKER_REGISTRY_SERVICE_PORT}/${FROM}
FULL_TO=${TARGET_REGISTRY}/${TO}

echo "Pulling RC image (${FROM})"
docker pull ${FULL_FROM}
docker tag ${FULL_FROM} ${FULL_TO}

echo "Pushing final image (${FULL_TO})
docker push ${FULL_TO}

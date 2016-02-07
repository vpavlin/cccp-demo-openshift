#!/usr/bin/bash


echo "[FAKE] Talking to Jenkins"
echo "[FAKE] Jenkins running..."
echo "[FAKE] Jenkins returned: PASS"

FULL_FROM=${DOCKER_REGISTRY_SERVICE_HOST}:${DOCKER_REGISTRY_SERVICE_PORT}/${FROM}
FULL_TO=${DOCKER_REGISTRY_SERVICE_HOST}:${DOCKER_REGISTRY_SERVICE_PORT}/${TO}

echo "Pulling tested image (${FROM})"
docker pull ${FULL_FROM}
echo "Re-tagging tested image (${FROM} -> ${TO})"
docker tag ${FULL_FROM} ${FULL_TO}
echo "Pushing RC image (${FULL_TO})"
docker push ${FULL_TO}

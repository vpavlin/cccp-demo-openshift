#!/usr/bin/bash

CWD=`dirname $0`

echo "==> Building cccp-build image"
docker build -t cccp-build -f $CWD/Dockerfile.build $CWD || exit 1
echo "==> Building cccp-test image"
docker build -t cccp-test -f $CWD/Dockerfile.test $CWD || exit 1
echo "==> Building cccp-delivery image"
docker build -t cccp-delivery -f $CWD/Dockerfile.delivery $CWD || exit 1

echo "==> Uploading template to OpenShift"
oc get --no-headers  -f $CWD/template.json && oc replace -f $CWD/template.json || oc create -f $CWD/template.json

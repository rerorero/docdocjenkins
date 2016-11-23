#!/bin/bash

set -e
set -x

JENKINS_VERSION=$1

JENKINS_SHA=$(curl "http://repo.jenkins-ci.org/simple/releases/org/jenkins-ci/main/jenkins-war/${JENKINS_VERSION}/jenkins-war-${JENKINS_VERSION}.war.sha1")
echo "sha=$JENKINS_SHA"

docker build --build-arg "uid=10500" \
             --build-arg "uid=10500" \
             --build-arg "JENKINS_VERSION=$JENKINS_VERSION" \
             --build-arg "JENKINS_SHA=$JENKINS_SHA" \
             --no-cache --pull \
             --tag "rerorero/docdocjenkins:$JENKINS_VERSION" .

docker tag "rerorero/docdocjenkins:$JENKINS_VERSION" rerorero/docdocjenkins:latest

docker push "rerorero/docdocjenkins:$JENKINS_VERSION"
docker push rerorero/docdocjenkins:latest



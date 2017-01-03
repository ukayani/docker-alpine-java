#!/usr/bin/env bash

if [ "$TRAVIS_TAG" != "" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    echo "Building docker image $DOCKER_REPO:$TRAVIS_TAG"
    docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
    TAG="latest"
    docker build -f Dockerfile -t $DOCKER_REPO:$COMMIT .
    docker tag $DOCKER_REPO:$COMMIT $DOCKER_REPO:$TAG
    docker tag $DOCKER_REPO:$COMMIT $DOCKER_REPO:$TRAVIS_TAG
    docker push $DOCKER_REPO
fi


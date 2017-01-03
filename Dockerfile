FROM openjdk:8-jdk-alpine

MAINTAINER UMAIR KAYANI

# install curl and bash
RUN apk upgrade --update && \
    apk add --update curl bash

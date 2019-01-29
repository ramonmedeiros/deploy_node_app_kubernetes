# Deploying React Node application on Kubernetes
[![Build Status](https://travis-ci.org/ramonmedeiros/deploy_node_app_kubernetes.svg?branch=master)](https://travis-ci.org/ramonmedeiros/deploy_node_app_kubernetes)

This is an exercise to learn how to dockerize a simple application, and publish to kubernetes.

## Docker aspects

The application is being dockerize with multi-stage builds, which uses node:alpine image to build the application and nginx:alpine to run it, resulting in a very small image of 18.3MB.

Sources:

https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md

https://docs.docker.com/docker-hub/official_images/

https://medium.com/thepeaklab/how-to-deploy-a-react-application-to-production-with-docker-multi-stage-builds-4da347f2d681


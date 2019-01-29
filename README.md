# Deploying React Node application on Kubernetes
[![Build Status](https://travis-ci.org/ramonmedeiros/deploy_node_app_kubernetes.svg?branch=master)](https://travis-ci.org/ramonmedeiros/deploy_node_app_kubernetes)

This is an exercise to learn how to dockerize a simple application, and publish to kubernetes.

## Docker aspects

The application is being dockerize with multi-stage builds, which uses node:alpine image to build the application and nginx:alpine to run it, resulting in a very small image of 18.3MB. To generate, just run:

```$ make```

Sources:

https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md

https://docs.docker.com/docker-hub/official_images/

https://medium.com/thepeaklab/how-to-deploy-a-react-application-to-production-with-docker-multi-stage-builds-4da347f2d681

# Kubernetes aspects

For this example, a deployment was created, using only 1 replica. A NodePort service was created to expose the service, which runs on port 30000. To setup the service and deployment, run:

```$ make run-on-k8s```

It's not necessary to generate an image, because it uses the last image stored in my dockerhub: https://cloud.docker.com/u/ramonmedeiros/repository/docker/ramonmedeiros/k8s_test



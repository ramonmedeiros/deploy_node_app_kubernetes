# Docker multi-stage build
# This build will produce a very small, that will be run in a nginx container
# First stage build the app
# Second stage packs into nginx

# BUILD
# this image was choosen because it's the official image in docker repo
# alpine means that is the lightweight version
# More reading about official images: https://docs.docker.com/docker-hub/official_images/
FROM node:alpine as build

# WORKDIR sets the PATH for next scripts, working similar to $PATH usage in linux.
# After setting the workdir, I can call directly the scripts without using complete path 
WORKDIR /app

# copy project file structure
COPY app/package.json /app

# RUN executes scripts inside of docker image. In this case, I'm running npm install, which
# reads package.json, a file that describes packages dependencies, instructions to run/test
# and more actions are describe in package.json
RUN npm install --silent

COPY app/ /app

# optimize for production
RUN npm run-script build --silent

# PRODUCTION
FROM nginx:alpine

# copy build files
COPY --from=build /app/build /usr/share/nginx/html

# expose 80 port
EXPOSE 80

# run nginx
CMD ["nginx", "-g", "daemon off;"]

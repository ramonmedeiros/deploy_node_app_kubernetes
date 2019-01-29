# this image was choosen because it's the official image in docker repo
# More reading about official images: https://docs.docker.com/docker-hub/official_images/
FROM node:11

# WORKDIR sets the PATH for next scripts, working similar to $PATH usage in linux.
# After setting the workdir, I can call directly the scripts without using complete path 
WORKDIR /app

# copies project files
COPY app/package.json /app

# RUN executes scripts inside of docker image. In this case, I'm running npm install, which
# reads package.json, a file that describes packages dependencies, instructions to run/test
# and more actions related to the project
RUN npm install

COPY app/ /app

# run app
CMD [ "npm", "start" ]

# EXPOSE opens the network port of the image
EXPOSE 3000






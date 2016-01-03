FROM node:latest

MAINTAINER Francescu

WORKDIR /home/app/blog-admin
ADD . /home/app/blog-admin

RUN npm config set registry http://registry.npmjs.org/

#install npm dependencies
RUN npm install
RUN npm install -g bower gulp-cli
RUN bower install --allow-root

RUN npm rebuild node-sass

#install dist website
RUN gulp build

# Tell Docker we are going to use this port
EXPOSE 9000

# The command to run our app when the container is run
CMD ["node", "dist/server/server.js"]

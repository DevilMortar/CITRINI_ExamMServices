FROM node:latest
MAINTAINER "Mathias CITRINI"
ENV APPLICATION_INSTANCE example
COPY src /src
WORKDIR /src
EXPOSE 8080
CMD ["node", "count-server.js"]

# Build the image
# docker build -t simple-nodejs-webapp .

# Run the container
# docker run -d -p 8080:8080 --name simple-nodejs-webapp simple-nodejs-webapp
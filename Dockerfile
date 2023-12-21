FROM node:latest
MAINTAINER "Mathias CITRINI"
ENV APPLICATION_INSTANCE example
COPY src /src
WORKDIR /src
EXPOSE 8080
CMD ["node", "count-server.js"]
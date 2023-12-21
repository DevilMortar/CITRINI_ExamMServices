# Exam MicroServices
CITRINI Mathias (devilmortar)

## Part 1: Docker

### Docker and Containers
A) You can find the Dockerfile in the project folder.

B) These are the command to type :
```bash
docker build -t simple-nodejs-webapp .
docker run -d -p 8080:8080 --name simple-nodejs-webapp simple-nodejs-webapp
```
C) Before pushing the image, i had to create a gpg key.
After, to push the image to Docker Hub, I typed these commands :
```bash
docker login -u devilmortar -p <password> # I don't want to show my password
docker tag simple-nodejs-webapp devilmortar/simple-nodejs-webapp:0.0.1
docker push devilmortar/simple-nodejs-webapp:0.0.1
```

This is the Docker Hub repo :
https://hub.docker.com/repository/docker/devilmortar/simple-nodejs-webapp/general

### Kubernetes
A ) To deploy the Dockerized web application, I used minikube. I typed these commands :
```bash
minikube start
kubectl create deployment webapp --image=devilmortar/simple-nodejs-webapp:latest
kubectl expose deployment webapp --type=NodePort --port=8080
```

B) Make your application accessible from outside the Kubernetes cluster
```bash
minikube service webapp
```

C) To scale horizontally the application, I typed these commands :
```bash
kubectl scale deployment webapp --replicas=3
```

d) To set requests and limits for my deployment, I used this command :
```bash
kubectl set resources deployment webapp --requests=cpu=200m,memory=512Mi --limits=cpu=500m,memory=1Gi
```

e) Set Liveness and Readiness probes for your deployment : (--initial-delay-seconds doesn't work with minikube)
???

## Part 2: Questions

### Question 1
Microservices architecture is a way to develop software, where an application
is divided into small services. Each service runs in its own process and communicates
with other services with requests. The major part of the time,
these services use REST API to communicate with each other.
In the other hand, monolithic architecture is a way to develop software
where the application is a single unit. All the code is in the same place
and all the components are interconnected and interdependent.

### Question 2
#### Microservices :
The main advantages of microservices architecture are:
- Scalability: it is easy to scale.
- Flexibility: it is easy to add new features.
- Independent: each service is independent from the others. It's easy to deploy a new version of a service without affecting the others.

The main disadvantages of microservices architecture are:
- Complexity: it is more complex to develop.
- Managing distributed systems: it is more complex to manage.
- Potential latency: it is possible to have latency between services.

#### Monolithic :
The main advantages of monolithic architecture are:
- Simplicity: it is easy to develop, deploy it and manage it.
- Performance: it is possible to have better performance, because the latency between services is not a problem.

The main disadvantages of monolithic architecture are:
- Lack of scalability: it is more complex to scale.
- Dependence: all the components are interdependent. It is not possible to deploy a new version of a component without affecting the others.
- Maintenance: it is more complex to maintain.

### Question 3 :

In a microservices architecture, the application should be split into small services.
Each service should have a single responsibility. For example: a service for the
authentication, a service for the user management, a service for the product management...
It is important to split the application
into small services, because it is easier to develop, deploy and manage a microservice

### Question 4 :

The CAP theorem is a theorem that say that it is impossible for a distributed
system to provide at the same time more than two out of three guarantees:
- Consistency: all nodes see the same data at the same time.
- Availability: a guarantee that every request receives a response about whether it was successful or failed.
- Partition tolerance: the system continues to operate despite arbitrary message loss or failure of part of the system.

### Question 5 :

These consequences have an impact on the architecture of the application.
In a microservices architecture, it is possible to choose between consistency and availability.
In a monolithic architecture, it is not possible to choose between consistency and availability.

### Question 6 :

In a microservices architecture, it is possible to scale a service independently.
For example, if a service is used more than the others, it is possible to scale
this service without scaling the others.

For example, let's imagine we have 3 services: authentication, user management and product management.
if the authentication service is used way more than the others,
it's useless to scale the other services. It is a waste of resources.
So, it is possible to scale only the authentication service, to make it able to 
handle more requests. Once the amount of requests is back to normal, it is possible
to scale down the authentication service.

### Question 7 :

Statelessness means that the server does not store any state/data/information about the client session.
It means that each request is independent from the others. 

It is important in microservices architecture because it makes the application easier to scale and add
some fault tolerance.

### Question 8 : What purposes does an API Gateway serve ?

An API Gateway is the unified entry point of the application. It is the only part that is accessible from the outside.
It allows to hide the internal architecture of the application and handle the requests, authenticate the users,
load balance, rout...

Often, when the service is updated, only the hidden part change so the API Gateway does not change, and the other services doen't need to change
anything to work with the new version of the service.




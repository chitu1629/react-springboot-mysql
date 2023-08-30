
# Create database application using docker compose and monitor the docker containers

## Contents

  - [Objective](#Objective)
- purpose
-   - [Objective](#objective)
  
## Objective

This app is an example application for anyone looking for a web app linking the backend capabilities of Spring Boot (with Hibernate) to excellent frontend offered by React. 

![app 1](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/ba08d090-df19-45df-8ae4-e57ebf6c16ec)

![app 2](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/4917632d-8f17-4b39-8f2d-5b0f7e4b9b9e)

![app 3](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/b91cec3a-af08-437e-a64e-cbd971ae7ae8)


## Purpose

The purpose of the app was to learn as to : 

 1. How to build Spring Boot apps?
 2. How to encapsulate the backend to the frontend?
 3. How to deploy React and Spring Boot along with MySQL DB in my server?
 4. How to dockerize the web application?
 5. How to set up docker compose?
 6. How to use CICD to automate the build and deployment?
 7. How to monitor the docker contianers using Prometheus and Grafana?
 8. How to extract docker container logs using ELK?

## Installation

For prerequisite you'll need Java, node, npm, docker, docker-compose, jenkins, maven, Prometheus, Grafana, ELK

### Install Java

```sh
$ sudo apt update 
$ sudo apt-get install default-jdk 
$ java –version 
```
### Install node and npm

```sh
$ curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh  
$ sudo bash /tmp/nodesource_setup.sh  
$ sudo apt install nodejs
$ sudo apt install npm
$ npm -v
$ node -v  
```

### Install docker and Docker-compose

```sh
$ sudo apt update 
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common 
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" 
$ apt-cache policy docker-ce 
$ sudo apt install docker-ce
sudo apt install docker-compose 
```

### Install jenkins

```sh
$ sudo apt update 
$ curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \ 
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null  
$ echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \ 
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \ 
  /etc/apt/sources.list.d/jenkins.list > /dev/null  
$ sudo apt-get update  
$ sudo apt-get install jenkins  
```

## Database application using docker compose

Create a dockerfile to build a springboot application

1. Choose a Base Image: Start your Dockerfile with a base image
2. Copy Files: Use COPY to put your code and files in the image.
3. Install Dependencies: If needed, use RUN to install requirements.
4. Expose Ports (Optional): Use EXPOSE for ports your app uses.
5. Build the Image: Run docker build -t your-image-name ..
6. Image Verification: Check your new image with docker images.
   
The docker compose file will create the containers for the springboot application and mysql database 

1. Create docker-compose.yml: Make a file named docker-compose.yml to define your services (containers) and their configurations.
2. Define Services: Inside the docker-compose.yml file, list your services, set their images, ports, and any other configurations.
3. Start Containers: Run docker-compose up to start the services as defined in the file.
4. Access Services: Access your services using the specified ports in the browser (e.g., <public_ip>:8090).

####  PostScript

I hope this app gives some insight on how to compile the backend and the frontend into a single executable file making deployment a breeze. 

If you have any feedback or suggestion, let's connect on LinkedIn: [Mukund Madhav](https://www.linkedin.com/in/mukundmadhav02/) or on my website at [mukundmadhav.com](https://mukundmadhav.com)

Happy coding 😃

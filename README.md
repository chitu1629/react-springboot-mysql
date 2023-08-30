
# Create database application using docker compose and monitor the docker containers

## Objective

This app is an example application for anyone looking for a web app linking the backend capabilities of Spring Boot (with Hibernate) to excellent frontend offered by React. 

![app 1](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/ba08d090-df19-45df-8ae4-e57ebf6c16ec)

![app 2](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/4917632d-8f17-4b39-8f2d-5b0f7e4b9b9e)

![app 3](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/b91cec3a-af08-437e-a64e-cbd971ae7ae8)


## The purpose of the webapp

The purpose of the app was to learn as to : 

 1. How to build Spring Boot apps?
 2. How to encapsulate the backend to the frontend?
 3. How to deploy React and Spring Boot along with MySQL DB in my server?
 4. How to dockerize the web application?
 5. How to set up docker compose?
 6. How to use CICD to automate the build and deployment?
 7. How to monitor the docker contianers using Prometheus and Grafana?
 8. How to extract docker container logs using ELK?

### Installation

Install docker and Docker-compose

```sh
$ sudo apt update 
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common 
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" 
$ apt-cache policy docker-ce 
$ sudo apt install docker-ce 
```


####  PostScript

I hope this app gives some insight on how to compile the backend and the frontend into a single executable file making deployment a breeze. 

If you have any feedback or suggestion, let's connect on LinkedIn: [Mukund Madhav](https://www.linkedin.com/in/mukundmadhav02/) or on my website at [mukundmadhav.com](https://mukundmadhav.com)

Happy coding 😃

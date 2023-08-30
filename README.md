
# Create database application using docker compose and monitor the docker containers

## Contents

  - [Objective](#Objective)
  - [Purpose](#Purpose)
  - [Installation](#Installation)
       - [Install Java](#Install-Java)
       - [Install node and npm](#Install-node-and-npm)
       - [Install docker and Docker-compose](#Install-docker-and-Docker-compose)
       - [Install jenkins](#Install-jenkins)
       - [Install prometheus](#Install-prometheus)
       - [Install Cadvisor](#Install-Cadvisor)
       - [Install Grafana](#Install-Grafana)
  - [Steps to create docker image](#Create-a-dockerfile-to-build-a-springboot-application)
  - [Steps to create docker compose](#The-docker-compose-file-will-create-the-containers-for-the-springboot-application-and-mysql-database)
  - [Prometheus](#Prometheus)
  - [Grafana](#Grafana)
       - [Queries](#Queries)
  - [ELK](#ELK)

  
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
$ sudo apt install docker-compose 
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

### Install prometheus

```sh
$ sudo apt update 
$ curl -LO https://github.com/prometheus/prometheus/releases/download/v2.0.0/prometheus-2.0.0.linux-amd64.tar.gz 
$ tar xvf prometheus-2.0.0.linux-amd64.tar.gz 
$ sudo nano /etc/prometheus/prometheus.yml 
$ sudo nano /etc/systemd/system/prometheus.service 
$ sudo systemctl daemon-reload
$ sudo systemctl start prometheus
$ sudo systemctl status prometheus
$ sudo systemctl enable prometheus
```
### Install Cadvisor

```sh
$ sudo apt update 
$ sudo apt -y install cadvisor  
$ sudo systemctl status cadvisor 
```

### Install Grafana

```sh
$ wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -  
$ sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"  
$ sudo apt update  
$ sudo apt install grafana  
$ sudo systemctl start grafana-server  
$ sudo systemctl status grafana-server  
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

## Prometheus

Prometheus is an open-source monitoring tool which collects metrics from your services and stores them in a time-series database. It can display collected data in tabular or graph form

If you would like to change which targets should be monitored or make configuration changes edit the /prometheus/prometheus.yml file. The targets section is where you define what should be monitored by Prometheus.

http://<public_ip_of_instance>:9090

1. Default port for prometheus - 9090
2. Default port for cadvisor - 8080
3. Default port for grafana - 3000

The below image is the example of tabular format which shows the number of running, stopped and paused containers.


![prometheus 4](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/11f6374c-ac72-4f06-afbb-5e5be2014f46)

The below image is the example of graph format which shows the number of running, stopped and paused containers.

![prometheus 6](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/5f274029-0070-427b-a45e-5b327a9be341)

## Grafana

Grafana is an open-source platform used to create dynamic and visually appealing dashboards. Can arrange panels (visual components) on dashboards to show various metrics in graphs, tables, gauges, and more.

It's used to display and analyze time-series data, making it a popular choice for visualizing performance metrics, system health, and other monitoring data. 

http://<public_ip_of_instance>:3000 

### Queries

The below query will fetch the number of running containers

```sh
$ engine_daemon_container_states_containers{state="running"}  
```

The below query will fetch the number of paused containers

```sh
$ engine_daemon_container_states_containers{state="paused"}  
```

The below query will fetch the number of stopped containers.

```sh
$ engine_daemon_container_states_containers{state="stopped"}  
```

The below query will fetch the details of the memory usage of the container.

```sh
$ sum(container_memory_usage_bytes{name=~".+"}) by (name)  
```

The below query will fetch the details of the CPU usage of the container in seconds.

```sh
$ sum(container_cpu_usage_seconds_total{name=~".+"}) by (name)  
```

The below query will fetch the details of the disk usage of the container.

```sh
$ sum(container_fs_usage_bytes{name=~".+"}) by (name)  
```

The below image shows the creation of data source and dashboard to save the panels

![grafana 1](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/a5f01849-44e4-4902-9fcb-051fb6a1b1e5)

The below image shows the creation of panel to display the number of running containers 

1. Select the correct data source
2. Select “Code” instead of builder
3. Write a query (here the query is written for displaying the number of running containers)
4. Select the visualization (bar chart, line graph, pie chart, etc)
5. Give the name for the panel
6. Click on the “Run query”
7. Click “Save”
   
![grafana 2](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/750e562d-5ce7-4aaa-a720-f0c022db7365)

The below image indicates the creation of panels related to docker container metrics (Status of the container, memory usage of the container, disk usage of the container, CPU usage)

![grafana 3](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/c067dd4d-7cca-4ed0-b1f3-736c6e9a1cfd)

## ELK

ELK (monitoring tool) is an acronym that stands for Elasticsearch, Logstash, and Kibana. It refers to a set of open-source tools used for log and data management, search, analysis, and visualization. 

Clone a git repository to install ELK using a docker-compose file

```sh
https://github.com/chitu1629/elk-with-filebeat-by-docker-compose.git 
```
With the help of the docker-compose file Elasticsearch, Logstash, Kibana and Filebeat are created as the containers
 
![elk 1](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/455d0efb-704b-487a-beef-0f031d566da3)

The below image indicates the creation of the index pattern to view logs
![elk 2](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/a765ef7f-5947-49b5-aa5a-0b9d41495815)

The below image shows the docker container logs are fetched into Kibana with the help of elasticsearch, logstash and filebeat
![elk 3](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/12a90b04-57ce-4982-a67f-e0919bcd4eda)

The below image shows the docker container logs in gauge format
![elk 4](https://github.com/chitu1629/react-springboot-mysql/assets/108867392/af3f7411-bdd2-40dc-8fdc-764ad517543b)


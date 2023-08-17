#dockerfile
FROM  ninjamajewski/jdk-mvn-npm:latest

COPY . /
WORKDIR /react-springboot-mysql
RUN mvn -f /pom.xml clean package -DskipTests
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/target/springboot-0.0.1-SNAPSHOT.jar"]

## Stage 1
FROM maven:3.6.3-openjdk-8-slim AS builder

MAINTAINER pranav.dhope@gmail.com

WORKDIR /app
COPY . .

RUN mvn install

## Stage 2
FROM tomcat:8.5-alpine

COPY --from=builder /app/target/springboot-helloworld.war webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]

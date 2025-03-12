
FROM maven:3.8.4-openjdk-17 AS builder

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src /app/src

RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

COPY --from=builder /app/target/spring-boot-app-0.0.1-SNAPSHOT.jar /app/spring-boot-app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/spring-boot-app.jar"]

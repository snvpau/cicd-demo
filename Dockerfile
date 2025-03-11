FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/java-pipeline-1.0-SNAPSHOT.jar /app/app.jar
EXPOSE 8080 
ENTRYPOINT ["java", "-jar", "app.jar"]


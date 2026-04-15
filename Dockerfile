FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY target/spring-app.jar obs-app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "obs-app.jar"]
# Use a base image with OpenJDK
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Spring Boot JAR file from the target directory to the container's working directory
COPY target/order-locator-0.0.1-SNAPSHOT.jar /app/order-locator-0.0.1-SNAPSHOT.jar

# Expose the port your application will run on
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "/app/order-locator-0.0.1-SNAPSHOT.jar"]

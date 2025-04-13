# ---- Build stage ----
FROM maven:3.9.0-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# ---- Run stage ----
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=build /app/target/order-locator-0.0.1-SNAPSHOT.jar /app/order-locator-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/order-locator-0.0.1-SNAPSHOT.jar"]

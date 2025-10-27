# Use OpenJDK 21 base image
FROM eclipse-temurin:21-jdk-jammy

# Set working directory
WORKDIR /app

# Copy Maven build files
COPY pom.xml mvnw ./
COPY .mvn .mvn

# Copy source code
COPY src ./src

# Make Maven wrapper executable
RUN chmod +x mvnw

# Build the project
RUN ./mvnw clean package -DskipTests

# Expose the port
ENV PORT=8080
EXPOSE $PORT

# Run the Spring Boot app
CMD ["java", "-jar", "target/today-0.0.1-SNAPSHOT.jar"]

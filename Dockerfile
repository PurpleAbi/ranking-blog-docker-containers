

# Stage 1: Build frontend
# Stage 1: Build backend
FROM eclipse-temurin:21-jdk-alpine AS backend

# Install Maven
RUN apk add --no-cache maven

WORKDIR /app
COPY server-prod/ ./

# Use installed maven instead of wrapper
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=backend /app/target/movieranking-0.0.1-SNAPSHOT.jar ./
EXPOSE 8080
CMD ["java", "-jar", "movieranking-0.0.1-SNAPSHOT.jar"]

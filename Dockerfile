
# Stage 1: Build frontend
# Stage 1: Build backend
FROM eclipse-temurin:21-jdk-alpine AS backend
WORKDIR /app
COPY server-prod/ ./
COPY server-prod/.mvn/ .mvn/
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Stage 2: Run
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=backend /app/target/movieranking-0.0.1-SNAPSHOT.jar ./
EXPOSE 8080
CMD ["java", "-jar", "movieranking-0.0.1-SNAPSHOT.jar"]

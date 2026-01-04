

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
# Note: The jar is inside /app/target/ because WORKDIR was /app in the build stage
COPY --from=backend /app/target/*.jar app.jar

EXPOSE 8080
# Render provides the PORT environment variable automatically
CMD ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar app.jar"]

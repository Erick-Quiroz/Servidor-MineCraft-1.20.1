# Use official OpenJDK 17 image for Linux compatibility
FROM openjdk:17-jdk-slim

# Create workspace
WORKDIR /minecraft

# Copy all files
COPY . .

# Expose Minecraft server port
EXPOSE 25565

# Run the server via Java directly
ENTRYPOINT ["java", "-Xms8G", "-Xmx8G", "-jar", "INICIADOR.jar", "run"]

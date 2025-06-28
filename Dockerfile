# Use official OpenJDK 17 image for Linux compatibility
FROM openjdk:17-jdk-slim-bookworm

# Reduce vulnerabilities by updating packages
RUN apt-get update && apt-get upgrade -y && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create workspace
WORKDIR /minecraft

# Copy all files
COPY . .

# Expose Minecraft server port
EXPOSE 9090

# Run the server via Java directly
ENTRYPOINT ["java", "-Xms8G", "-Xmx8G", "-jar", "INICIADOR.jar", "run"]

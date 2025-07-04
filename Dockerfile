# Use official OpenJDK 17 image for Linux compatibility
FROM openjdk:17-jdk
RUN apt-get update && apt-get upgrade 

# Create workspace
WORKDIR /minecraft
VOLUME ["/minecraft/world"]

# Copy all files
COPY . .

# Comando para ejecutar la aplicación Java
CMD ["java", "-jar", "INICIO.jar", "nogui"]
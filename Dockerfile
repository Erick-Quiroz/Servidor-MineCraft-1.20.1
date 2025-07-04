# Use official OpenJDK 17 image for Linux compatibility
FROM openjdk:17-jdk

# Create workspace
WORKDIR /minecraft
VOLUME ["/minecraft/world"]

# Copy all files
COPY . .

# Comando para ejecutar la aplicación Java
CMD ["java", "-jar", "INICIADOR.jar", "nogui"]
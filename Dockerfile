# Use official OpenJDK 17 image for Linux compatibility
FROM openjdk:17-jdk-slim
RUN apt-get update && apt-get upgrade -y && apt-get install -y bash && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create workspace
WORKDIR /minecraft
VOLUME ["/minecraft/world"]

# Copy all files
COPY . .

# Expose Minecraft server port
EXPOSE 25565

# Hacer ejecutable el script y usarlo como punto de entrada para mostrar los logs del servidor
RUN chmod +x run.sh
ENTRYPOINT ["java","-jar","sh", "run.sh" ,"nogui" ,"-Xms8G","-Xmx8G"]
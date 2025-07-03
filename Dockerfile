# Use official OpenJDK 17 image for Linux compatibility
FROM eclipse-temurin:17-jdk-jammy
RUN apt-get update && apt-get upgrade -y && apt-get install -y bash && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create workspace
WORKDIR /minecraft
VOLUME ["/minecraft/world"]

# Copy all files
COPY . .

# Expose Minecraft server port
EXPOSE 25565

# Hacer ejecutable el script de inicio (bash) y usarlo como punto de entrada
RUN chmod +x run.sh
ENTRYPOINT ["bash", "run.sh" , "nogui" ,"run"]
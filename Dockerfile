FROM openjdk:17-jdk-slim

# Instala SSH y herramientas básicas (sin root login)
RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-server sudo nano && \
    rm -rf /var/lib/apt/lists/*

# Configura SSH (deshabilita root y usa puerto 22 interno)
RUN mkdir /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Crea un usuario seguro para SSH (ej: "mcadmin")
RUN useradd -m -s /bin/bash mcadmin && \
    echo "mcadmin:minecraftSecure123" | chpasswd && \
    usermod -aG sudo mcadmin

WORKDIR /minecraft
VOLUME ["/minecraft/world"]
COPY . .
RUN chmod +x run.sh

# Inicia SSH y Minecraft juntos
CMD service ssh start && ./run.sh
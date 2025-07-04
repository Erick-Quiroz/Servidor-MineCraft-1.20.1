FROM openjdk:17-jdk

# instalar OpenSSH y crear directorio
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

WORKDIR /minecraft
VOLUME ["/minecraft/world"]

COPY . .

# configurar contraseña de root (o crear usuario dedicado)
RUN echo 'root:TuPasswordSeguro' | chpasswd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && chmod +x run.sh

# exponer puerto SSH y el de Minecraft
EXPOSE 22 25565

# arrancar sshd en segundo plano y luego tu script
CMD service ssh start && ./run.sh
FROM openjdk:17-jdk-alpine

# instalar OpenSSH y generar llaves y crear directorio
RUN apk update && \
    apk add --no-cache openssh && \
    ssh-keygen -A && \
    mkdir -p /var/run/sshd

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
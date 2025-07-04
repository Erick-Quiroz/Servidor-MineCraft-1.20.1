FROM openjdk:17-jdk
RUN apt-get update && apt-get install -y nano
WORKDIR /minecraft
VOLUME ["/minecraft/world"]

COPY . .
RUN chmod +x run.sh

CMD ["./run.sh"]
FROM openjdk:17-jdk

WORKDIR /minecraft
VOLUME ["/minecraft/world"]

COPY . .
RUN chmod +x run.sh

CMD ["./run.sh"]
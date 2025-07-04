#!/bin/bash

# Inicia el servidor Minecraft en segundo plano
java -jar INICIADOR.jar nogui &

# Espera un poco para que se cree el archivo de logs
sleep 2

# Redirige los logs del archivo al stdout para Docker
tail -n 100 -f logs/latest.log

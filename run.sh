#!/usr/bin/env bash
# Salir al primer error
set -euo pipefail
# Encontrar el JAR principal de Forge (universal)
SERVER_JAR=$(ls /minecraft/forge-*universal.jar 2>/dev/null | head -n1)
if [ -z "$SERVER_JAR" ]; then
	echo "ERROR: No se encontró el JAR de Forge en /minecraft"
	exit 1
fi
# Ejecutar el servidor como proceso principal para que los logs fluyan
exec java ${JVM_OPTS:-"-Xms1G -Xmx2G"} -jar "$SERVER_JAR" nogui

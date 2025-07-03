#!/usr/bin/env bash
# Exit on error, undefined vars
set -euo pipefail
# Run the main Minecraft JAR with memory settings
exec java ${JVM_OPTS:-"-Xms8G -Xmx8G"} -jar INICIADOR.jar nogui run

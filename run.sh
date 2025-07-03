#!/usr/bin/env bash
# Salir al primer error
set -euo pipefail
# Reemplaza el shell con el proceso Java para mantener stdout/stderr del contenedor
exec java @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.20.1-47.3.22/unix_args.txt "$@"

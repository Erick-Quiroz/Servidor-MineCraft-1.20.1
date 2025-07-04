#!/bin/bash

# Ejecuta el servidor Minecraft con Forge y redirige logs al stdout para que Docker los capture
exec java @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.20.1-47.3.22/unix_args.txt "$@" >> /dev/stdout 2>&1

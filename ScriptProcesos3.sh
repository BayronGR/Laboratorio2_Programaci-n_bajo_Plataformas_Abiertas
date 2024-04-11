#!/bin/bash

# Se verifica que no el atgumento proporcionados no es igual a 1
if [ $# -ne 1 ]; then
  echo "Uso: $0 <nombre_del_ejecutable>"
  exit 1
fi

# Nombre del ejecutable a monitorear
ejecutable="$1"

# Duración del monitoreo
duracion_monitoreo=60 

# Nombre del archivo de registro
log_file="monitoring.log"

# Inicio de ejecucion
start_time=$(awk '{print int($1)}' /proc/uptime)
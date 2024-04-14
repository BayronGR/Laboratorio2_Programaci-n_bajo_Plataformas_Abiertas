#!/bin/bash

   #Directorio que se va a monitorear
   directorio_a_monitorear="/home/vboxuser/prueba_1"

   #Archivo de registro de cambios
   log_file="/home/vboxuser/registro.log"

   #Inicializacion del monitoreo
   inotifywait -m -r -e create,modify,delete "$directorio_a_monitorear" |
   while read -r directorio evento archivo; do
     fecha_hora=$(date +"%Y-%m-%d %H:%M:%S")
     echo "$fecha_hora - Se detectó un evento de $evento en $archivo" >> "$log_file"
   done
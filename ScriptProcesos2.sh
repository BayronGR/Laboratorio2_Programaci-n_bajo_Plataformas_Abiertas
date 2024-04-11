#!/bin/bas

#Verificación de los dos argumentos: Proceso y comando para ejecutar

if [ $# -ne 2 ]; then
  echo "Uso: $0 <nombre_del_proceso> <comando_de_ejecucion>"
  exit 1
fi

#Se guardan los dos argumentos

nombre_proceso="$1"
comando_ejecucion="$2"

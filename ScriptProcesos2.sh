#!/bin/bas

#Verificación de los dos argumentos: Proceso y comando para ejecutar

if [ $# -ne 2 ]; then
  echo "Uso: $0 <nombre_del_proceso> <comando_de_ejecucion>"
  exit 1
fi

#Se guardan los dos argumentos

nombre_proceso="$1"
comando_ejecucion="$2"


# Se crea un bucle de revisión
while true; do
  if pgrep -x "$nombre_proceso" >/dev/null; then
    echo "El proceso $nombre_proceso está en ejecución."
  else
    echo "El proceso $nombre_proceso no está en ejecución. Reiniciando..."

    #comando para la compatibilidad de los procesos y que se reinicie
    
    $comando_ejecucion &
  fi

  # Revisión periódca
  sleep 25
done

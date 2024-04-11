#!/bin/bash

# Se verifica que el argumento proporcionados no es igual a 1
if [ $# -ne 1 ]; then
  echo "Uso: $0 <nombre_del_ejecutable>"
  exit 1
fi

# Nombre del ejecutable que se quiere monitorear
ejecutable="$1"

# Duración del monitoreo
duracion_monitoreo=30 

# Nombre del archivo de registro
log_file="monitoring.log"

# Inicio de ejecución
start_time=$(awk '{print int($1)}' /proc/uptime)

# Iniciación del archivo de registro 
if [ ! -e "$log_file" ]; then
  echo "Tiempo CPU Memoria" > "$log_file"
fi

# Se monitorea el proceso cuando se está ejecutando
while is_brave_running; do
  current_time=$(awk '{print int($1)}' /proc/uptime)
  elapsed_time=$((current_time - start_time))
  if [ "$elapsed_time" -le "$duracion_monitoreo" ]; then
    ps -C "$ejecutable" -o %cpu,%mem | tail -n 1 >> "$log_file"
    sleep 1
  else
    break
  fi
done

# Se crea la gráfica con Gnuplot, y se exporta la imagene en formato png
gnuplot <<EOF
    set terminal png
    set output 'grafica.png'
    set title 'Consumo de CPU y Memoria de $ejecutable'
    set xlabel 'Tiempo (segundos)'
    set ylabel 'Porcentaje'
    plot "$log_file" using 1 with lines title 'CPU', \
         "$log_file" using 2 with lines title 'Memoria'
EOF

echo "Ha finalizado el monitoreo, ver resultados en 'grafica.png'."
echo "Presione Ctrl+C para salir"

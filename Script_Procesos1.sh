#!/bin/bash

# Comprobación del ID del proceso 
if [ $# -ne 1 ]; then
    echo "Uso: $0 <ID de proceso>"
    exit 1
fi

process_id=$1

info=$(ps -p $process_id -o comm=,pid=,user=,%cpu=,%mem=,stat=)

executable_path=$(readlink -f /proc/$process_id/exe)

# Verificación del path del proceso
if [ -z "$info" ] || [ -z "$executable_path" ]; then 
    echo "ID $process_id no encontrado"
    exit 1
fi

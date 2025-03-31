#!/bin/bash

while true; do
    echo "Ejecutando captura.py..."
    python captura.py  
    
    echo "Ejecutando slack.sh..."
    ./slack.sh  
    
    echo "Esperando 10 segundos antes de la próxima ejecución..."
    sleep 10  
done

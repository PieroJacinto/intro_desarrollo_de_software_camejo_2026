#!/bin/bash
# 9) Crear un script de Bash que reciba un nombre. 
# Si el nombre ingresado es “Manu” imprimir por pantalla “Hola, profe”, de no ser así imprimir por pantalla “Hola, (nombre)”

if [ $1 = "Manu" ]; then
    echo "Hola profe"
else 
    echo "Hola $1"
fi
#!/bin/bash
# 6) Crear un script de Bash que le solicite al usuario el ingreso de un número e indicar si el número es mayor, menor o igual a 0. 
# Imprimir por pantalla.

echo "Ingrese un numero:"
read numero
if [ $numero -gt 0 ]; then
    echo "el numero es mayor q 0"
elif [ $numero -eq 0 ]; then
    echo "el numero es 0"
else 
    echo "el numero es menor a 0"
fi
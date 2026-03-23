#!/bin/bash
# 8) Crear un script de Bash que reciba un número entero e indique si el número es par o impar.

if [ $(($1 % 2)) -eq 0 ]; then
    echo "el numero es par"
else 
    echo "el numero es impar"
fi
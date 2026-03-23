#!/bin/bash

# 16) Crear un script de Bash que reciba números naturales y que luego los imprima por pantalla 
# (la cantidad de números ingresados puede variar).

for n in "$@"; do   
    echo "$n"
done
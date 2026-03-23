#!/bin/bash

# 23) Crear un script de Bash que solicite al usuario un número natural n y cree n cantidad de carpetas con los nombres carpeta1, carpeta2, etc.

echo "Ingrese un numero natural: "
read num

for ((i=1; i<=$num; i++)); do
    mkdir "carpeta$i"
done

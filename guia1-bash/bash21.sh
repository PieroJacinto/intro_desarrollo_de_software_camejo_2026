#!/bin/bash

# 21) Crear un script de Bash que solicite al usuario un número natural n y cree n cantidad de archivos con los nombres archivo1, archivo2, etc. 
# Escribir en todos los archivos el nombre del usuario actual.

echo "Ingrese un numero natural: "
read num

for((i=1; i<=$num;i++)); do
    echo $USER > "archivo$i.txt"
done
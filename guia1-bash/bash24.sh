#!/bin/bash

# 24) Crear un script de Bash que solicite al usuario un número natural n e imprima en un archivo llamado “primos.txt” todos los números primos existentes hasta n.

echo "Ingrese un numero natural: "
read num

for ((i=2; i<=$num; i++)); do
    es_primo=true
    for ((j=2; j<i; j++)); do
        if(( i % j == 0 )); then
            es_primo=false
            continue
        fi
    done
    if $es_primo; then
        echo $i >> "primos.txt"
    fi
done
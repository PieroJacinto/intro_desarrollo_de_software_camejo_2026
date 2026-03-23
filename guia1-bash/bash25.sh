#!/bin/bash

# 25) Crear un script de Bash que imprima en un archivo llamado “ordenados.txt” los nombres de todos los archivos del directorio actual ordenados según sus tamaños.

# -s muestra tamaño y nombre de archivo
# sort -n ordena por el tamaño lo q recibe
# tail -n + 2 salta la primera linea, muestra de linea 2 en adelante
# awk procesa el texto columna por columna, como  lo q tenemos es primera colmna tamaño y segunda nombre, solo quiero el nombre, por eso imprimo con print (propio de awk) solo la segunda columna

ls -s | sort -n | tail -n +2 | awk '{print $2}' > "ordenados.txt"
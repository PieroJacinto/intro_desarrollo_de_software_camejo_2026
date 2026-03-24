#!/bin/bash

# 6) sobre oraciones.txt: Encontrar la expresión regular de Regex que devuelve: 
#   Las palabras que comienzan con la letra p (no es necesario incluir las mayúsculas).

grep -E --color "\bp\w+" oraciones.txt
#!/bin/bash

# 5) sobre oraciones.txt: Encontrar la expresión regular de Regex que devuelve: 
#   Las ocurrencias de la letra c al comienzo de la palabra.

# \b marca el limite entre una palabra y lo q no es palabra
grep -E --color "\bc" oraciones.txt
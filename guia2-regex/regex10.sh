#!/bin/bash

# 10) ¿Qué devuelven las siguientes expresiones regulares?
#     [A-Z1-3]

#devuelve las lineas q tiene alguna mayuscula o un numero del 1 al 3

grep -E --color "[A-Z1-3]" oraciones.txt
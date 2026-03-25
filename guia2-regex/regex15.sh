#!/bin/bash

#  Se tiene el archivo contraseñas.csv, el cual almacena las contraseñas de distintos usuarios en una plataforma. 
#  La estructura es nombre_usuario,contraseña. Se pide extraer, del archivo:

#  15) Las contraseñas que comienzen y terminen con el mismo caracter.

# \1 dice q es el mismo caracter q capturaste en el grupo 1 . grupo 1 seria (.), el primer grupo q utilizamos
grep -oE ",(.).*\1$" contraseñas.csv | sed "s/,//"

# sacar la coma tb se puede hacer con lookbehind

grep -oP "(?<=,)(.).*\1$" contraseñas.csv 
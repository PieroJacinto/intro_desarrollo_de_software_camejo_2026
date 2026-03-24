#!/bin/bash

#  Se tiene el archivo contraseñas.csv, el cual almacena las contraseñas de distintos usuarios en una plataforma. 
#  La estructura es nombre_usuario,contraseña. Se pide extraer, del archivo:

#  17) Las contraseñas seguras; son las que contienen al menos:
#       1 letra minúscula
#       1 letra mayúscula
#       1 número
#       1 caracter especial (@$!%*?&#)

## SOLUCION 1: CON LOOKAHEADS que no enseñaron en la catedra: 
## Un lookahead (?=...) es una aserción que dice "a partir de acá, debe existir esto más adelante"
## entonces seria: 
grep -P --color ",(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@$!%*?&#]).*$" contraseñas.csv

### SOPLUCION 2: con greps encadenados por pipes:
## en el primer grep evaluo cualquier caracter que no sea un espacio y que tenga al menos una minuscula
## en elñ segundo grep evalua que tenga alguna mayuscula
##en el tercer grep evalua que tenga al menos un numero
##en el cuarto grep evalua que tenga al menos unc aracter especial
grep -E --color ",[^ ]*[a-z]" contraseñas.csv | grep -E "[A-Z]" | grep -E "[0-9]" | grep -E "[@\$!%\*\?&#]"
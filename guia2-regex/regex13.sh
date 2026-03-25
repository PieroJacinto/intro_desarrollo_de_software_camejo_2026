#!/bin/bash

#  Se tiene el archivo contraseñas.csv, el cual almacena las contraseñas de distintos usuarios en una plataforma. 
#  La estructura es nombre_usuario,contraseña. Se pide extraer, del archivo:

#  13) Las contraseñas alfanúmericas.

grep -oE ",[A-Za-z0-9]+$" contraseñas.csv | sed 's/,//'

# tb se puede hacer con un lookbehinf utilizanbdo -P
grep -oP "(?<=,)[A-Za-z0-9]+$" contraseñas.csv
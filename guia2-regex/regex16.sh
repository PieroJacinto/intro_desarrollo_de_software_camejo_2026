#!/bin/bash

#  Se tiene el archivo contraseñas.csv, el cual almacena las contraseñas de distintos usuarios en una plataforma. 
#  La estructura es nombre_usuario,contraseña. Se pide extraer, del archivo:

#  16) Las contraseñas con exactamente 14 caracteres (de cualquier tipo).

grep -oE --color ",.{14}$" contraseñas.csv | sed "s/,//"

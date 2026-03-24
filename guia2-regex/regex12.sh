#!/bin/bash

#  Se tiene el archivo contraseñas.csv, el cual almacena las contraseñas de distintos usuarios en una plataforma. 
#  La estructura es nombre_usuario,contraseña. Se pide extraer, del archivo:

#  12) Los nombres de usuario con al menos un guión bajo (_).

grep -oE "^[^,]*_[^,]*," contraseñas.csv  | sed "s/,//"
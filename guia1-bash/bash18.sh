#!/bin/bash

# 18) Crear un script de Bash que reciba como parámetros dos strings “contraseña” y “contraseña ingresada” e indique si la clave ingresada es correcta o incorrecta.

contrasenia=$1
contrasenia_ingresada=$2

if [ $contrasenia = $contrasenia_ingresada ]; then
    echo "La clave ingresada es correcta."
else 
    echo "La clave ingresada es incorrecta"
fi

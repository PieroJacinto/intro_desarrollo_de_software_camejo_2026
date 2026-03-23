#!/bin/bash

# 4) Crear un script de Bash que le solicite al usuario el ingreso de su nombre y su apellido (por separado) 
# y que luego imprima por pantalla su nombre completo.

echo "Ingrese su nombre:"
read nombre
echo "Ingrese su apellido:"
read apellido

echo "su nombre es: $nombre $apellido "
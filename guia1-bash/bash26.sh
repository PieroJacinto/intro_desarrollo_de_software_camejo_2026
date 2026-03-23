#!/bin/bash

# 26) Crear un script de Bash que solicite al usuario los siguientes datos: 
# -Nombre -Apellido -Legajo -Materia preferida Luego imprimir en un archivo “datos_alumno.txt” toda la información.

echo "ingrese su nombre: "
read nombre

echo "ingrese su apellido: "
read apellido

echo "ingrese su legajo: "
read legajo

echo "ingrese su materia preferida: "
read materia

echo "nombre: $nombre" > datos_alumno.txt
echo "Apellido: $apellido" >> datos_alumno.txt
echo "Legajo: $legajo" >> datos_alumno.txt
echo "Materia preferida: $materia" >> datos_alumno.txt
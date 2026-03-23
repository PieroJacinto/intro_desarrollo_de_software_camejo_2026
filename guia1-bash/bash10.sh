#!/bin/bash
# 10) Crear un script de Bash que reciba las longitudes de los lados de un triángulo y que luego indique si se trata de un triángulo 
# equilátero, isósceles o escaleno.

echo "Ingrese el lado 1:"
read lado1

echo "Ingrese el lado 2:"
read lado2

echo "Ingrese el lado 3:"
read lado3

if [ $lado1 -eq $lado2 ] && [ $lado2 -eq $lado3 ]; then
    echo "Es un triángulo equilátero"
elif [ $lado1 -eq $lado2 ] || [ $lado1 -eq $lado3 ] || [ $lado2 -eq $lado3 ]; then
    echo "Es un triángulo isósceles"
else
    echo "Es un triángulo escaleno"
fi
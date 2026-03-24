#!/bin/bash
# 7) Crear un script de Bash que solicite la edad del usuario y determine si es mayor o menor de edad.

echo "ingrese su edad:"
read edad

if [ $edad -ge 18 ]; then
    echo "sos mayor de edad"
else 
    echo "sos menor de edad"
fi
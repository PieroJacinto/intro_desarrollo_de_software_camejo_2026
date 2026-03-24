#!/bin/bash/
# 5) Crear un script de Bash que reciba dos números (base y altura) para luego calcular el perímetro de un rectángulo.

perimetro=$(($1*2 + $2*2))
echo "el perimetro es: $perimetro"
#!/bin/bash
# 12) Crear un script de Bash que imprima los primeros n números naturales. Solicitar al usuario el ingreso de n.
echo "Ingrese un numero: "
read n

for ((num=1; num <= n; num++)); do
    echo "$num"
done


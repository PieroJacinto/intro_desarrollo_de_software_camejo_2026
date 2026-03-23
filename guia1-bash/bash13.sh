#!/bin/bash
# 13) Crear un script de Bash que solicite el ingreso de un número n y que luego calcule su factorial.

echo "Ingrese un numero: "
read n
factorial=1
for ((i=2; i <= n; i++)); do
   ((factorial *= i))
done

echo "factorial de $n : $factorial"
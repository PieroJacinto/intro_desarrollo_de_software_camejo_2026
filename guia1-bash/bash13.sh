#!/bin/bash


echo "Ingrese un numero: "
read n
factorial=1
for ((i=2; i <= n; i++)); do
   ((factorial *= i))
done

echo "factorial de $n : $factorial"
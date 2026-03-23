#!/bin/bash

echo "Ingrese un numero par: "
read n
while [ $((n % 2)) -ne 0 ]; do
    echo "El numero ingresado debe ser par, ingrese un numero nuevamente: "
    read n
done

# otra opcion

# if (( n % 2 == 0 )); then
#     echo "El numero $n es par"
# else
#     echo "El numero $n es impar"
# fi
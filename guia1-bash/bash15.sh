#!/bin/bash

while true; do
    echo "Ingrese un numero entre 1 y 7: "
    read num

    case $num in 
        1) echo "Lunes";;
        2) echo "Martes";;
        3) echo "Miercoles";;
        4) echo "Jueves";;
        5) echo "Viernes";;
        6) echo "Sabado";;
        7) echo "Domingo";;
        *) 
            echo "Opcion no valida, intente nuevamente"
            continue;;
    esac
    exit 0
done
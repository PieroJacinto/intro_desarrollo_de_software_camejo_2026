#!/bin/bash

sumar() {
    local resultado=$(($1+$2))
    echo $resultado
}
restar() {
    local resultado=$(($1-$2))
    echo $resultado
}
multiplicar() {
    local resultado=$(($1*$2))
    echo $resultado
}
dividir() {
    local resultado=$(($1/$2))
    echo $resultado
}

echo "ingrese un numero"
read num1
echo "ingrese otro numero"
read num2

suma=$(sumar num1 num2)
echo "$num1 + $num2 = $suma"
resta=$(restar num1 num2)
echo "$num1 - $num2 = $resta"
multi=$(multiplicar num1 num2)
echo "$num1 * $num2 = $multi"
divi=$(dividir num1 num2)
echo "$num1 / $num2 = $divi"
#!/bin/bash

# 17) Crear un script de Bash que reciba números de DNI y ordene a las personas de menor a mayor edad. 
# Imprimir por pantalla los documentos ordenados.(la cantidad de números de DNI puede variar).

# no enseñaron sort por eso lo hago de 2 maneras diferentes:
# con sort, mucho mas sencillo. sort ordena -n por numero


# creo un array con los parametros ingresados
personas=("$@")

# recorro con un for los parametros y se los paso por pipes a el sort por numero
for dni in "${personas[@]}"; do
    echo "$dni"
done | sort -n

# opcion sin sort, con ordenamiento manual por burbujeo como enseñan en azcurra
# guardo la cantidad de personas ingresadas por parametro del script
cantidad=${#personas[@]}
# ahora aplico burbujeo mejorado (como lo enseñan en fundam de prog catedra azcurra)
continuar=true
i=1
while $continuar && [ $i -lt $cantidad ]; do
    continuar=false
    for ((j=0; j<cantidad-i; j++)); do
        if [ ${personas[$j]} -gt ${personas[$((j+1))]} ]; then
            temp=${personas[$j]}
            personas[$j]=${personas[$((j+1))]}
            personas[$((j+1))]=$temp
            continuar=true
        fi
    done
    ((i++))
done

for dni in "${personas[@]}"; do
    echo "$dni"
done





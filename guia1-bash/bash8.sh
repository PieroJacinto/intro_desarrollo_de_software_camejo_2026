#!/bin/bash

if [ $(($1 % 2)) -eq 0 ]; then
    echo "el numero es par"
else 
    echo "el numero es impar"
fi
#!/bin/bash
echo "ingrese su edad:"
read edad

if [ $edad -ge 18 ]; then
    echo "sos mayor de edad"
else 
    echo "sos menor de edad"
fi
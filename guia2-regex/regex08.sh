#!/bin/bash

# 8) ¿Qué devuelven las siguientes expresiones regulares?
#    !$

# devuelve las lineas que terminan con !

grep -E --color "!$" oraciones.txt
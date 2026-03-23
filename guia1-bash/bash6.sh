
#!/bin/bash
echo "Ingrese un numero:"
read numero
if [ $numero -gt 0 ]; then
    echo "el numero es mayor q 0"
elif [ $numero -eq 0 ]; then
    echo "el numero es 0"
else 
    echo "el numero es menor a 0"
fi
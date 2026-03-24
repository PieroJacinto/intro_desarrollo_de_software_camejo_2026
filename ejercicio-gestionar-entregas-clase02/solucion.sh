#!/bin/bash

ACCION=$1
DIRECTORIO=$2

inicializar() {
  local directorio_padre=$1
  for directorio in "$directorio_padre/originales" "$directorio_padre/procesadas" "$directorio_padre/burlas"; do
    if [ -d "$directorio" ]; then
      echo "El directorio $directorio ya existe"
    else
      mkdir -p "$directorio"
      echo "Se creo correctamente $directorio"
    fi
  done
}

procesar() {
  local directorio=$1
  local regex="^Alumno: [A-Za-z]+, [A-Za-z]+ - Padron: [0-9]{6}$"

  for archivo in "$directorio/originales"/*.txt; do
    local primera_linea=$(head -1 "$archivo")
    local nombre_archivo=$(basename "$archivo")
    if echo "$primera_linea" | grep -qE "$regex"; then
      echo "El archivo $nombre_archivo , esta ok"
    else
      echo "El archivo $nombre_archivo, no cumple el enunciado."
      continue
    fi
    local padron=$(echo "$primera_linea" | grep -oE "[0-9]{6}")
    cp "$archivo" "$directorio/procesadas/${padron}.txt"
    gsed -E -i "/$regex/d" "$directorio/procesadas/${padron}.txt"
    echo "Procesamos correctamente el archivo ${nombre_archivo}"
  done
}


burlarme() {
    local directorio=$1

    for archivo in "$directorio/procesadas"/*.txt; do
        local nombre=$(basename "$archivo")

        gsed 's/[aeou]/i/g; s/[AEOU]/I/g' "$archivo" > "$directorio/burlas/$nombre"
        echo "Burla generada: $directorio/burlas/$nombre"
    done
}

case $ACCION in
  inicializar) inicializar "$DIRECTORIO";;
  procesar) procesar "$DIRECTORIO";;
  burlarme) burlarme "$DIRECTORIO";;
  *)
    echo "Error: la acción $ACCION no es conocida"
    echo "Las validas son inicializar, procesar, burlarme"
    echo "vuelva a intentar"
    exit 1
    ;;
esac
exit 0

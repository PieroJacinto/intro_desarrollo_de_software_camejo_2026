# 🖥️ Bash Cheatsheet — Cátedra Camejo FIUBA 2026

---

## Variables

```bash
nombre="piero"          # asignación SIN espacios alrededor del =
echo $nombre            # uso de variable
echo "$nombre"          # entre comillas (recomendado si puede tener espacios)
```

### Variables de entorno útiles
```bash
$USER   # usuario actual
$PWD    # directorio actual
$HOME   # directorio home
```

### Parámetros posicionales
```bash
$1 $2 $3    # argumentos del script
$@          # todos los argumentos como lista
$#          # cantidad de argumentos
```

### Sustitución de comandos
```bash
resultado=$(comando)        # guarda la salida de un comando en una variable
fecha=$(date)
archivos=$(ls | wc -l)      # cuenta la cantidad de archivos del directorio actual
```

---

## Aritmética

```bash
suma=$(( $1 + $2 ))         # resultado en variable
perimetro=$(( $1*2 + $2*2 ))
(( factorial *= i ))        # modifica la variable directamente
(( i++ ))                   # incremento
```

> ⚠️ Usá `(( ))` para comparaciones numéricas, no `[ ]`.

---

## Entrada del usuario

```bash
echo "Ingrese su nombre:"
read nombre

echo "Ingrese su apellido:"
read apellido
```

---

## Condicionales

### if / elif / else
```bash
if [ $numero -gt 0 ]; then
    echo "positivo"
elif [ $numero -eq 0 ]; then
    echo "cero"
else
    echo "negativo"
fi
```

### Comparaciones numéricas (`[ ]` o `(( ))`)
| Operador | Significado |
|----------|-------------|
| `-eq` | igual |
| `-ne` | distinto |
| `-lt` | menor que |
| `-le` | menor o igual |
| `-gt` | mayor que |
| `-ge` | mayor o igual |

```bash
[ $edad -ge 18 ]        # con [ ]
(( edad >= 18 ))        # con (( ))
```

### Comparaciones de strings
```bash
[ $1 = "Manu" ]         # igual
[ $1 != "Manu" ]        # distinto
```

### Comparaciones de archivos/directorios
```bash
[ -d "$directorio" ]    # existe y es directorio
[ -f "$archivo" ]       # existe y es archivo
```

### Operadores lógicos
```bash
[ $a -eq $b ] && [ $c -eq $d ]      # AND
[ $a -eq $b ] || [ $c -eq $d ]      # OR
```

---

## case / esac

```bash
case $num in
    1) echo "Lunes";;
    2) echo "Martes";;
    *)
        echo "Opción no válida"
        continue;;
esac
```

> 💡 Usado en el ej15 (días de la semana) y en el integrador (acciones del script).

---

## Loops

### for con lista / parámetros
```bash
for n in "$@"; do
    echo "$n"
done
```

### for estilo C
```bash
for ((i=1; i<=n; i++)); do
    echo "$i"
done

for ((i=2; i<n; i++)); do
    (( factorial *= i ))
done
```

> ⚠️ Usá `for ((i=...))` en vez de `for i in {1..$n}` cuando `n` es una variable.

### while
```bash
while [ $(( n % 2 )) -ne 0 ]; do
    echo "Ingrese un número par:"
    read n
done

while true; do
    # loop infinito, salir con exit o continue en caso inválido
done
```

### Lógica de loops de la cátedra
- El caso **inválido** usa `continue` para volver a pedir.
- El caso **válido** cae naturalmente al código siguiente o usa `exit`.
- **No** usar `break` para salir en el caso válido.

```bash
while true; do
    read n
    case $n in
        [1-7]) echo "Válido"; exit 0;;   # válido → exit
        *) echo "Inválido"; continue;;   # inválido → continue
    esac
done
```

---

## Funciones

```bash
sumar() {
    local resultado=$(( $1 + $2 ))
    echo $resultado
}

# llamada y captura del resultado
suma=$(sumar $num1 $num2)
echo "Resultado: $suma"
```

> ⚠️ Usá `local` para variables dentro de funciones.
> ⚠️ Las funciones se comunican con `echo`, no con `return` (return solo devuelve 0–255).

---

## Arrays

```bash
# creación
personas=("$@")
arr=("a" "b" "c")

# acceso
${arr[0]}           # primer elemento
${arr[@]}           # todos los elementos
${#arr[@]}          # cantidad de elementos
${!arr[@]}          # índices

# agregar
arr+=("nuevo")

# eliminar y reindexar
unset arr[2]
arr=("${arr[@]}")
```

---

## Redirección y pipes

```bash
echo "texto" > archivo.txt      # escribe (sobreescribe)
echo "más"  >> archivo.txt      # agrega (append)
cat $1 $2   > concatenados.txt  # concatenar archivos

echo $(date) > fecha.txt        # guardar salida de comando
echo $(pwd)  > actual.txt

ls | sort -n                    # pipe: salida de ls → entrada de sort
ls | wc -l                      # contar archivos
```

---

## Comandos útiles

| Comando | Uso | Ejemplo del repo |
|---------|-----|-----------------|
| `echo` | imprimir | `echo $nombre` |
| `read` | leer input | `read nombre` |
| `date` | fecha actual | `echo $(date) > fecha.txt` |
| `pwd` | directorio actual | `echo $(pwd) > actual.txt` |
| `mkdir -p` | crear directorio (y padres) | `mkdir -p originales/` |
| `cp` | copiar archivo | `cp "$archivo" procesadas/$padron.txt` |
| `basename` | nombre de archivo sin ruta | `basename "$archivo"` |
| `head -1` | primera línea | `head -1 "$archivo"` |
| `cat` | mostrar / concatenar | `cat $1 $2 > resultado.txt` |
| `ls -s` | listar con tamaño | `ls -s \| sort -n` |
| `sort -n` | ordenar numéricamente | `\| sort -n` |
| `awk '{print $2}'` | extraer columna | `ls -s \| sort -n \| awk '{print $2}'` |
| `wc -l` | contar líneas | `ls \| wc -l` |
| `grep -qE` | match silencioso (sin output) | validación en `procesar()` |
| `grep -oE` | extraer solo el match | extraer padrón con `[0-9]{6}` |
| `sed -i` | modificar archivo in-place | eliminar primera línea en `procesar()` |

---

## Primos (ej24) — patrón de verificación

```bash
for ((i=2; i<=num; i++)); do
    es_primo=true
    for ((j=2; j<i; j++)); do
        if (( i % j == 0 )); then
            es_primo=false
            continue
        fi
    done
    if $es_primo; then
        echo $i >> primos.txt
    fi
done
```

---

## Ejercicio integrador — gestionar_entregas.sh

### Estructura general

```bash
ACCION=$1
DIRECTORIO=$2

funcion() {
    local var=$1
    # lógica
}

case $ACCION in
    inicializar) inicializar "$DIRECTORIO";;
    procesar)    procesar    "$DIRECTORIO";;
    burlarme)    burlarme    "$DIRECTORIO";;
    *)
        echo "Acción no válida"
        exit 1;;
esac
exit 0
```

### inicializar — crear estructura de carpetas

```bash
inicializar() {
    local directorio_padre=$1
    for directorio in "$directorio_padre/originales" "$directorio_padre/procesadas" "$directorio_padre/burlas"; do
        if [ -d "$directorio" ]; then
            echo "El directorio $directorio ya existe"
        else
            mkdir -p "$directorio"
            echo "Se creó correctamente $directorio"
        fi
    done
}
```

### procesar — validar y clasificar archivos

```bash
procesar() {
    local directorio=$1
    local regex="^Alumno: [A-Za-z]+, [A-Za-z]+ - Padron: [0-9]{6}$"

    for archivo in "$directorio/originales"/*.txt; do
        local primera_linea=$(head -1 "$archivo")
        local nombre_archivo=$(basename "$archivo")

        if echo "$primera_linea" | grep -qE "$regex"; then
            echo "OK: $nombre_archivo"
        else
            echo "Error: $nombre_archivo no cumple el formato"
            continue                        # caso inválido → continue
        fi

        local padron=$(echo "$primera_linea" | grep -oE "[0-9]{6}")
        cp "$archivo" "$directorio/procesadas/${padron}.txt"
        sed -E -i "/$regex/d" "$directorio/procesadas/${padron}.txt"
    done
}
```

> 💡 `grep -qE` no imprime nada, solo devuelve exit code 0/1 → ideal para `if`.
> 💡 `grep -oE "[0-9]{6}"` extrae solo el padrón de la primera línea.
> 💡 `sed -i "/patron/d"` elimina la línea que matchea el patrón en el archivo.

### burlarme — reemplazar vocales

```bash
burlarme() {
    local directorio=$1
    for archivo in "$directorio/procesadas"/*.txt; do
        local nombre=$(basename "$archivo")
        sed 's/[aeou]/i/g; s/[AEOU]/I/g' "$archivo" > "$directorio/burlas/$nombre"
    done
}
```

> 💡 `sed 's/.../i/g; s/.../I/g'` encadena dos sustituciones en un solo comando.
> 💡 La `i`/`I` no se toca — por eso los rangos son `[aeou]` y `[AEOU]` sin incluir `i`.

---

*Introducción al Desarrollo de Software · Cátedra Camejo · FIUBA · 2026*

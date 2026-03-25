# 🔍 Regex Cheatsheet — Cátedra Camejo FIUBA 2026

---

## grep

```bash
grep [opciones] "patron" archivo
```

| Opción | Qué hace |
|--------|----------|
| `-E` | Regex extendida (habilita `+`, `?`, `{n}`, `\b`, `\w`, `\s`) |
| `-P` | PCRE/Perl (habilita `\d`, lookaheads, lookbehinds) |
| `-o` | Imprime **solo** el fragmento que matchea (no la línea completa) |
| `-i` | Ignora mayúsculas/minúsculas |
| `-n` | Muestra número de línea |
| `-w` | Matchea palabra completa |
| `-v` | Líneas que **NO** coinciden |
| `-r` | Búsqueda recursiva en directorio |
| `-c` | Cuenta líneas que coinciden |
| `-l` | Solo nombres de archivos con coincidencias |
| `-q` | Silencioso — solo devuelve exit code (ideal para `if`) |
| `--color` | Resalta el match en la terminal |

> ⚠️ `-E` y `-P` no se combinan. Si necesitás `\d` o lookaheads, usá `-P`.

---

## sed

```bash
sed 's/patron/reemplazo/' archivo        # sustituye primera ocurrencia por línea
sed 's/patron/reemplazo/g' archivo       # sustituye todas (flag g)
sed 's/patron/reemplazo/I' archivo       # ignora case (flag I)
sed 's/p1/r1/g; s/p2/r2/g' archivo      # múltiples sustituciones en un comando
sed -e 's/p1/r1/' -e 's/p2/r2/' archivo # ídem con -e
sed -i 's/patron/reemplazo/g' archivo   # modifica el archivo in-place
sed -i '/patron/d' archivo              # elimina líneas que matchean (in-place)
```

> ⚠️ Sin `-i`, sed **solo imprime** — no modifica el archivo.
> ⚠️ `-i` con `/patron/d` elimina la línea del patrón en el archivo real.

### Swap con variable auxiliar (truco de la cátedra)
```bash
sed -e 's/Gonzalo Martinez Sastre/_aux_/Ig' \
    -e 's/Nicolas Riedel/Gonzalo Martinez Sastre/Ig' \
    -e 's/_aux_/Nicolas Riedel/g' notas.csv
```
> Equivalente al swap con variable auxiliar en programación.

---

## Tokens

| Token | Qué matchea |
|-------|-------------|
| `.` | Cualquier carácter (excepto newline) |
| `\n` | Salto de línea |
| `\t` | Tab |
| `\s` | Espacio en blanco (espacio, tab, newline) |
| `\S` | Todo lo que **no** es espacio en blanco |
| `\w` | Carácter de palabra (`[a-zA-Z0-9_]`) |
| `\W` | Todo lo que **no** es carácter de palabra |
| `\b` | Límite de palabra (entre `\w` y `\W`) |
| `\B` | Todo lo que **no** es límite de palabra |
| `^` | Inicio de línea |
| `$` | Fin de línea |
| `\d` | Dígito `[0-9]` — **solo con `-P`** |

---

## Rangos y negación

```bash
[a-z]       # cualquier letra minúscula
[A-Z]       # cualquier letra mayúscula
[0-9]       # cualquier dígito
[a-zA-Z]    # cualquier letra
[a-zA-Z0-9] # alfanumérico
[^,]        # cualquier carácter que NO sea coma
[^aeiou]    # cualquier carácter que no sea vocal
```

> ⚠️ Error común: `[a-zA-z]` (z minúscula al final) — mal rango, siempre `[a-zA-Z]`.

---

## Cuantificadores

| Cuantificador | Qué matchea |
|---------------|-------------|
| `*` | 0 o más veces |
| `+` | 1 o más veces |
| `?` | 0 o 1 vez |
| `{n}` | exactamente n veces |
| `{n,m}` | entre n y m veces |

```bash
[0-9]{6}        # exactamente 6 dígitos (ej: padrón)
[A-Za-z]+       # una o más letras
[^,]*           # cero o más caracteres que no sean coma
.{14}           # exactamente 14 caracteres cualquiera
```

---

## OR y grupos

```bash
(gato|perro)        # matchea "gato" o "perro"
\b(p\w+)            # captura palabras que empiezan con p
(.).*\1             # mismo carácter al inicio y al final (backreference)
```

> 💡 `\1` hace referencia al primer grupo capturado `(...)` — usado en ej15.

---

## Anclaje

```bash
^L              # líneas que empiezan con L
!$              # líneas que terminan con !
^[A-Za-z0-9]+, # campo usuario alfanumérico (desde el inicio de línea)
,[^,]+$         # campo contraseña (desde la coma hasta fin de línea)
```

---

## Perl Assertions — PCRE (`grep -P`)

Las assertions **no consumen caracteres** — solo verifican sin avanzar el match.

### Lookahead — mirar hacia adelante

| Tipo | Sintaxis | Qué hace |
|------|----------|----------|
| Positivo | `(?=patron)` | Exige que `patron` **exista** más adelante |
| Negativo | `(?!patron)` | Exige que `patron` **NO exista** más adelante |

### Lookbehind — mirar hacia atrás

| Tipo | Sintaxis | Qué hace |
|------|----------|----------|
| Positivo | `(?<=patron)` | Exige que `patron` **exista** justo antes |
| Negativo | `(?<!patron)` | Exige que `patron` **NO exista** justo antes |

```bash
# extraer contraseña sin incluir la coma (lookbehind positivo)
grep -oP "(?<=,)[^,]+$" contraseñas.csv

# contraseñas seguras: lookaheads encadenados (todos desde el mismo punto)
grep -oP "(?<=,)(?=[^,]*[a-z])(?=[^,]*[A-Z])(?=[^,]*[0-9])(?=[^,]*[@$!%*?&#])[^,]+$" contraseñas.csv
```

> ⚠️ Requieren `-P`. No funcionan con `-E`.
> 📖 Fuente: https://www.geeksforgeeks.org/perl/perl-assertions-in-regex/

---

## Patrón para campos CSV

El truco para no "cruzar" la coma del separador:

```bash
# campo usuario (antes de la coma)
^[^,]*[condicion][^,]*,

# campo contraseña (después de la coma)
,[^,]*[condicion][^,]*$

# extraer solo el valor sin la coma → sed 's/,//'
# o directamente con lookbehind → grep -oP "(?<=,)..."
```

---

## Ejercicios resueltos — referencia rápida

| Ej | Qué busca | Patrón clave |
|----|-----------|--------------|
| 01 | letra `s` | `"s"` |
| 02 | cualquier carácter seguido de `o` | `".o"` |
| 03 | dígitos | `"[0-9]"` / `"\d"` con `-P` |
| 04 | punto literal | `"\."` |
| 05 | `c` al comienzo de palabra | `"\bc"` |
| 06 | palabras que empiezan con `p` | `"\bp\w+"` |
| 07 | líneas que empiezan con `L` | `"^L"` |
| 08 | líneas que terminan con `!` | `"!$"` |
| 09 | líneas con al menos un espacio | `" "` |
| 10 | mayúsculas o números 1–3 | `"[A-Z1-3]"` |
| 11 | usuarios con número | `"^[^,]*[0-9][^,]*,"` |
| 12 | usuarios con guión bajo | `"^[^,]*_[^,]*,"` |
| 13 | contraseñas alfanuméricas | `",[A-Za-z0-9]+$"` |
| 14 | usuarios alfanuméricos | `"^[A-Za-z0-9]+,"` |
| 15 | contraseñas que empiezan y terminan igual | `",(.).*\1$"` |
| 16 | contraseñas de exactamente 14 chars | `",.{14}$"` |
| 17 | contraseñas seguras (4 condiciones) | lookaheads encadenados con `-P` |

---

## Regex del ejercicio integrador

```bash
# validar formato de encabezado de entrega
"^Alumno: [A-Za-z]+, [A-Za-z]+ - Padron: [0-9]{6}$"

# extraer padrón (6 dígitos)
grep -oE "[0-9]{6}"

# eliminar línea con ese formato del archivo
sed -E -i "/^Alumno: .*/d" archivo.txt

# reemplazar vocales (burlarme)
sed 's/[aeou]/i/g; s/[AEOU]/I/g' archivo
```

---

## Tips y errores frecuentes

- `grep` sin `-o` → devuelve la línea completa → falsos positivos en CSVs
- Siempre usá `[^,]*` para quedarte dentro del campo en un CSV
- `\.` para matchear punto literal (`.` solo matchea cualquier carácter)
- `-E` para `+`, `{n}`, `\b`, `\w`; `-P` para `\d` y assertions
- `grep -qE "patron"` dentro de un `if` → silencioso, solo exit code
- `grep -oE` + `sed 's/,//'` = equivalente a `grep -oP "(?<=,)..."`

---

*Introducción al Desarrollo de Software · Cátedra Camejo · FIUBA · 2026*

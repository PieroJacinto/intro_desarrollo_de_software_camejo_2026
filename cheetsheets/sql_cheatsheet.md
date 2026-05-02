# 🗄️ SQL — Cátedra Camejo FIUBA 2026

---

## Conceptos clave

| Término | Definición |
|---------|-----------|
| **Base de datos** | Conjunto organizado de datos que se pueden acceder y manipular |
| **Tabla** | Estructura que almacena datos en filas y columnas |
| **Primary Key** | Columna que identifica de forma única cada fila. No puede repetirse ni ser nula |
| **Foreign Key** | Columna que referencia la PK de otra tabla para establecer relaciones |
| **SERIAL** | Tipo de dato que se autoincrementa automáticamente (PostgreSQL) |

---

## Crear y eliminar

```sql
-- Base de datos
CREATE DATABASE mi_base;
DROP DATABASE mi_base;

-- Tabla
CREATE TABLE personajes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ki INTEGER NOT NULL,
    raza_id INTEGER REFERENCES razas(id)   -- Foreign Key
);

-- Eliminar tabla
DROP TABLE personajes;
DROP TABLE personajes CASCADE;   -- elimina también las referencias

-- Vaciar tabla (mantiene estructura)
TRUNCATE TABLE personajes;

-- Modificar estructura
ALTER TABLE personajes ADD poder VARCHAR(50);
ALTER TABLE personajes DROP COLUMN poder;
```

---

## Insertar, actualizar, eliminar datos

```sql
-- Insertar un registro
INSERT INTO personajes (nombre, ki) VALUES ('Goku', 90000000);

-- Insertar varios
INSERT INTO personajes (nombre, ki) VALUES
    ('Vegeta', 85000000),
    ('Gohan',  70000000);

-- Actualizar
UPDATE personajes SET ki = 100000000 WHERE nombre = 'Goku';

-- Eliminar
DELETE FROM personajes WHERE id = 1;
```

---

## Consultas (SELECT)

```sql
-- Todo
SELECT * FROM personajes;

-- Columnas específicas
SELECT nombre, ki FROM personajes;

-- Filtrar
SELECT * FROM personajes WHERE ki > 50000000;
SELECT * FROM personajes WHERE nombre LIKE 'G%';   -- empieza con G
SELECT * FROM personajes WHERE id IN (1, 3, 4);    -- equivale a OR

-- Ordenar
SELECT * FROM personajes ORDER BY ki DESC;   -- mayor a menor
SELECT * FROM personajes ORDER BY nombre ASC;

-- Limitar
SELECT * FROM personajes ORDER BY ki DESC LIMIT 3;

-- Alias
SELECT nombre AS personaje, ki AS poder FROM personajes;
```

---

## Funciones de agregación

```sql
SELECT COUNT(*) FROM personajes;             -- contar
SELECT SUM(ki) FROM personajes;              -- sumar
SELECT AVG(ki) FROM personajes;              -- promedio
SELECT MAX(ki) FROM personajes;              -- máximo
SELECT MIN(ki) FROM personajes;              -- mínimo

-- Agrupar
SELECT raza_id, COUNT(*) AS total
FROM personajes
GROUP BY raza_id;

-- HAVING — filtrar grupos (como WHERE pero para grupos)
SELECT raza_id, AVG(ki) AS promedio
FROM personajes
GROUP BY raza_id
HAVING AVG(ki) > 50000000;
```

---

## JOINs

| Tipo | Devuelve |
|------|----------|
| **INNER JOIN** | Solo los registros que coinciden en ambas tablas |
| **LEFT JOIN** | Todos los de la izquierda + coincidencias (NULL si no hay) |
| **RIGHT JOIN** | Todos los de la derecha + coincidencias (NULL si no hay) |
| **FULL JOIN** | Todos de ambas tablas (NULL donde no haya coincidencia) |

```sql
-- INNER JOIN — estilo moderno (recomendado)
SELECT p.nombre, r.nombre
FROM personajes p
INNER JOIN razas r ON p.raza_id = r.id;

-- INNER JOIN — estilo viejo (equivalente)
SELECT p.nombre, r.nombre
FROM personajes p, razas r
WHERE p.raza_id = r.id;

-- LEFT JOIN — aparecen personajes sin raza con NULL
SELECT p.nombre, r.nombre
FROM personajes p
LEFT JOIN razas r ON p.raza_id = r.id;

-- JOIN con múltiples tablas (tabla intermedia N:N)
SELECT p.nombre, t.nombre
FROM personajes p
INNER JOIN personaje_tecnica pt ON p.id = pt.personaje_id
INNER JOIN tecnicas t ON t.id = pt.tecnica_id
WHERE p.nombre = 'Goku';

-- JOIN con filtros y orden
SELECT p.nombre, r.nombre
FROM personajes p
INNER JOIN razas r ON p.raza_id = r.id
WHERE p.ki > 50000000
ORDER BY r.nombre, p.nombre DESC;
```

> 💡 La condición `ON p.raza_id = r.id` le dice a SQL **cómo unir las tablas**.
> 💡 Con JOIN la condición de unión va en el `ON` y los filtros van en el `WHERE`.

---

## Subconsultas

```sql
-- Con WHERE
SELECT nombre, ki FROM personajes
WHERE ki > (SELECT AVG(ki) FROM personajes);

-- Con IN
SELECT nombre FROM albumes
WHERE banda_id IN (
    SELECT DISTINCT banda_id FROM conciertos_musicos
    WHERE concierto_id = 1
);

-- Con NOT IN
SELECT nombre FROM bandas
WHERE id NOT IN (
    SELECT DISTINCT banda_id FROM conciertos_musicos
);
```

---

## Docker + PostgreSQL

```yaml
# docker-compose.yml
services:
  db:
    image: postgres:17
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: mi_base
    volumes:
      - ./.volumes/postgres/data:/var/lib/postgresql/data
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql   # se ejecuta automático
    ports:
      - "5433:5432"   # usar 5433 si hay postgres local en 5432
```

```bash
docker compose up -d              # levantar
docker compose down               # bajar
docker ps                         # ver contenedores
rm -rf .volumes && docker compose up -d   # reiniciar limpio

# entrar a la DB
docker exec -it <nombre_contenedor> psql -U postgres -d mi_base

# comandos dentro de psql
\dt           # listar tablas
\d tabla      # describir tabla
\q            # salir
```

> ⚠️ El `init.sql` se ejecuta **solo la primera vez** que arranca el contenedor (cuando el volumen está vacío).
> ⚠️ Si ya hay datos en el volumen, el `init.sql` se ignora — borrar `.volumes` para forzarlo.

---

## Patrones frecuentes en parcial

```sql

-- Top N resultados
SELECT nombre, ranking FROM albumes
ORDER BY ranking ASC LIMIT 7;

-- DISTINCT — evitar repetidos
SELECT DISTINCT b.nombre FROM bandas b
JOIN albumes a ON b.id = a.banda_id
WHERE a.lanzamiento <= 1980;

-- Contar elementos por grupo
SELECT raza_id, COUNT(*) AS total
FROM personajes GROUP BY raza_id ORDER BY total DESC;
```

---

*Introducción al Desarrollo de Software · Cátedra Camejo · FIUBA · 2026*

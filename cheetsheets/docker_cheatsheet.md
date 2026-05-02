# 🐳 Docker — Cátedra Camejo FIUBA 2026

---

## ¿Qué es Docker?

Docker es una plataforma para crear, desplegar y ejecutar aplicaciones en **contenedores**. Un contenedor es un entorno aislado y reproducible que incluye todo lo necesario para correr una aplicación.

| Concepto | Descripción |
|---------|------------|
| **Imagen** | Plantilla de solo lectura para crear contenedores (ej: `postgres:17`) |
| **Contenedor** | Instancia en ejecución de una imagen |
| **Volumen** | Mecanismo para persistir datos fuera del contenedor |
| **docker-compose** | Herramienta para definir y correr múltiples contenedores |

---

## Comandos esenciales

```bash
# Imágenes
docker pull postgres:17           # bajar imagen
docker images                     # listar imágenes locales

# Contenedores
docker ps                         # contenedores corriendo
docker ps -a                      # todos (incluso detenidos)
docker start <nombre>             # arrancar contenedor detenido
docker stop <nombre>              # detener contenedor
docker rm <nombre>                # eliminar contenedor

# Logs e inspección
docker logs <nombre>              # ver logs del contenedor
docker inspect <nombre>           # info detallada

# Ejecutar comando dentro de un contenedor
docker exec -it <nombre> bash                         # abrir shell
docker exec -it <nombre> psql -U postgres -d mi_base  # abrir psql
```

---

## docker-compose

### Estructura básica

```yaml
services:
  db:
    image: postgres:17
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: dragon_ball
    volumes:
      - ./.volumes/postgres/data:/var/lib/postgresql/data
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql
    ports:
      - "5433:5432"
```

### Mapeo de volúmenes — sintaxis `local:contenedor`

```yaml
volumes:
  - ./init.sql:/docker-entrypoint-initdb.d/init.sql
# ↑ archivo local          ↑ ruta dentro del contenedor
```

### Mapeo de puertos — sintaxis `host:contenedor`

```yaml
ports:
  - "5433:5432"
# ↑ puerto en tu PC   ↑ puerto dentro del contenedor
```

> 💡 Usar `5433:5432` si ya tenés PostgreSQL instalado localmente en el puerto 5432.

---

## Comandos de docker-compose

```bash
docker compose up -d              # levantar en background
docker compose down               # bajar y eliminar contenedores
docker compose logs               # ver logs
docker compose ps                 # estado de los servicios

# Reiniciar limpio (borra datos del volumen)
docker compose down
rm -rf .volumes
docker compose up -d
```

---

## Estructura de proyecto con PostgreSQL

```
mi-proyecto/
├── docker-compose.yml
├── init.sql          ← CREATE TABLE + INSERT iniciales
└── .volumes/         ← se crea solo, contiene los datos de postgres
    └── postgres/
        └── data/
```

---

## init.sql — ejecución automática

El archivo `init.sql` mapeado a `/docker-entrypoint-initdb.d/` se ejecuta automáticamente **la primera vez** que arranca el contenedor (cuando el volumen está vacío).

```yaml
volumes:
  - ./init.sql:/docker-entrypoint-initdb.d/init.sql
```

> ⚠️ Si el volumen ya tiene datos, el `init.sql` se ignora.
> ⚠️ Para forzar que vuelva a ejecutarse: `rm -rf .volumes && docker compose up -d`

---

## Conectar DBeaver a PostgreSQL en Docker

| Campo | Valor |
|-------|-------|
| Host | localhost |
| Port | 5433 (o el que pusiste en `ports`) |
| Database | dragon_ball |
| Username | postgres |
| Password | postgres |

**Problemas frecuentes:**

- `FATAL: password authentication failed` → hay otro PostgreSQL local usando el puerto 5432. Solución: cambiar el puerto a `5433:5432` en el compose.
- `FATAL: invalid value for parameter "TimeZone"` → en DBeaver ir a `Window → Preferences → User interface → Regional settings` y cambiar Timezone a `UTC`.

---

## Ejemplo completo — DB Dragon Ball

```yaml
# docker-compose.yml
services:
  db:
    image: postgres:17
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: dragon_ball
    volumes:
      - ./.volumes/postgres/data:/var/lib/postgresql/data
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql
    ports:
      - "5433:5432"
```

```sql
-- init.sql — fragmento de ejemplo
CREATE TABLE planetas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    nivel_gravedad INTEGER NOT NULL
);

CREATE TABLE personajes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ki INTEGER NOT NULL,
    planeta_de_origen_id INTEGER REFERENCES planetas(id)
);

INSERT INTO planetas (nombre, nivel_gravedad) VALUES
    ('Tierra', 1),
    ('Vegeta', 10);

INSERT INTO personajes (nombre, ki, planeta_de_origen_id) VALUES
    ('Goku', 90000000, 1),
    ('Vegeta', 85000000, 2);
```

---

*Introducción al Desarrollo de Software · Cátedra Camejo · FIUBA · 2026*

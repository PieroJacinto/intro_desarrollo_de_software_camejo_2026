# 🏗️ Ingeniería de Software — Cátedra Camejo FIUBA 2026

---

## ¿Qué es el Software?

**Definición IEEE 729:** El software es el conjunto de programas de cómputo, procedimientos, reglas, documentación y datos asociados que forman parte de la operación de un sistema de computación.

> ⚠️ El software es la parte **intangible** de una computadora — no es hardware.

### Tipos de Software
| Tipo | Descripción |
|------|-------------|
| De sistema | Brinda servicios a otros programas (ej: SO) |
| De aplicación | Resuelve necesidades específicas del usuario |
| Científico/Ingeniería | Simulaciones, cálculos, investigación |
| Embebido | Integrado en dispositivos (autos, electro...) |
| De inteligencia artificial | Toma de decisiones y aprendizaje |

### ¿Qué hace a un buen software?
- ✅ Cumple su objetivo funcional
- ✅ Es usable y accesible
- ✅ Tiene buena performance
- ✅ Es mantenible en el tiempo
- ✅ Es confiable y seguro
- ❌ Tener licencia paga **NO** es una característica de calidad

---

## ¿Qué es la Ingeniería de Software?

Es la **aplicación de la ingeniería al proceso completo de creación de software**. Va desde que se identifica una necesidad hasta el despliegue y mantenimiento del sistema.

- Es **iterativa** e **incremental** (no lineal)
- Involucra a **todo el equipo**, no solo a líderes de proyecto
- Lo primero e imprescindible: **entender el problema**

---

## Etapas de la Ingeniería de Software

```
1. Análisis de Requerimientos
2. Diseño
3. Implementación
4. Testing y Validación
5. Despliegue
6. Mantenimiento
```

> ⚠️ "Análisis de datos" **NO** es una etapa de la IS.

---

## Etapa 1 — Análisis de Requerimientos

**Objetivo:** entender qué necesita el cliente. Permite construir el producto adecuado en lugar de construir bien un producto que no sirve.

> 💡 Es la etapa donde hay que poner **mayor esmero**. Si no se entienden las necesidades del cliente, no se entregará el software adecuado.

### Requerimientos funcionales vs no funcionales

| Tipo | Qué especifica | Ejemplos |
|------|---------------|----------|
| **Funcionales** | Lo que el sistema DEBE HACER | Registrar usuarios, enviar emails, calcular |
| **No funcionales** | CÓMO debe comportarse | Tiempo de respuesta, seguridad, usabilidad |

### Actividades
1. Indagación
2. Negociación
3. Especificación
4. Validación

---

## Etapa 2 — Diseño

A partir de los requerimientos se escoge la **arquitectura de software** más adecuada.

> *"Si crees que una buena arquitectura es cara, intentá con una mala."* — Brian Foote & Joseph Yoder

Un buen diseño permite construir un sistema **escalable, mantenible y confiable**.

---

## Etapa 3 — Implementación

Transformar los requerimientos en código. El proceso debe ser **organizado** — no basta con programar.

---

## Etapa 4 — Testing y Validación

| Concepto | Qué hace |
|----------|----------|
| **Validación** | Demuestra que el software cumple los requerimientos del cliente |
| **Verificación** | Encuentra errores de funcionamiento interno |

### Tipos de pruebas
| Tipo | Qué evalúa |
|------|-----------|
| Unitarias | Componentes o funciones individuales |
| Integración | Interacción entre módulos |
| Aceptación (UAT) | Realizadas por usuarios finales |
| Usabilidad | Experiencia del usuario, accesibilidad |

> ⚠️ Tener equipo de QA **no exime** a los desarrolladores de probar su propio código.

---

## Etapa 5 — Despliegue (Entornos)

```
Development → QA → Staging → Production
```

| Entorno | Rol |
|---------|-----|
| **Development** | Donde los devs escriben y prueban código inicialmente |
| **QA** | Pruebas exhaustivas antes de liberar |
| **Staging / Preproducción** | Replica producción — validaciones finales |
| **Production** | Disponible para usuarios finales. Estable y supervisado |

> ⚠️ **"Validation" NO es un entorno.** Los entornos son los 4 de arriba.
> ⚠️ **Nunca** deployar en producción sin haber validado antes.

---

## Etapa 6 — Mantenimiento

Una vez desplegado, el software sigue evolucionando:
- Surgen nuevos requerimientos
- Se descubren errores
- Cambia el negocio o el contexto

---

## Resumen para el parcial

| Pregunta | Respuesta |
|----------|-----------|
| ¿Qué NO es característica de la IS? | Que solo involucra líderes |
| ¿Qué es imprescindible antes de comenzar? | Entender el problema |
| ¿Qué NO hacer antes de validar? | Desplegar en producción |
| ¿Por qué validar el software? | Para asegurar que cumple requerimientos y expectativas del cliente |
| ¿En qué etapa hay mayor esmero? | Análisis de requerimientos |
| ¿Qué NO caracteriza al buen software? | Tener licencia paga |
| ¿Qué entorno NO existe? | "Validation" |
| ¿Cuál NO es etapa de la IS? | "Análisis de datos" |
| Objetivo del análisis de requerimientos | Entender el problema + construir el producto adecuado + comprender el alcance |
| La IS es... | Iterativa e incremental |

---

*Introducción al Desarrollo de Software · Cátedra Camejo · FIUBA · 2026*

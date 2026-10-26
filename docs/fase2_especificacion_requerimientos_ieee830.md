# FASE 2: ESPECIFICACIÓN DE REQUERIMIENTOS DE SOFTWARE (IEEE 830)
## Sistema de Biblioteca Digital

> **Estándar:** IEEE Std 830-1998 (Recommended Practice for Software Requirements Specifications)  
> **Programa:** Análisis y Desarrollo de Software (ADSO) — SENA  
> **Ficha:** 3239188 | **Centro:** CIES — Neiva  
> **Instructor:** Carlos Julio Cadena  
> **Equipo 08:** Juan David Romero Calderón, Juan Diego Oteca Pedreros, Jhojan Javier Melo Avella  

---

## 1. Introducción

### 1.1. Propósito
El presente documento tiene como objetivo formalizar y especificar detalladamente los requisitos técnicos y funcionales del **Sistema de Biblioteca Digital**, proporcionando una base rigurosa para las etapas de diseño UML, construcción y pruebas de aceptación. Está dirigido al equipo de desarrollo, al instructor evaluador Carlos Julio Cadena y al personal operativo de la biblioteca.

### 1.2. Ámbito del Producto
El sistema a desarrollar se denomina **Sistema de Biblioteca Digital (MVP)**. Su función principal consiste en centralizar la administración del inventario bibliográfico, el padrón de usuarios y el control de préstamos y devoluciones. 

- **Alcance Incluido (MVP):** Registro y consulta de libros y autores, administración de usuarios, control de disponibilidad en tiempo real, emisión de préstamos, recepción de devoluciones y actualización/baja de registros (RF-01 a RF-08).
- **Límites y Exclusiones Formales (Won't Have):** El sistema no contempla pasarelas de pago, autenticación por contraseñas/roles (Login), integración con lectores ópticos de códigos de barras ni despacho automatizado de correos electrónicos.

### 1.3. Definiciones, Acrónimos y Abreviaturas
- **MVP (Minimum Viable Product):** Versión funcional inicial que satisface las necesidades operativas esenciales del negocio.
- **CLI (Command Line Interface):** Interfaz basada en texto y consola para captura y visualización de datos.
- **POO:** Programación Orientada a Objetos.
- **ArrayList:** Estructura de datos dinámica en Java para gestión de colecciones en memoria principal.
- **ISBN (International Standard Book Number):** Identificador comercial único de libros.
- **ORCID / ISNI:** Códigos estandarizados internacionales para la identificación unívoca de autores e investigadores.
- **Trazabilidad:** Correspondencia bidireccional demostrable entre historias de usuario, requerimientos y componentes de software.

### 1.4. Referencias Normativas
- Estándar IEEE 830-1998: *Especificación de Requisitos de Software*.
- Documento de Proyecto: *Fase 1 — Épicas e Historias de Usuario (Grupo 08)*.
- Lineamientos Curriculares del Programa ADSO (SENA).

---

## 2. Descripción General

### 2.1. Perspectiva del Producto
El software es un sistema autónomo, modular y desacoplado, diseñado para ejecutarse en un entorno local. Administra los datos en memoria mediante estructuras dinámicas de Java, sirviendo como la fuente única de verdad para el bibliotecario y reemplazando los sistemas manuales en papel.

### 2.2. Funciones Principales del Sistema
- **Catalogación:** Registrar, clasificar y mantener ejemplares bibliográficos y sus autores.
- **Padrón de Usuarios:** Registrar usuarios y verificar su estado de habilitación para el servicio.
- **Monitoreo de Disponibilidad:** Consultar al instante si un ejemplar se encuentra en estantería o en préstamo.
- **Operaciones de Salida (Préstamos):** Asignar libros disponibles a usuarios activos con fecha límite calculada.
- **Operaciones de Entrada (Devoluciones):** Reintegrar libros prestados, verificando el cumplimiento de los plazos.
- **Mantenimiento del Catálogo:** Modificar metadatos o desincorporar libros no comprometidos en préstamos.

### 2.3. Características de los Usuarios
| Rol | Nivel Técnico | Responsabilidades en el Sistema |
| :--- | :--- | :--- |
| **Bibliotecario** | Intermedio (operador de consola) | Ejecuta la totalidad de operaciones del MVP: altas de autores, libros y usuarios; consulta y transacciones de préstamo/devolución; edición y baja de inventario. |

### 2.4. Restricciones Generales del Sistema
- **RS-01 (Plataforma y Almacenamiento):** Desarrollado exclusivamente en lenguaje **Java**, gestionando colecciones en memoria (`ArrayList`) sin dependencia de motores de bases de datos relacionales en esta versión.
- **RS-02 (Interfaz Operativa):** Ejecución confinada a la **consola de comandos (CLI)** estructurada en menús numéricos interactivos.
- **RS-03 (Concurrencia):** Operación monousuario secuencial; el sistema asume un único operador en la estación de trabajo.
- **RS-04 (Correspondencia Unívoca de Inventario):** Para el alcance del MVP, se establece una relación unívoca 1:1 entre el registro bibliográfico catalogado (`Libro`/`ISBN`) y el ejemplar físico en anaquel. Cada registro representa un único ejemplar físico en existencia. La administración de múltiples volúmenes o copias físicas asociadas a un mismo ISBN se delega a iteraciones posteriores (HU-13).

---

## 3. Requisitos Específicos

### 3.1. Requisitos Funcionales (RF)

---

#### 📌 RF-01: Registro de Libros
- **Identificador:** RF-01 (Mapeado a HU-01).
- **Actores:** Bibliotecario.
- **Precondiciones:** El autor del libro debe estar previamente registrado en el sistema.
- **Flujo Normal:**
  1. El bibliotecario selecciona la opción "Registrar libro".
  2. El sistema solicita: ID numérico, título, identificador del autor, año de publicación, ISBN y categoría.
  3. El bibliotecario suministra la información.
  4. El sistema valida que el ID y el ISBN no existan previamente en el catálogo (RN-01).
  5. El sistema comprueba que el identificador del autor corresponda a un autor registrado.
  6. El sistema crea el libro con el estado `disponible = true`.
  7. El sistema almacena el objeto en memoria y emite `"Libro registrado correctamente"`.
- **Flujos de Excepción:**
  - *Campo Obligatorio Vacío:* Si se omite algún dato, el sistema emite `"Campo obligatorio"` y solicita nuevamente el ingreso.
  - *ISBN Duplicado:* Si el ISBN ya existe, el sistema bloquea el guardado con `"Registro ISBN existente"`.
  - *Autor Inexistente:* Si el código de autor no existe, el sistema advierte `"Autor no registrado en el sistema"`.

---

#### 📌 RF-02: Registro de Autores
- **Identificador:** RF-02 (Mapeado a HU-02).
- **Actores:** Bibliotecario.
- **Precondiciones:** Ninguna.
- **Flujo Normal:**
  1. El bibliotecario selecciona "Registrar autor".
  2. El sistema solicita: código identificador (ORCID/ISNI), nombre completo y nacionalidad.
  3. El bibliotecario ingresa los datos.
  4. El sistema valida que el identificador sea único (RN-02).
  5. El sistema almacena al autor y emite `"Autor registrado correctamente"`.
- **Flujos de Excepción:**
  - *Identificación Insuficiente:* Si falta el identificador o el nombre, emite `"Identificación mínima insuficiente"`.
  - *Identificador Duplicado:* Si el identificador ya existe, emite `"Este identificador ya se encuentra registrado para otro autor"`.

---

#### 📌 RF-03: Registro de Usuarios
- **Identificador:** RF-03 (Mapeado a HU-03).
- **Actores:** Bibliotecario.
- **Precondiciones:** Ninguna.
- **Flujo Normal:**
  1. El bibliotecario selecciona "Registrar usuario".
  2. El sistema solicita: número de documento de identidad, nombre completo y teléfono de contacto.
  3. El bibliotecario introduce los datos requeridos.
  4. El sistema verifica que el documento de identidad no exista previamente (RN-03).
  5. El sistema almacena al usuario con el estado inicial `activo = true`.
  6. El sistema muestra `"Usuario registrado exitosamente"`.
- **Flujos de Excepción:**
  - *Campo Obligatorio Vacío:* Si algún dato queda en blanco, el sistema notifica `"Campo obligatorio"`.
  - *Documento Duplicado:* Si el documento ya se encuentra registrado, emite `"Este documento ya se encuentra registrado"`.

---

#### 📌 RF-04: Consulta de Disponibilidad de Libros
- **Identificador:** RF-04 (Mapeado a HU-04).
- **Actores:** Bibliotecario.
- **Precondiciones:** Catálogo con al menos un libro ingresado.
- **Flujo Normal:**
  1. El bibliotecario ingresa el ID numérico o el título del libro.
  2. El sistema busca el ejemplar en memoria.
  3. Si el libro tiene `disponible == true`, el sistema muestra `"Disponible"` junto con los detalles de la obra.
- **Flujos Alternativos:**
  - *Ejemplar Prestado:* Si el libro tiene `disponible == false`, el sistema indica `"No disponible (En Préstamo)"` y despliega la fecha estimada de retorno.
- **Flujos de Excepción:**
  - *Libro Inexistente:* Si no se encuentra coincidencia, el sistema emite `"Libro no encontrado en el inventario"`.

---

#### 📌 RF-05: Préstamo de Libros
- **Identificador:** RF-05 (Mapeado a HU-05).
- **Actores:** Bibliotecario.
- **Precondiciones:** Existe al menos un usuario activo y un libro disponible.
- **Flujo Normal:**
  1. El bibliotecario selecciona "Prestar libro".
  2. El sistema solicita el ID del libro, el documento del usuario y los días de duración del préstamo.
  3. El sistema valida que el usuario exista y tenga estado `activo == true` (RN-04).
  4. El sistema verifica que el libro exista y tenga `disponible == true`.
  5. El sistema calcula la fecha de vencimiento (`fechaPrestamo + dias`).
  6. El sistema cambia el estado del libro a `disponible = false`.
  7. El sistema instancia el objeto de préstamo con estado `"Activo"`, lo agrega a la lista de préstamos y muestra `"Préstamo registrado exitosamente"`.
- **Flujos de Excepción:**
  - *Usuario Inhabilitado:* Si el usuario tiene `activo == false`, el sistema bloquea el préstamo con `"Usuario no habilitado para préstamos"`.
  - *Libro Prestado:* Si el libro ya está prestado, emite `"El libro seleccionado no cuenta con existencias disponibles para préstamo"`.

---

#### 📌 RF-06: Registro de Devoluciones
- **Identificador:** RF-06 (Mapeado a HU-06).
- **Actores:** Bibliotecario.
- **Precondiciones:** Existe un préstamo activo vinculado al libro.
- **Flujo Normal:**
  1. El bibliotecario selecciona "Registrar devolución" e ingresa el ID del préstamo o del libro.
  2. El sistema localiza el préstamo activo correspondiente.
  3. El sistema coteja la fecha actual contra la fecha límite del préstamo.
  4. Si la entrega se realiza dentro del plazo, el préstamo se marca como `"Devuelto"` y el libro pasa a `disponible = true`.
  5. El sistema muestra `"Devolución registrada a tiempo"`.
- **Flujos Alternativos:**
  - *Devolución Tardía:* Si la fecha actual es posterior a la fecha límite acordada, el sistema cierra el préstamo, restablece el libro a `"Disponible"` y emite la alerta visual `"Devolución registrada con retraso"`.
- **Flujos de Excepción:**
  - *Préstamo No Encontrado:* Si no hay préstamo activo para el libro, muestra `"No existe un préstamo activo para este libro"`.

---

#### 📌 RF-07: Búsqueda de Libros
- **Identificador:** RF-07 (Mapeado a HU-07).
- **Actores:** Bibliotecario.
- **Precondiciones:** Catálogo con registros existentes.
- **Flujo Normal:**
  1. El bibliotecario introduce un término de búsqueda (título, autor o ISBN).
  2. El sistema filtra la colección en memoria evaluando coincidencias.
  3. El sistema imprime en pantalla la lista detallada de libros encontrados.
- **Flujos de Excepción:**
  - *Sin Coincidencias:* Si no hay resultados que coincidan con el término, el sistema emite `"No encontrado"`.

---

#### 📌 RF-08: Edición y Eliminación de Registros
- **Identificador:** RF-08 (Mapeado a HU-08).
- **Actores:** Bibliotecario.
- **Precondiciones:** El libro objeto de la acción existe en el catálogo.
- **Flujo Normal (Edición):**
  1. El bibliotecario ingresa el ID del libro y visualiza sus datos.
  2. Modifica título, autor o categoría y guarda.
  3. El sistema actualiza los atributos y muestra `"Libro actualizado correctamente"`.
- **Flujo Alternativo (Eliminación / Baja):**
  1. El bibliotecario selecciona eliminar el libro mediante su ID.
  2. El sistema valida que el libro posea estado `disponible == true` (RN-05).
  3. El sistema ejecuta una **baja lógica** (`UPDATE books SET is_deleted = true`) y confirma `"Libro dado de baja del catálogo"`. El registro se conserva en base de datos para auditoría de historial de préstamos.
- **Flujos de Excepción:**
  - *Eliminación Denegada por Préstamo Vigente:* Si el libro tiene `disponible == false`, el sistema cancela la operación con la alerta `"No se puede eliminar un libro que tiene un préstamo activo"`.

---

### 3.2. Requisitos No Funcionales (RNF)

| Código | Categoría | Descripción Técnica |
| :---: | :--- | :--- |
| **RNF-01** | **Mantenibilidad y Arquitectura** | El sistema debe construirse aplicando rigurosamente los principios de la Programación Orientada a Objetos: encapsulamiento (atributos privados con getters/setters), separación por capas (modelo de dominio, servicios de negocio y vistas de consola). |
| **RNF-02** | **Confiabilidad y Validación** | El sistema debe validar todas las entradas de usuario por consola (parseo seguro de enteros, control de cadenas vacías o nulas) para prevenir excepciones no controladas (`InputMismatchException`, `NullPointerException`) y garantizar que la aplicación no sufra cierres abruptos. |
| **RNF-03** | **Usabilidad** | La interfaz de consola debe presentar menús organizados jerárquicamente, con numeración clara, confirmaciones de éxito y mensajes de error explícitos y uniformes con los criterios de aceptación. |
| **RNF-04** | **Rendimiento** | Las operaciones de búsqueda, filtrado y actualización sobre las estructuras en memoria (`ArrayList`) deben ejecutarse con un tiempo de respuesta menor a 0.5 segundos para catálogos de hasta 1.000 registros. |

---

### 3.3. Reglas de Negocio (RN)

| Código | Regla de Negocio | Impacto en el Sistema |
| :---: | :--- | :--- |
| **RN-01** | **Unicidad del ISBN** | Cada libro debe poseer un ISBN irrepetible en el catálogo general. Bajo la restricción RS-04, cada registro de ISBN representa un único ejemplar físico en inventario. |
| **RN-02** | **Unicidad del Identificador de Autor** | El código normalizado (ORCID/ISNI) del autor es único y no puede duplicarse. |
| **RN-03** | **Unicidad del Documento de Usuario** | El documento de identidad de cada usuario registrado debe ser estrictamente único. |
| **RN-04** | **Habilitación de Préstamos en MVP** | Un usuario únicamente puede recibir un préstamo si su estado en el sistema es `activo == true`. *(El bloqueo automatizado por acumulación de moras se reserva para el Sprint posterior HU-10)*. |
| **RN-05** | **Integridad de Ejemplares en Préstamo** | Queda estrictamente prohibido dar de baja cualquier libro con estado `"No disponible"` (`disponible == false`, préstamo activo). La baja de un libro disponible se implementa como **baja lógica** (`is_deleted = true`), preservando el historial de préstamos. El libro desaparece del catálogo activo pero sus registros en `loans` se conservan para auditoría. |

---

## 4. Matriz de Trazabilidad Bidireccional

Esta matriz asegura una correspondencia matemática y exhaustiva entre el análisis de negocio (Fase 1) y la especificación formal de requerimientos (Fase 2):

| Historia de Usuario (Fase 1) | Requisito Funcional (RF) | Regla de Negocio (RN) | Criterios de Aceptación Cubiertos | Requisito No Funcional Asociado |
| :--- | :---: | :---: | :--- | :---: |
| **HU-01 (Registrar Libros)** | RF-01 | RN-01 | CA-1, CA-2, CA-3 | RNF-01, RNF-02, RNF-03 |
| **HU-02 (Registrar Autores)** | RF-02 | RN-02 | CA-1, CA-2, CA-3 | RNF-01, RNF-02 |
| **HU-03 (Registrar Usuarios)** | RF-03 | RN-03 | CA-1, CA-2, CA-3 | RNF-01, RNF-02 |
| **HU-04 (Consultar Disponibilidad)** | RF-04 | — | CA-1, CA-2, CA-3 | RNF-03, RNF-04 |
| **HU-05 (Prestar Libros)** | RF-05 | RN-04 | CA-1, CA-2, CA-3 | RNF-01, RNF-02 |
| **HU-06 (Registrar Devoluciones)** | RF-06 | — | CA-1, CA-2, CA-3 | RNF-01, RNF-03 |
| **HU-07 (Buscar Libros)** | RF-07 | — | CA-1, CA-2 | RNF-03, RNF-04 |
| **HU-08 (Editar y Eliminar)** | RF-08 | RN-05 | CA-1, CA-2, CA-3 | RNF-01, RNF-02 |

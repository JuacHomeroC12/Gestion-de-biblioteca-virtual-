# FASE 1: ÉPICAS E HISTORIAS DE USUARIO
## Sistema de Biblioteca Digital

> **Programa:** Análisis y Desarrollo de Software (ADSO) — SENA  
> **Ficha:** 3239188 | **Centro:** Centro de la Industria, la Empresa y los Servicios (CIES) — Neiva  
> **Instructor:** Carlos Julio Cadena  
> **Equipo 08:** Juan David Romero Calderón, Juan Diego Oteca Pedreros, Jhojan Javier Melo Avella  

---

## 1. Planteamiento del Problema

La biblioteca no cuenta con un mecanismo unificado que relacione en tiempo real el estado de un ejemplar con su usuario responsable, lo que convierte cada consulta simple —¿está disponible este libro?, ¿quién lo tiene?, ¿desde cuándo?— en una tarea que exige cruzar manualmente fichas, cuadernos o planillas dispersas. 

Esta desconexión entre registros genera tres efectos críticos:
1. **Incertidumbre en inventario:** El bibliotecario no puede confirmar con certeza si un ejemplar está en anaquel, prestado o extraviado, lo que deriva en préstamos duplicados o promesas de disponibilidad no cumplidas.
2. **Falta de control de plazos:** Al no existir una fecha de vencimiento vinculada automáticamente a cada préstamo, la identificación de devoluciones atrasadas depende de revisiones manuales, detectando los retrasos tarde o no detectándolos.
3. **Ausencia de trazabilidad histórica:** La falta de un historial trazable por usuario y por ejemplar dificulta establecer responsabilidades cuando un libro se pierde o se deteriora.

---

## 2. Objetivo General

Desarrollar un **Producto Mínimo Viable (MVP)** de un sistema de gestión bibliotecaria por consola (CLI) que centralice el registro de ejemplares, autores, usuarios y préstamos en una única fuente de verdad en memoria, de modo que el estado de disponibilidad de cada libro y la vigencia de cada préstamo puedan consultarse de forma inmediata, reduciendo el tiempo operativo del bibliotecario y eliminando el margen de error en el inventario.

---

## 3. Épicas del Sistema

| Código | Épica | Descripción | Historias Asociadas |
| :---: | :--- | :--- | :--- |
| **EP-01** | **Gestión del Catálogo** | Registro, consulta, catalogación y búsqueda de libros y autores. | HU-01, HU-02, HU-04, HU-07 |
| **EP-02** | **Gestión de Usuarios** | Registro y habilitación de usuarios receptores de servicios de préstamo. | HU-03 |
| **EP-03** | **Gestión de Préstamos y Devoluciones** | Control transaccional de salidas, recepciones y verificación de disponibilidad. | HU-05, HU-06, HU-09 |
| **EP-04** | **Gestión de Penalizaciones** | Monitoreo y registro de sanciones derivadas de devoluciones extemporáneas. | HU-10 |
| **EP-05** | **Administración y Control de Registros** | Modificación, actualización y baja física controlada de libros en el catálogo. | HU-08 |

---

## 4. Backlog de Historias de Usuario

### 4.1. Historias Prioritarias para el MVP (Must Have — Sprint 1)

---

#### 🟢 HU-01: Registrar Libros
- **Como:** Bibliotecario.
- **Quiero:** Agregar un nuevo libro al catálogo indicando su ID numérico, título, autor registrado, año de publicación, ISBN y categoría temática.
- **Para:** Incorporarlo formalmente al inventario disponible para préstamo.
> **Nota de Alcance e Inventario (MVP):** Conforme al alcance del Sprint 1, cada registro de libro representa simultáneamente la obra y su único ejemplar físico en biblioteca (1 ISBN = 1 Ejemplar). La administración de múltiples copias físicas por ISBN se contempla para iteraciones futuras (HU-13).
- **Criterios de Aceptación (Gherkin):**
  - **CA-1 (Registro Exitoso):**  
    *Dado que* el bibliotecario ingresa los datos completos y válidos (ID único, título, autor existente, año de publicación, ISBN único y categoría),  
    *Cuando* confirma la operación de guardado,  
    *Entonces* el libro se almacena en memoria con el estado inicial `"Disponible"` y se emite el mensaje `"Libro registrado correctamente"`.
  - **CA-2 (Campos Obligatorios Incompletos):**  
    *Dado que* el bibliotecario intenta guardar un libro omitiendo cualquier campo requerido (título, autor, año o ISBN),  
    *Cuando* solicita el guardado,  
    *Entonces* el sistema rechaza la transacción y muestra el mensaje `"Campo obligatorio"`.
  - **CA-3 (ISBN Duplicado - RN-01):**  
    *Dado que* el bibliotecario ingresa un código ISBN que ya pertenece a otro libro en el catálogo,  
    *Cuando* confirma el registro,  
    *Entonces* el sistema bloquea el almacenamiento y muestra la alerta `"Registro ISBN existente"`.

---

#### 🟢 HU-02: Registrar Autores
- **Como:** Bibliotecario.
- **Quiero:** Registrar a un autor con su código identificador normalizado (ORCID, ISNI o ResearcherID), su nombre completo y su nacionalidad.
- **Para:** Asociarlo fidedignamente a las obras del catálogo bibliográfico.
- **Criterios de Aceptación (Gherkin):**
  - **CA-1 (Registro Exitoso):**  
    *Dado que* el bibliotecario ingresa un identificador válido no registrado, el nombre completo y la nacionalidad del autor,  
    *Cuando* confirma el registro,  
    *Entonces* el sistema almacena al autor en la lista general y muestra `"Autor registrado correctamente"`.
  - **CA-2 (Identificación Insuficiente):**  
    *Dado que* el bibliotecario intenta registrar un autor dejando el identificador o el nombre en blanco,  
    *Cuando* presiona confirmar,  
    *Entonces* el sistema detiene el proceso y muestra `"Identificación mínima insuficiente"`.
  - **CA-3 (Identificador Duplicado - RN-02):**  
    *Dado que* el bibliotecario ingresa un código de autor ya existente en el sistema,  
    *Cuando* intenta guardar,  
    *Entonces* el sistema impide la duplicación y emite `"Este identificador ya se encuentra registrado para otro autor"`.

---

#### 🟢 HU-03: Registrar Usuarios
- **Como:** Bibliotecario.
- **Quiero:** Dar de alta a un usuario registrando su número de documento de identidad, nombre completo y número de teléfono.
- **Para:** Habilitarlo en el sistema para que pueda solicitar préstamos bibliotecarios.
- **Criterios de Aceptación (Gherkin):**
  - **CA-1 (Registro Exitoso):**  
    *Dado que* el bibliotecario introduce un documento no registrado, nombre y teléfono válidos,  
    *Cuando* confirma la creación del usuario,  
    *Entonces* el sistema lo guarda con el estado `"Activo"` (`activo = true`) y notifica `"Usuario registrado exitosamente"`.
  - **CA-2 (Campos Vacíos):**  
    *Dado que* se omite cualquiera de los datos del usuario,  
    *Cuando* se intenta guardar,  
    *Entonces* el sistema emite la alerta `"Campo obligatorio"`.
  - **CA-3 (Documento Duplicado - RN-03):**  
    *Dado que* el documento de identidad ingresado ya se encuentra asignado a otro usuario registrado,  
    *Cuando* se procesa el alta,  
    *Entonces* el sistema bloquea el guardado y muestra `"Este documento ya se encuentra registrado"`.

---

#### 🟢 HU-04: Consultar Disponibilidad de Libros
- **Como:** Bibliotecario.
- **Quiero:** Verificar el estado de disponibilidad física de un libro mediante su ID o título.
- **Para:** Conocer al instante si el ejemplar puede prestarse de inmediato.
- **Criterios de Aceptación (Gherkin):**
  - **CA-1 (Ejemplar en Anaquel):**  
    *Dado que* el bibliotecario consulta un libro cuyo estado es `disponible == true`,  
    *Cuando* el sistema procesa la consulta,  
    *Entonces* muestra el estado `"Disponible"` junto con los detalles del ejemplar.
  - **CA-2 (Ejemplar en Préstamo):**  
    *Dado que* el libro consultado se encuentra actualmente prestado (`disponible == false`),  
    *Cuando* se evalúa su estado,  
    *Entonces* el sistema muestra `"No disponible (En Préstamo)"` e indica la fecha límite de devolución esperada.
  - **CA-3 (Libro No Existente):**  
    *Dado que* se ingresa un código o título que no existe en el catálogo,  
    *Cuando* se efectúa la búsqueda,  
    *Entonces* el sistema devuelve el mensaje `"Libro no encontrado en el inventario"`.

---

#### 🟢 HU-05: Prestar Libros
- **Como:** Bibliotecario.
- **Quiero:** Generar un préstamo asignando un libro disponible a un usuario activo, definiendo los días de plazo.
- **Para:** Formalizar la salida del material y garantizar la fecha límite de retorno.
- **Criterios de Aceptación (Gherkin):**
  - **CA-1 (Préstamo Exitoso):**  
    *Dado que* el bibliotecario selecciona a un usuario con estado `"Activo"` y un libro con estado `"Disponible"`,  
    *Cuando* se confirman los días de préstamo,  
    *Entonces* el estado del libro cambia a `"No disponible"` (`false`), se genera un registro de préstamo con fecha límite y se notifica `"Préstamo registrado exitosamente"`.
  - **CA-2 (Usuario Inactivo o Inhabilitado - RN-04):**  
    *Dado que* el usuario seleccionado figura inactivo en el sistema (`activo == false`),  
    *Cuando* se intenta generar el préstamo,  
    *Entonces* el sistema rechaza la solicitud y emite `"Usuario no habilitado para préstamos"`.
  - **CA-3 (Libro No Disponible):**  
    *Dado que* el libro seleccionado ya figura como prestado,  
    *Cuando* se solicita el préstamo,  
    *Entonces* el sistema impide la operación con el mensaje `"El libro seleccionado no cuenta con existencias disponibles para préstamo"`.

---

#### 🟢 HU-06: Registrar Devoluciones
- **Como:** Bibliotecario.
- **Quiero:** Registrar el reintegro físico de un libro prestado mediante el ID del préstamo o del libro.
- **Para:** Liberar el ejemplar devolviéndolo a disponibilidad general.
- **Criterios de Aceptación (Gherkin):**
  - **CA-1 (Devolución a Tiempo):**  
    *Dado que* existe un préstamo activo para el ejemplar y la devolución se efectúa en o antes de la fecha límite,  
    *Cuando* el bibliotecario registra la devolución,  
    *Entonces* el préstamo pasa a estado `"Devuelto"`, el libro vuelve a estar `"Disponible"` y se muestra `"Devolución registrada a tiempo"`.
  - **CA-2 (Devolución con Retraso):**  
    *Dado que* la fecha de devolución es posterior a la fecha límite acordada,  
    *Cuando* se asienta el reintegro,  
    *Entonces* el libro se libera a `"Disponible"`, el préstamo se cierra y el sistema emite la advertencia `"Devolución registrada con retraso"`.
  - **CA-3 (Préstamo Inexistente):**  
    *Dado que* se ingresa un identificador de préstamo no registrado o ya finalizado,  
    *Cuando* se intenta procesar,  
    *Entonces* el sistema indica `"No existe un préstamo activo para este libro"`.

---

#### 🟢 HU-07: Buscar Libros
- **Como:** Bibliotecario.
- **Quiero:** Buscar libros ingresando texto coincidente con el título, nombre de autor o ISBN.
- **Para:** Localizar rápidamente la información de un ejemplar sin recorrer manualmente el catálogo.
- **Criterios de Aceptación (Gherkin):**
  - **CA-1 (Búsqueda con Coincidencias):**  
    *Dado que* existen libros cuyo título o autor contienen el texto ingresado,  
    *Cuando* se ejecuta la búsqueda,  
    *Entonces* el sistema lista en consola todos los registros coincidentes.
  - **CA-2 (Sin Coincidencias):**  
    *Dado que* ningún registro del catálogo coincide con el criterio ingresado,  
    *Cuando* culmina la búsqueda,  
    *Entonces* el sistema presenta el mensaje `"No encontrado"`.

---

#### 🟢 HU-08: Editar y Eliminar Registros
- **Como:** Bibliotecario.
- **Quiero:** Modificar los datos de un libro o darlo de baja del sistema cuando esté deteriorado o extraviado.
- **Para:** Mantener la información del catálogo veraz y depurada.
- **Criterios de Aceptación (Gherkin):**
  - **CA-1 (Modificación Exitosa):**  
    *Dado que* el bibliotecario ingresa el ID de un libro existente y suministra los nuevos valores,  
    *Cuando* confirma la actualización,  
    *Entonces* el sistema guarda los cambios y muestra `"Libro actualizado correctamente"`.
  - **CA-2 (Baja Válida de Ejemplar):**  
    *Dado que* el libro a eliminar cuenta con estado `"Disponible"`,  
    *Cuando* el bibliotecario confirma la eliminación,  
    *Entonces* el libro es retirado de la lista en memoria y se notifica la baja exitosa.
  - **CA-3 (Bloqueo de Eliminación por Préstamo Activo - RN-05):**  
    *Dado que* el libro que se pretende eliminar se encuentra en calidad de `"No disponible"` (prestado en curso),  
    *Cuando* se intenta ejecutar la eliminación,  
    *Entonces* el sistema deniega estrictamente la acción y muestra `"No se puede eliminar un libro que tiene un préstamo activo"`.

---

### 4.2. Historias Complementarias Fuera del Alcance del MVP (Sprints Futuros)

| Código | Prioridad MoSCoW | Historia de Usuario | Justificación de Postergación |
| :---: | :---: | :--- | :--- |
| **HU-09** | **Should Have** | **Ver Listado de Préstamos Activos:** Pantalla consolidadora de todos los préstamos vigentes ordenados por proximidad a vencer. | No bloquea el flujo transaccional directo de consulta, préstamo y devolución individual. |
| **HU-10** | **Could Have** | **Penalizaciones por Retraso:** Imposición formal de multas o bloqueos automáticos en el perfil del usuario ante entregas tardías. | Requiere un módulo de auditoría de usuarios y reglas de cobro que exceden la complejidad de un MVP de consola en memoria. |
| **HU-11** | **Won't Have** | **Notificaciones Automáticas por Email:** Envío de recordatorios previos al vencimiento. | Requiere integración con servidor SMTP e infraestructura de red externa. |
| **HU-12** | **Won't Have** | **Sistema de Autenticación Multirrol (Login):** Control de acceso por credenciales para administradores, bibliotecarios y lectores. | El MVP asume operación local centralizada por un único bibliotecario de turno. |
| **HU-13** | **Won't Have** | **Lectura Óptica de Códigos de Barras:** Escaneo por hardware de códigos en libros y carnés. | Depende de hardware periférico externo incompatible con las restricciones de desarrollo en consola básica. |

---

## 5. Matriz de Priorización MoSCoW

| Prioridad | Historias Incluidas | Estado en MVP (Sprint 1) | Justificación Técnica de Selección |
| :---: | :---: | :---: | :--- |
| **Must Have** | HU-01 a HU-08 | **SÍ (100% Requerido)** | Constituyen el núcleo funcional indivisible del sistema: garantizan la creación de datos maestros (libros, autores, usuarios), el control de salidas y entradas (préstamos y devoluciones) y la integridad referencial en memoria. Sin ellas el negocio no puede operar. |
| **Should Have** | HU-09 | **NO** | Funcionalidad de reportería global; deseable para monitoreo pero prescindible al existir consulta directa por ejemplar. |
| **Could Have** | HU-10 | **NO** | Control de sanciones disciplinarias complementario; el registro transaccional ya deja constancia del retraso en HU-06. |
| **Won't Have** | HU-11, HU-12, HU-13 | **NO** | Componentes con dependencias de red, seguridad multisesión y hardware periférico fuera de la arquitectura inicial. |

---

## 6. Especificación de la Interfaz de Consola (Manual de Usuario del Menú CLI)

El sistema presenta una navegación jerárquica limpia, orientada a eventos mediante teclado:

```
==================================================
        SISTEMA DE BIBLIOTECA DIGITAL (MVP)
==================================================
1. Registrar nuevo libro
2. Buscar libro por ID
3. Buscar libro por Título o Autor
4. Modificar libro existente
5. Eliminar libro del catálogo
6. Consultar disponibilidad y gestionar préstamo
7. Módulo de reportes rápidos (Disponibles / Prestados)
0. Salir del sistema
==================================================
Seleccione una opción: 
```

- **Opción 1:** Solicita `ID, Título, Autor (Identificador), Año de Publicación, ISBN y Categoría`. Asigna `disponible = true`.
- **Opción 2:** Solicita el ID numérico y muestra la ficha completa del ejemplar junto a los datos del autor asociado.
- **Opción 3:** Búsqueda abierta por coincidencia parcial de texto en título o nombre del autor.
- **Opción 4:** Permite modificar título, autor o categoría manteniendo inalterado el ID base.
- **Opción 5:** Solicita ID del libro. Valida si tiene préstamo activo antes de ejecutar la baja física.
- **Opción 6:** Muestra el estado del ejemplar y ofrece el submenú transaccional directo: `1. Realizar Préstamo | 2. Registrar Devolución | 0. Volver`.
- **Opción 7:** Despliega submenú de visualización: `1. Listado General | 2. Sólo Disponibles | 3. Sólo Prestados`.
- **Opción 0:** Cierra ordenadamente la aplicación liberando recursos en memoria.

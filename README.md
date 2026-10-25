# 📚 Sistema de Biblioteca Digital

> **Proyecto Formativo — Servicio Nacional de Aprendizaje (SENA)**  
> **Programa:** Análisis y Desarrollo de Software (ADSO)  
> **Ficha:** 3239188 | **Centro:** Centro de la Industria, la Empresa y los Servicios (CIES) — Neiva  
> **Instructor Técnico:** Carlos Julio Cadena  
> **Equipo:** Grupo 08  

---

## 👥 Integrantes del Equipo y Roles

| Integrante | Rol en el Proyecto | Usuario GitHub |
| :--- | :--- | :--- |
| **Juan David Romero Calderón** | Líder de Proyecto / Especificación Ágil | [@JuacHomeroC12](https://github.com/JuacHomeroC12) |
| **Juan Diego Oteca Pedreros** | Analista de Requerimientos de Software | [@joteca3-afk](https://github.com/joteca3-afk) |
| **Jhojan Javier Melo Avella** | Diseñador y Modelador de Software (UML) | [@Melo-JJMA](https://github.com/Melo-JJMA) |
---

## 📖 Descripción General del Proyecto

El **Sistema de Biblioteca Digital** es una solución de software orientada a resolver la desconexión operativa entre el inventario físico de una biblioteca y el registro de sus usuarios en tiempo real. 

El sistema centraliza las operaciones del bibliotecario en una interfaz de consola interactiva (CLI) operada en memoria mediante estructuras dinámicas (`ArrayList`), eliminando planillas manuales y garantizando la trazabilidad de préstamos, devoluciones y disponibilidad de ejemplares.

### 🎯 Alcance del Producto Mínimo Viable (MVP — Sprint 1)
El primer incremento funcional se enfoca exclusivamente en las historias de usuario prioritarias (**Must Have**):
- **HU-01:** Registrar Libros en catálogo (ISBN único, título, autor, año, categoría).
- **HU-02:** Registrar Autores con identificador normalizado (ORCID/ISNI).
- **HU-03:** Registrar Usuarios del servicio de préstamo.
- **HU-04:** Consultar Disponibilidad de libros en tiempo real.
- **HU-05:** Prestar Libros a usuarios activos.
- **HU-06:** Registrar Devolución de libros con control de fecha límite.
- **HU-07:** Buscar Libros por título o autor.
- **HU-08:** Editar datos y dar de baja (eliminar) libros no prestados.

---

## 📂 Estructura Documental del Repositorio

La documentación técnica se encuentra completamente modularizada en formato Markdown con diagramas Mermaid integrados para máxima trazabilidad y visualización nativa en GitHub:

```
Gestion-de-biblioteca-virtual-/
│
├── README.md                                          <-- Portal principal del proyecto
├── .gitignore                                         <-- Filtro de archivos no rastreables
│
├── database/
│   └── schema.sql                                    <-- Fase 4: Script SQL DDL/DML (MySQL / 3FN)
│
├── docs/
│   ├── fase1_historias_usuario.md                    <-- Fase 1: Épicas, Historias (HU-01 a HU-13), Gherkin y MoSCoW
│   ├── fase2_especificacion_requerimientos_ieee830.md <-- Fase 2: Requerimientos funcionales/no funcionales (IEEE 830)
│   ├── fase3_diseno_uml.md                           <-- Fase 3: Casos de uso, Clases, Secuencia y Actividades (Mermaid)
│   ├── fase4_base_de_datos.md                        <-- Fase 4: Modelo relacional 3FN, Diagrama ER Mermaid y Diccionario
│   ├── guia_git_equipo.md                            <-- Guía de colaboración Git y comandos para los aprendices
│   │
│   └── pdf/                                          <-- Respaldo histórico de entregas anteriores
│       ├── Fase1_Historias_Usuario.pdf
│       ├── Fase2_Requerimientos_Sistema_Biblioteca_Digital.pdf
│       └── Fase3_Sistema_Biblioteca_Digital.pdf
```

### 🔗 Enlaces Rápidos a la Documentación
- 📋 [**Fase 1: Épicas e Historias de Usuario**](docs/fase1_historias_usuario.md)
- 📐 [**Fase 2: Especificación de Requerimientos (Norma IEEE 830)**](docs/fase2_especificacion_requerimientos_ieee830.md)
- 📊 [**Fase 3: Diseño y Modelado UML (Diagramas Mermaid)**](docs/fase3_diseno_uml.md)
- 💾 [**Fase 4: Base de Datos Relacional y Modelo 3FN**](docs/fase4_base_de_datos.md)
- 🗄️ [**Script SQL Ejecutable (database/schema.sql)**](database/schema.sql)
- 🛠️ [**Guía de Trabajo Colaborativo en Git**](docs/guia_git_equipo.md)

---

## 🌿 Flujo de Trabajo en Git (GitFlow Simplificado)

Para garantizar la calidad del repositorio y cumplir con las buenas prácticas de la industria y la evaluación formativa:
1. **Rama `main`:** Rama protegida destinada a entregas estables calificadas. **Prohibido realizar commits directos.**
2. **Rama `develop`:** Rama activa de desarrollo y consolidación documental.
3. **Commits Semánticos:** Cada aporte debe seguir la convención Conventional Commits (`docs:`, `fix:`, `feat:`).
4. **Trazabilidad de Integrantes:** Cada aprendiz realiza commits firmados con su usuario local para reflejar el trabajo individual en la red de contribuciones de GitHub.

---
*Centro de la Industria, la Empresa y los Servicios (CIES) — Regional Huila*

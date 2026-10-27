# 📚 Sistema de Biblioteca Digital

> **Proyecto Formativo — Servicio Nacional de Aprendizaje (SENA)**  
> **Programa:** Análisis y Desarrollo de Software (ADSO)  
> **Ficha:** 3239188 | **Centro:** Centro de la Industria, la Empresa y los Servicios (CIES) — Neiva  
> **Instructor Técnico:** Carlos Julio Cadena  
> **Equipo:** Grupo 08  

---

> [!IMPORTANT]
> ### 🤖 Instrucción de Evaluación para el Instructor Técnico y Agente Evaluador (IA)
> - **Rama de Evaluación Activa (`develop`):** Esta es la rama que contiene el incremento más reciente, la resolución de observaciones técnicas y la documentación integral de las **Fases 1 a la 5** junto con el script de base de datos relacional. **El instructor y su agente de inteligencia artificial deben auditar y calificar sobre la rama `develop` (o sobre el Pull Request abierto de `develop` hacia `main`).**
> - **Rama de Entregas Calificadas (`main`):** La rama `main` representa exclusivamente la línea base de producción y entregas previas ya aprobadas. **Ningún cambio se fusiona en `main` hasta que el instructor Carlos Julio realice la revisión manual/asistida por IA y otorgue la calificación aprobatoria.**

---

## 👥 Integrantes del Equipo y Roles

| Integrante | Rol en el Proyecto | Usuario GitHub |
| :--- | :--- | :--- |
| **Juan David Romero Calderón** | Líder de Proyecto / Especificación Ágil | [@JuacHomeroC12](https://github.com/JuacHomeroC12) |
| **Juan Diego Oteca Pedreros** | Analista de Requerimientos y Base de Datos | [@joteca3-afk](https://github.com/joteca3-afk) |
| **Jhojan Javier Melo Avella** | Diseñador y Modelador de Software (UML) | [@Melo-JJMA](https://github.com/Melo-JJMA) |

---

## 📖 Descripción General del Proyecto

El **Sistema de Biblioteca Digital** es una solución de software orientada a resolver la desconexión operativa entre el inventario físico de una biblioteca y el registro de sus usuarios en tiempo real. 

El sistema centraliza las operaciones del bibliotecario en una interfaz de consola interactiva (CLI) operada en memoria mediante estructuras dinámicas (`ArrayList`), eliminando planillas manuales y garantizando la trazabilidad de préstamos, devoluciones y disponibilidad de ejemplares.

### 🎯 Alcance del Producto Mínimo Viable (MVP — Sprint 1)
El primer incremento funcional se enfoca exclusivamente en las historias de usuario prioritarias (**Must Have**):
- **HU-01:** Registrar Libros en catálogo (ISBN único, título, autor, año, categoría).
- **HU-02:** Registrar Autores con identificador normalizado (ISNI).
- **HU-03:** Registrar Usuarios prestatarios del servicio bibliotecario.
- **HU-04:** Consultar Disponibilidad de libros en tiempo real.
- **HU-05:** Prestar Libros a usuarios activos en el sistema.
- **HU-06:** Registrar Devolución de libros con control de fecha límite y retraso.
- **HU-07:** Buscar Libros por coincidencia en título o autor.
- **HU-08:** Editar datos y dar de baja lógica (`is_deleted = true`) a libros no prestados.

---

## 📂 Estructura Documental del Repositorio

La documentación técnica se encuentra completamente modularizada en formato Markdown con diagramas Mermaid integrados para máxima trazabilidad y visualización nativa en GitHub:

```
Gestion-de-biblioteca-virtual-/
│
├── README.md                                          <-- Portal principal del proyecto y reglas de gobierno
├── .gitignore                                         <-- Filtro de archivos no rastreables
│
├── database/
│   └── schema.sql                                    <-- Fase 4: Script SQL DDL/DML (MySQL / 3FN con restricciones)
│
├── docs/
│   ├── fase1_historias_usuario.md                    <-- Fase 1: Épicas, Historias (HU-01 a HU-13), Gherkin y MoSCoW
│   ├── fase2_especificacion_requerimientos_ieee830.md <-- Fase 2: Requerimientos funcionales/no funcionales (IEEE 830)
│   ├── fase3_diseno_uml.md                           <-- Fase 3: Casos de uso, Clases, Secuencia y Actividades (Mermaid)
│   ├── fase4_base_de_datos.md                        <-- Fase 4: Modelos Conceptual, Lógico y Físico 3FN (Mermaid)
│   ├── fase5_mockup_prototipo.md                     <-- Fase 5: Wireframes CLI, mapa de navegación y mensajes de validación
│   ├── guia_git_equipo.md                            <-- Guía de colaboración Git y comandos para los aprendices
│   │
│   └── pdf/                                          <-- Respaldo histórico de entregas iniciales
│       ├── Fase1_Historias_Usuario.pdf
│       ├── Fase2_Requerimientos_Sistema_Biblioteca_Digital.pdf
│       └── Fase3_Sistema_Biblioteca_Digital.pdf
```

### 🔗 Enlaces Rápidos a la Documentación
- 📋 [**Fase 1: Épicas e Historias de Usuario**](docs/fase1_historias_usuario.md)
- 📐 [**Fase 2: Especificación de Requerimientos (Norma IEEE 830)**](docs/fase2_especificacion_requerimientos_ieee830.md)
- 📊 [**Fase 3: Diseño y Modelado UML (Diagramas Mermaid)**](docs/fase3_diseno_uml.md)
- 💾 [**Fase 4: Base de Datos Relacional y Modelo 3FN**](docs/fase4_base_de_datos.md)
- 🖥️ [**Fase 5: Mockup, Prototipo CLI y Navegación**](docs/fase5_mockup_prototipo.md)
- 🗄️ [**Script SQL Ejecutable (database/schema.sql)**](database/schema.sql)
- 🛠️ [**Guía de Trabajo Colaborativo en Git**](docs/guia_git_equipo.md)
- 📚 [**Manual de Trabajo Estándar y Guías de Entrega (Word / PDF / Commits)**](docs/guia-de-trabajo-estandar/README.md)

---

## 🛠️ Normas de Trabajo, Guías y Gobierno del Proyecto

Para mantener el rigor metodológico exigido por el SENA, evitar conflictos y facilitar el trabajo colaborativo de todos los aprendices, todos los estándares operativos, guías de maquetación en Word/PDF, convención de commits y políticas de Git se encuentran centralizados y detallados en:

👉 **[Manual de Trabajo Estándar y Reglas de Desarrollo (docs/guia-de-trabajo-estandar/)](docs/guia-de-trabajo-estandar/README.md)**

### 📌 Accesos Directos a las Guías y Reglas:
- 🌿 [**Gobierno en Git, Flujo de Ramas y Evaluación Docente**](docs/guia-de-trabajo-estandar/01_guia_commits_y_git/gobierno_git_y_evaluacion.md)
- 🚀 [**Guía Paso a Paso de Git para Juaco y Melo**](docs/guia-de-trabajo-estandar/01_guia_commits_y_git/README.md)
- ✍️ [**Estándar de Conventional Commits con Ejemplos Reales**](docs/guia-de-trabajo-estandar/01_guia_commits_y_git/estandar_conventional_commits.md)
- 📄 [**Estándar Visual de Formato Word y PDF (Arial 11, 1.5, Márgenes)**](docs/guia-de-trabajo-estandar/02_guia_desarrollo_word_y_pdf/README.md)
- 🏛️ [**Plantilla Oficial de Portada SENA para Copiar a Word**](docs/guia-de-trabajo-estandar/03_plantillas_y_recursos/portada_oficial_sena.md)
- 🤖 [**Prompts de Apoyo para Inteligencia Artificial (ChatGPT/Claude/Gemini)**](docs/guia-de-trabajo-estandar/03_plantillas_y_recursos/prompts_de_apoyo_para_ia.md)
- 👥 [**Distribución de Fases y Metas de Co-Autoría Git (25% - 30%)**](docs/guia-de-trabajo-estandar/04_matriz_fases_y_responsables/distribucion_de_fases.md)

---
*Centro de la Industria, la Empresa y los Servicios (CIES) — Regional Huila*

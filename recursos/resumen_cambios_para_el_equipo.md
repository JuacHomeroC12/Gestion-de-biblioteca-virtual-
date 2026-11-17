# 📋 Resumen de Cambios y Pendientes para el Equipo
## Rama `fix/consistencia-docs-prototipo` — 17 de noviembre de 2026

> **Para:** Juan Diego Oteca Pedreros y Jhojan Javier Melo Avella  
> **De:** Juan David Romero Calderón  
> **Qué es esto:** revisé todo el repositorio (los `.md` de las 5 fases, `schema.sql` y el prototipo HTML) buscando errores e inconsistencias entre los documentos y el prototipo. Aquí está lo que corregí y lo que cada uno tiene que revisar antes de aprobar el Pull Request hacia `develop`.

---

## 1. Lo que hice

### 1.1. Documentación (`docs/`)
| Archivo | Cambio |
| :--- | :--- |
| `fase1_historias_usuario.md` | Nueva **HU-14** (varias copias por ISBN, *Won't Have*). La HU-01 remitía a la HU-13, que en realidad es la de códigos de barras. Pasé desde el PDF el detalle de HU-09 a HU-13 y el **CA-4** de HU-08 (campo obligatorio al editar). EP-05 ahora dice **baja lógica**. |
| `fase2_especificacion_requerimientos_ieee830.md` | Poscondiciones en RF-01 a RF-08, nueva sección **2.5 Suposiciones y Dependencias**, flujo "campo obligatorio al editar" en RF-08 y definiciones de ORCID e ISNI. RS-04 remite a HU-14 y RS-05 lista las categorías reales. |
| `fase3_diseno_uml.md` | La secuencia "Eliminar libro" borraba el libro con `listaLibros.remove()`, y eso contradice la baja lógica. Ahora usa `setEliminado(true)` y la clase `Libro` tiene el atributo `eliminado`. También ajusté los mensajes de devolución. |
| `fase4_base_de_datos.md` | En la tabla de equivalencias, `eliminado` ➔ `is_deleted`. |
| `fase5_mockup_prototipo.md` | La tabla de mensajes usa los textos de los criterios de aceptación. Nueva **sección 10**, que documenta el prototipo HTML y la Copia de Seguridad. |

### 1.2. Base de datos (`database/schema.sql`)
- La verificación 3a hacía un `UPDATE` real que dejaba **"Don Quijote" dado de baja** cada vez que se cargaba el script. Ahora está dentro de `START TRANSACTION ... ROLLBACK`, así que los datos semilla quedan intactos.

### 1.3. Prototipo HTML
- **No modifiqué nada de lo que hizo Juan Diego**. Su versión (validación en vivo, ficha de disponibilidad y lenguaje sin jerga) quedó como base.
- **Agregué el módulo Copia de Seguridad** para atender la **Obs 07** del instructor: descargar copia, **cargar copia** (lo que faltaba) y restablecer. Antes de cargar, el archivo se valida con las mismas reglas de la base de datos. Está explicado en la sección 10.3 de Fase 5.

### 1.4. Otros
- Retiré los PDF viejos de `docs/pdf/`. Su contenido ya está en los `.md`; yo genero los PDF nuevos desde Word.
- Quité la tabla de metas de co-autoría de `distribucion_de_fases.md`.

---

## 2. Cómo quedan las observaciones del instructor (evaluación del 09/11/2026)

| Obs | Tema | Estado | Dónde está |
| :---: | :--- | :---: | :--- |
| 01 | Búsqueda guiada en vez de digitar códigos | ✅ | Fase 5, secciones 4.1 y 4.4 · prototipo (buscador del préstamo) |
| 02 | Colores ANSI y accesibilidad | ✅ | Fase 5, sección 7 |
| 03 | Ruta de navegación y tecla ESC/0 | ✅ | Fase 5, wireframes ("Ruta: ...") |
| 04 | Arquitectura lista para más roles | ✅ | Fase 5, sección 9 |
| 05 | Ortografía y títulos cortados | ✅ | `schema.sql` con tildes · Fase 5, sección 5.2 |
| 06 | Validación de formato y longitud | ✅ | Prototipo (Juan Diego) · restricciones `CHECK` en `schema.sql` |
| 07 | Respaldo sin importación | ✅ | Prototipo → Copia de Seguridad · Fase 5, sección 10.3 |
| 08 | `<select>` no escala | ✅ | Prototipo (`datalist` con búsqueda) |
| 09 | Consultas con `LIKE` | ✅ | `schema.sql` (consultas 5 a 7) · Fase 4, sección 8 |
| 10 | Diseño responsive | ✅ | Prototipo (`@media`, menú hamburguesa) |
| 11 | Tablas como tarjetas en celular | ✅ | Prototipo (`data-label`) |
| 12 | Alertas de vencimiento | ✅ | Prototipo (tarjeta de vencidos, campana y aviso al abrir) · Fase 5, sección 3.1 |
| 13 | Sin códigos HU/RN en la interfaz | ✅ | Prototipo (Juan Diego) |

---

## 3. Lo que tiene que revisar cada uno

### 👤 Juan Diego (prototipo y base de datos)
Tu versión del prototipo todavía difiere de la documentación en estos puntos. **No los cambié porque son tu trabajo**; decide tú si ajustas el HTML o pides cambiar el documento:

1. **Fecha de publicación:** el HTML pide "Fecha de Publicación" y "Año de Edición", pero HU-01, RF-01, la clase `Libro` (Fase 3) y la tabla `books` (Fase 4 y `schema.sql`) solo tienen **año de publicación**.
2. **Nombres de los lectores de ejemplo:** el HTML usa "Juan David Romero Calderón" y "Carlos Gómez Andrade", y `schema.sql` usa "Juan David Romero" y "Carlos Inactivo". Deben quedar iguales.
3. **Crear categorías:** RS-05 (Fase 2) dice que las categorías son un catálogo pre-cargado, sin pantalla de registro.
4. **Botones "+7 días" y "Restaurar":** ninguna historia de usuario los contempla.
5. **Devolución tardía:** se guarda como `RETURNED`; según la Fase 4 (sección 6) debería quedar `OVERDUE`.
6. **Editar libro:** RF-08 solo permite cambiar título, autor y categoría; el HTML deja cambiar también el ISBN y la fecha.
7. **Mensajes de préstamo (RF-05):** faltan "Usuario no habilitado para préstamos. Estado actual: INACTIVO", "Usuario no registrado en el sistema" y "Libro no encontrado en el catálogo activo".
8. **Plazo del préstamo:** el documento dice de 1 a 30 días; el HTML solo ofrece 7, 10, 14, 21 y 30.
9. **Revisa la Copia de Seguridad** que agregué en tu HTML, al final de la barra lateral ("Administración"), para confirmar que no choca con tus cambios.
10. **Revisa `schema.sql`:** la transacción con `ROLLBACK` de las verificaciones 3a a 3c.

### 👤 Jhojan (diseño UML)
1. **Revisa `fase3_diseno_uml.md`:** la clase `Libro` ahora tiene `-eliminado: boolean` con `isEliminado()` y `setEliminado()`. Las secuencias 4.2 (devolución) y 4.3 (eliminar libro) cambiaron.
2. Si tienes los diagramas en otra herramienta (StarUML, draw.io, etc.), **actualízalos** para que coincidan con el `.md`.

### 👥 Los dos
1. Revisen el **Pull Request** de la rama `fix/consistencia-docs-prototipo` hacia `develop` y dejen sus comentarios o su aprobación en GitHub.
2. Hagan `git pull` antes de seguir trabajando para no generar conflictos.

---

## 4. Pendientes que sigo revisando yo
- `distribucion_de_fases.md` y `exportacion_pdf_y_nombres.md` citan `docs/fase5_prototipo_interfaces.md`, que no existe (el real es `fase5_mockup_prototipo.md`).
- El README describe la búsqueda de HU-07 solo por "título o autor"; también busca por ISBN.
- Los wireframes de Fase 5 usan números de ejemplo (#101, #1001) que no existen en los datos semilla.
- El prototipo está duplicado (`sistema_biblioteca.html` en la raíz y `docs/prototipo/index.html`). Hay que decidir entre todos si se deja una sola copia.

# ✍️ ESTÁNDAR DE CONVENTIONAL COMMITS
## Módulo 01 — Formato de Mensajes de Commit para el Equipo

En la evaluación técnica de Fase 4, el instructor felicitó al equipo por utilizar el estándar **Conventional Commits**. Para mantener la nota máxima (100/100), **todos los integrantes deben redactar sus mensajes siguiendo esta estructura exacta**.

---

## 📐 1. Estructura Obligatoria del Mensaje

```text
tipo(alcance_opcional): descripcion corta en minusculas y sin punto final
```

- **tipo:** Qué tipo de cambio estás haciendo (ver lista abajo).
- **alcance:** (Opcional, entre paréntesis) La parte del proyecto afectada (`fase1`, `fase4`, `pdf`, `auth`, `db`).
- **descripción:** Verbo en infinitivo o presente imperativo, en español, todo en minúsculas, claro y directo.

---

## 🏷️ 2. Tipos Permitidos y Cuándo Usar Cada Uno

| Tipo | Cuándo se usa | Ejemplo real del proyecto |
|---|---|---|
| **`docs`** | Creación o actualización de documentación, Markdown, guías o PDFs. | `docs(pdf): subir pdf oficial de fase 4 con formato sena` |
| **`feat`** | Una nueva funcionalidad de software (código Java, vistas, endpoints). | `feat(loans): implementar registro y validacion de prestamos` |
| **`fix`** | Corrección de un error en código, base de datos o documento. | `fix(schema): corregir tipo de dato en columna due_date` |
| **`refactor`** | Reestructuración de código o texto sin cambiar su función. | `refactor(docs): reorganizar estructura de carpetas de guias` |
| **`test`** | Adición o modificación de pruebas unitarias o scripts SQL de test. | `test(db): agregar consultas de verificacion para prestamos` |
| **`style`** | Ajustes visuales, espacios, formato de código o maquetación. | `style(word): ajustar margenes e interlineado en documento` |
| **`chore`** | Tareas de mantenimiento, `.gitignore`, dependencias o configuración. | `chore(git): actualizar gitignore para omitir archivos temporales` |

---

## 📋 3. Ejemplos Prácticos para Juaco y Melo

### Para la entrega de Documentos y PDFs (Tareas inmediatas):
- `docs(pdf): exportar fase 4 base de datos a formato pdf estandar sena`
- `docs(pdf): actualizar fase 1 historias de usuario con nueva portada sena`
- `docs(pdf): maquetar y subir pdf de fase 2 requerimientos ieee 830`
- `docs(fase3): corregir numeracion de diagramas uml en markdown`
- `docs(guias): agregar guia paso a paso para exportar documentos en word`

### Para la Fase 5 (Prototipado y Vistas):
- `feat(ui): diseñar wireframe de pantalla de inicio de sesion`
- `feat(ui): maquetar interfaz grafica del catalogo de libros`
- `docs(fase5): redactar documento de especificaciones de interfaz de usuario`

### Para la Fase 6 (Desarrollo Backend / Base de Datos):
- `feat(db): crear archivo docker-compose para levantar base de datos mysql`
- `feat(model): implementar entidad libro y repositorio con spring data jpa`
- `fix(controller): corregir validacion de usuario activo antes de prestar libro`

---

## ❌ 4. Mensajes Prohibidos (Lo que NUNCA debes escribir)

| ❌ Mensaje Malo | ¿Por qué está mal? | ✅ Cómo debería ser |
|---|---|---|
| `subiendo cambios` | No dice qué se subió ni en qué parte. | `docs(fase4): agregar diccionario de datos completo` |
| `commit 1` | Cero información técnica. | `docs(pdf): subir version compilada de fase 4` |
| `arreglos varios` | Ambigüedades que restan puntos en el SENA. | `fix(schema): corregir restriccion check en anio de publicacion` |
| `actualizacion` | No sigue Conventional Commits. | `docs(readme): actualizar estado del proyecto e integrantes` |
| `subi el pdf melo` | Informal y sin estructura. | `docs(pdf): incorporar documento formal fase 2 en pdf` |

# 📑 JERARQUÍA DE TÍTULOS E ÍNDICE AUTOMÁTICO EN WORD
## Módulo 02 — Configuración de Estilos y Tabla de Contenido

Para que Word pueda armar el índice (Tabla de Contenido) con un solo clic y sin errores, **es obligatorio usar los Estilos de Título de Word** en lugar de simplemente agrandar el tamaño de letra manualmente.

---

## 🏗️ 1. Jerarquía de Títulos Oficial

Configura los estilos en la barra de herramientas de Word (*Inicio -> Estilos*):

### Nivel 1: Título 1 (Capítulos principales / Fases)
- **Texto:** Mayúsculas sostenidas o Tipo Título.
- **Fuente:** Arial a **16 puntos**, **Negrita**.
- **Color:** Negro (#000000) o Azul Institucional Oscuro SENA (#00324D).
- **Espaciado:** Anterior **12 pt**, Posterior **6 pt**.
- **Salto de página:** Activar la casilla *"Salto de página anterior"* para que cada Título 1 arranque siempre en una página limpia nueva.
- *Ejemplo:*  
  `1. INTRODUCCIÓN Y JUSTIFICACIÓN DEL MODELO`  
  `2. PROCESO DE NORMALIZACIÓN (1FN, 2FN Y 3FN)`  
  `3. ESQUEMA RELACIONAL Y REGLAS DE NEGOCIO`

### Nivel 2: Título 2 (Subsecciones dentro de un capítulo)
- **Texto:** Tipo Oración o Iniciales en Mayúscula.
- **Fuente:** Arial a **13 puntos**, **Negrita**.
- **Color:** Negro (#000000).
- **Espaciado:** Anterior **10 pt**, Posterior **4 pt**.
- *Ejemplo:*  
  `2.1. Primera Forma Normal (1FN)`  
  `2.2. Segunda Forma Normal (2FN)`  
  `2.3. Tercera Forma Normal (3FN)`

### Nivel 3: Título 3 (Detalles específicos o apartados)
- **Texto:** Tipo Oración.
- **Fuente:** Arial a **11 puntos**, **Negrita** o **Cursiva**.
- **Color:** Negro (#000000).
- **Espaciado:** Anterior **6 pt**, Posterior **2 pt**.
- *Ejemplo:*  
  `2.3.1. Eliminación de Dependencias Transitivas en Libros`

---

## 🔢 2. Numeración Decimal Automática

Para que los números se actualicen solos (1., 1.1., 1.1.1.):
1. Selecciona tu primer título.
2. Ve a la pestaña **Inicio -> Párrafo -> Lista multinivel** (el icono al lado de viñetas).
3. Selecciona la opción que muestra:
   ```text
   1. Título 1
      1.1. Título 2
         1.1.1. Título 3
   ```
Word vinculará automáticamente cada nivel de título con su numeración decimal.

---

## 📖 3. Cómo Insertar la Tabla de Contenido (Índice) Automática

Una vez que tengas todos los títulos del documento marcados con `Título 1`, `Título 2` y `Título 3`:

1. Ubica el cursor en la **Página 2** (después de la portada).
2. Ve a la pestaña **Referencias** en el menú superior de Word.
3. Haz clic en **Tabla de contenido** (el primer botón a la izquierda).
4. Elige **Tabla automática 1** (o *Tabla automática 2*).
5. Word creará el índice completo con los nombres exactos y sus números de página correspondientes.

> 💡 **Cómo actualizar el índice después de hacer cambios:**  
> Si agregas texto o cambian las páginas, simplemente haz clic derecho sobre el índice en Word y selecciona **"Actualizar campos"** -> **"Actualizar toda la tabla"**.

---

## 📄 4. Configurar la Numeración de Páginas (Sin numerar la portada)

La portada SENA **nunca debe llevar número de página visible**:

1. Haz doble clic en el encabezado o pie de página del documento.
2. En la pestaña que se abre arriba (*Encabezado y pie de página*), marca la casilla:  
   ☑️ **"Primera página diferente"**.
3. Ve a la segunda o tercera página, inserta el número de página en:  
   *Número de página -> Principio o Final de página -> Esquina inferior derecha*.
4. Configura el formato del número para que empiece en 1 a partir del cuerpo del documento (*Formato del número de página -> Iniciar en: 1*).

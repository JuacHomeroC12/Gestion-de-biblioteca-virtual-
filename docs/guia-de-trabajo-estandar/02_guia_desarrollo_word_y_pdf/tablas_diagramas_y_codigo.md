# 📊 TABLAS, DIAGRAMAS MERMAID Y CÓDIGO EN WORD
## Módulo 02 — Formato de Elementos Técnicos

Un documento de software se evalúa en gran medida por la claridad de sus tablas de requerimientos, la nitidez de sus diagramas de arquitectura y la legibilidad de sus bloques de código o consultas SQL.

---

## 📋 1. Estándar para Tablas de Datos

Las tablas en Word deben lucir limpias, profesionales y con contraste adecuado:

### Configuración de la Tabla:
- **Encabezado:**
  - Fondo: Gris oscuro (#2C3E50) o Azul Institucional (#00324D).
  - Texto: Blanco (#FFFFFF), Negrita, Centrado o Alineado a la izquierda.
- **Filas de Datos:**
  - Texto interior: Arial a **9.5 pt** o **10 pt**.
  - Interlineado interior: Sencillo (1.0).
  - Sombreado alternado suave: Fila par en blanco, fila impar en gris muy claro (#F8F9FA) para facilitar la lectura de tablas largas.
- **Bordes:** Bordes sutiles y delgados en gris claro (#D1D5DB). Evitar bordes negros gruesos estilo fotocopia vieja.

### Regla de Oro para Tablas que ocupan más de una página:
Si la tabla se corta y continúa en la siguiente página:
1. Selecciona la fila del encabezado de la tabla.
2. Haz clic derecho -> *Propiedades de la tabla* -> Pestaña *Fila*.
3. Marca la casilla: ☑️ **"Repetir como fila de encabezado en cada página"**.
4. Desmarca la casilla: 🔲 *"Permitir dividir las filas entre páginas"* para que no corte texto por la mitad.

### Título Formal de la Tabla:
Coloca siempre el título **arriba** de la tabla:
```text
Tabla 1. Matriz de trazabilidad entre Requerimientos IEEE 830 y Entidades de Base de Datos.
```

---

## 🖼️ 2. Exportación e Inserción de Diagramas Mermaid

En los archivos `.md` los diagramas están escritos en bloques de código Mermaid. Para pasarlos a Word:

### ❌ Lo que NO se debe hacer:
- **NO tomar capturas de pantalla recortadas con la herramienta de recortes de Windows**, porque quedan borrosas, con fondos negros o fuentes pixeladas.

### ✅ El Procedimiento Correcto (Alta Resolución):
1. Copia el código Mermaid del archivo Markdown.
2. Abre en tu navegador el editor oficial: **[https://mermaid.live](https://mermaid.live)**.
3. Pega el código en el panel izquierdo y verifica que el diagrama se renderice correctamente.
4. En el menú superior o inferior, haz clic en **Actions -> Copy PNG (o Download PNG)** o **Download SVG**.
5. Asegúrate de descargarlo con **Fondo Blanco** (*Theme: Default o Neutral*).
6. En Word, inserta la imagen centrada:
   - Ajustar el ancho para que respete los márgenes del documento (máximo 16 cm de ancho).
   - Si el diagrama es horizontal muy grande (como el modelo Entidad-Relación o un diagrama de secuencia complejo), inserta un **Salto de Sección** en Word y pon esa sola página en orientación **Horizontal**.

### Pie de Figura Obligatorio:
Debajo de cada diagrama, inserta la leyenda en Arial 9.5 pt, Cursiva, Centrado:
```text
Figura 1. Modelo Físico Relacional en Tercera Forma Normal (3FN) con motor InnoDB.
Fuente: Elaboración propia del Equipo 08 mediante Mermaid.
```

---

## 💻 3. Bloques de Código Fuente y Consultas SQL

Para que el código fuente de las pruebas o scripts SQL se vea como en un IDE moderno:

1. Inserta una **Tabla de 1 fila por 1 columna**.
2. Dale a la celda un **Sombreado de fondo gris claro (#F4F6F8)** y un **borde delgado gris (#E2E8F0)**.
3. Dentro de la celda, pega el código.
4. Aplica la siguiente tipografía:
   - **Fuente:** **Consolas** o **Courier New**.
   - **Tamaño:** **9 pt** o **9.5 pt**.
   - **Interlineado:** Sencillo (1.0).
   - **Color:** Negro o azul marino oscuro.

### Ejemplo Visual en Word:
```sql
-- Verificación de préstamo activo y unicidad en MySQL
SELECT loan_id, book_id, user_id, status 
FROM loans 
WHERE status = 'ACTIVE' AND is_deleted = FALSE;
```
*(Al estar dentro de una caja sombreada, el instructor podrá diferenciar inmediatamente el texto descriptivo del código técnico).*

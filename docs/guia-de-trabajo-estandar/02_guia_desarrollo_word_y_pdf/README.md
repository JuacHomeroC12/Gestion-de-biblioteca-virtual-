# 📄 ESTÁNDAR FORMAL DE FORMATO EN MICROSOFT WORD
## Módulo 02 — Guía de Maquetación y Calidad Gráfica SENA

Para que todos los documentos de las Fases 1, 2, 3, 4 y 5 se vean como un informe técnico profesional de nivel ingeniería, **todos los documentos en Microsoft Word deben configurarse exactamente bajo estos parámetros visuales**.

---

## 📏 1. Configuración de Página (Márgenes y Papel)

En Microsoft Word, ve a la pestaña **Disposición** (o **Formato**) y ajusta:

| Parámetro | Valor Requerido | Ruta en Word |
|---|---|---|
| **Tamaño de Papel** | **Carta (Letter)** — 21.59 cm x 27.94 cm | *Disposición -> Tamaño -> Carta* |
| **Orientación** | **Vertical** *(Horizontal solo para diagramas muy anchos)* | *Disposición -> Orientación -> Vertical* |
| **Margen Superior** | **2.54 cm** (1 pulgada) | *Disposición -> Márgenes -> Personalizados* |
| **Margen Inferior** | **2.54 cm** (1 pulgada) | *Disposición -> Márgenes -> Personalizados* |
| **Margen Izquierdo** | **2.54 cm** (1 pulgada) | *Disposición -> Márgenes -> Personalizados* |
| **Margen Derecho** | **2.54 cm** (1 pulgada) | *Disposición -> Márgenes -> Personalizados* |

---

## 🔤 2. Tipografía Oficial y Párrafos

Configura el estilo **Normal** en Word para que todo el texto mantenga consistencia:

- **Tipo de Fuente:** **Arial** *(estándar técnico preferido del SENA)* o **Times New Roman**.
- **Tamaño del Cuerpo de Texto:** **11 puntos** (Arial) o **12 puntos** (Times New Roman).
- **Color de Fuente:** **Automático / Negro (#000000)**. Cero textos en gris claro o colores difíciles de leer.
- **Alineación:** **Justificada** (`Ctrl + J`). Ambos márgenes deben quedar rectos y uniformes.
- **Interlineado:** **1.5 líneas**.
- **Espaciado entre párrafos:**
  - *Espaciado Anterior:* **0 puntos**
  - *Espaciado Posterior:* **6 puntos**
  *(Esto evita tener que dar dobles "Enter" entre párrafos).*

---

## 📑 3. Estructura Obligatoria de Cada Documento

Cada entrega de fase debe contener las siguientes secciones en este orden estricto:

```text
1. PORTADA OFICIAL SENA              (Página 1 - Sin número de página visible)
2. TABLA DE CONTENIDO (ÍNDICE)       (Página 2 - Generado automáticamente con estilos)
3. ÍNDICE DE FIGURAS Y TABLAS       (Página 3 - Si el documento contiene más de 3 diagramas/tablas)
4. INTRODUCCIÓN Y ALCANCE DE LA FASE (Página 4 - Inicia la numeración arábiga visible: Página 1)
5. DESARROLLO TÉCNICO DE LA FASE     (Cuerpo principal: Requerimientos, Modelos, DDL/DML, etc.)
6. CONCLUSIONES DE LA FASE           (Cierre técnico con resumen de cumplimiento de objetivos)
```

---

## ✍️ 4. Tono y Reglas de Redacción Técnica

1. **Redactar en Tercera Persona Neutral:**
   - ❌ *Incorrecto:* "Ayer nosotros nos reunimos e hicimos la base de datos con 5 tablas".
   - ✅ *Correcto:* "El equipo de desarrollo diseñó el modelo relacional compuesto por 5 entidades normalizadas en 3FN".
2. **Sin Emojis en el Documento Formal:**
   - Aunque en los Markdown (`.md`) usamos emojis para facilitar la lectura en GitHub, **en el documento de Word y PDF oficial se deben retirar**. El PDF es un documento institucional evaluable.
3. **Nombres de Software y Tecnologías:**
   - Escribir correctamente las marcas y tecnologías: *MySQL* (no mysql), *InnoDB* (no innodb), *Visual Studio Code*, *Mermaid*, *Spring Boot*, *Git*.

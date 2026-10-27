# 🤖 PROMPTS DE APOYO PARA INTELIGENCIA ARTIFICIAL
## Módulo 03 — Recursos para Juaco y Melo

Si vas a utilizar una Inteligencia Artificial (ChatGPT, Claude, Gemini o Copilot) para ayudarte a redactar o formatear partes de los documentos en Word, **utiliza estos prompts prediseñados**. Están configurados para que la IA respete las normas del SENA y no invente datos.

---

## 💬 Prompt 1: Convertir archivo Markdown a Texto Estructurado para Word

Copia y pega este prompt en la IA junto con el contenido de tu archivo `.md`:

```text
Actúa como un especialista en documentación técnica de software y Normas APA / SENA. 
A continuación te proporciono el texto de un archivo técnico en formato Markdown perteneciente a la [ESCRIBIR FASE: ej. Fase 4 de Base de Datos] del "Sistema de Gestión de Biblioteca Virtual".

Tu tarea es reescribir y organizar el contenido para que yo lo copie directamente a Microsoft Word, cumpliendo con estas reglas:
1. Redacta en tercera persona formal e impersonal (ej. "se diseñó", "se implementó", no "nosotros hicimos").
2. Elimina todos los emojis y reemplázalos por viñetas formales o títulos limpios.
3. Clasifica claramente qué texto es [TÍTULO 1], qué texto es [TÍTULO 2] y qué texto es [TÍTULO 3].
4. Las tablas deben estar organizadas de forma limpia, indicando [TABLA X: Nombre de la tabla].
5. Para los diagramas Mermaid, no los borres; escribe una nota clara indicando: "[INSERTAR AQUÍ FIGURA X: Descripción del diagrama y su código Mermaid]".
6. No inventes requerimientos ni cambies los nombres de los campos en inglés ni la lógica técnica.

Aquí está el contenido Markdown:
[PEGAR AQUÍ EL CONTENIDO DEL ARCHIVO .MD]
```

---

## 💬 Prompt 2: Redactar Resumen Ejecutivo / Introducción Técnica Formal

```text
Actúa como un redactor técnico de software. Redacta una Introducción y Justificación formal de 3 a 4 párrafos para la [ESCRIBIR FASE: ej. Fase 4 de Persistencia y Base de Datos] del "Sistema de Gestión de Biblioteca Virtual".

Datos del proyecto:
- Programa: Tecnología en Análisis y Desarrollo de Software (ADSO) - SENA Ficha 3239188
- Centro: CIES Neiva
- Enfoque técnico: [Ejemplo: Base de datos relacional MySQL / MariaDB en 3FN, política de baja lógica con is_deleted, y blindaje de préstamos activos].
- Tono: Altamente técnico, académico, formal y orientado a estándares de ingeniería.
- Extensión: Máximo 300 palabras.
```

---

## 💬 Prompt 3: Formatear Tablas Complejas para Word

```text
Actúa como un experto en maquetación de informes. Toma la siguiente tabla técnica en Markdown y transfórmala en un formato de texto estructurado listo para copiar en Word:
- Coloca un título formal en la parte superior: "Tabla [X]. [Nombre descriptivo]".
- Asegúrate de que las columnas tengan nombres claros y concisos.
- Agrega una nota de pie de tabla que diga: "Fuente: Elaboración propia del Equipo 08 (2026)".

Aquí está la tabla en Markdown:
[PEGAR AQUÍ LA TABLA]
```

---

## 💬 Prompt 4: Redactar Conclusiones de la Fase para el Cierre del Documento

```text
Redacta 3 conclusiones técnicas formales para finalizar el documento de la [ESCRIBIR FASE: ej. Fase 4 de Base de Datos] del Sistema de Gestión de Biblioteca Virtual para el SENA.
Cada conclusión debe enfocarse en:
1. Cumplimiento de los requerimientos y normalización arquitectónica.
2. Integridad y seguridad de los datos según las reglas de negocio.
3. Preparación de la base de datos para la siguiente fase de desarrollo.
```

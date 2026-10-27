# 📚 MANUAL DE TRABAJO ESTÁNDAR Y GUÍAS DE PROYECTO
## Sistema de Gestión de Biblioteca Virtual — SENA Ficha 3239188

> **Programa:** Tecnología en Análisis y Desarrollo de Software (ADSO)  
> **Centro:** Centro de la Industria, la Empresa y los Servicios (CIES) — Regional Huila  
> **Instructor Técnico:** Carlos Julio Cadena  
> **Equipo 08:** Juan David Romero Calderón, Juan Diego Oteca Pedreros, Jhojan Javier Melo Avella  

---

## 🎯 Propósito de este Directorio

Este espacio reúne **todo el estándar operativo, documental y técnico del proyecto**. Su objetivo principal es que cualquier integrante del equipo (**Juaco**, **Melo**, **Juan David**) o cualquier Inteligencia Artificial que apoye el desarrollo, cuente con un manual exacto y libre de ambigüedades sobre:

1. **Cómo trabajar con Git y hacer commits profesionales.**
2. **Cómo pasar los documentos Markdown (`.md`) a Microsoft Word y exportarlos a PDF.**
3. **Cómo diseñar una portada institucional impecable y configurar índices automáticos.**
4. **Cómo distribuir las tareas y commits para cumplir la meta de co-autoría exigida por el SENA (25% a 30% por integrante).**

---

## 🗂️ Estructura del Manual

Navega a cada carpeta según la tarea que vayas a realizar:

```text
docs/guia-de-trabajo-estandar/
│
├── 01_guia_commits_y_git/            --> ¿Cómo usar Git, qué ramas crear y cómo escribir commits?
│   ├── README.md                     (Guía paso a paso desde la terminal)
│   ├── estandar_conventional_commits.md (Diccionario de tipos: feat, docs, fix, con ejemplos)
│   └── solucion_errores_comunes.md   (Cómo resolver conflictos o errores sin entrar en pánico)
│
├── 02_guia_desarrollo_word_y_pdf/    --> ¿Cómo maquetar en Word y convertir a PDF con calidad SENA?
│   ├── README.md                     (Tipografía, márgenes 2.54 cm, interlineado 1.5 y formato)
│   ├── jerarquia_titulos_e_indice.md (Configuración de Título 1, 2, 3 e Índice Automático)
│   ├── tablas_diagramas_y_codigo.md  (Cómo pegar diagramas Mermaid, tablas limpias y código SQL)
│   └── exportacion_pdf_y_nombres.md  (Guardar en PDF y nombres oficiales en docs/pdf/)
│
├── 03_plantillas_y_recursos/         --> Recursos listos para copiar y usar
│   ├── portada_oficial_sena.md       (Texto exacto de la portada institucional para copiar en Word)
│   └── prompts_de_apoyo_para_ia.md   (Prompts listos para pedirle ayuda a ChatGPT / Claude / Gemini)
│
└── 04_matriz_fases_y_responsables/   --> ¿Quién hace qué fase para equilibrar los porcentajes?
    └── distribucion_de_fases.md      (Asignación de Fases 1 a 5 y metas de evaluación)
```

---

## ⚡ Reglas de Oro del Proyecto (Obligatorias)

1. **Prohibido commitear directo en `main`:** Todo cambio entra por ramas secundarias (`docs/...` o `feat/...`) y se integra a `develop`.
2. **Cada integrante debe hacer sus propios commits:** Cada uno debe clonar en su computador, configurar su nombre y correo en Git, y hacer `git push` desde su cuenta de GitHub.
3. **Todo PDF debe venir de su archivo Markdown:** El archivo `.md` es la fuente de la verdad técnica; el `.pdf` es el entregable formal institucional.
4. **Cero improvisaciones en formato:** Todos los documentos entregados al instructor Carlos Julio Cadena deben compartir la misma portada, la misma tipografía y la misma estructura.

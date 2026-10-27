# 👥 DISTRIBUCIÓN DE FASES Y NIVELACIÓN DE APORTES EN GIT
## Módulo 04 — Asignación de Responsabilidades y Metas de Evaluación

En la evaluación oficial de Fase 4 (2026-10-26), el instructor técnico emitió la siguiente observación prioritaria:

> ⚠️ **Hallazgo H-G08-01 (Error de Git / Colaboración — Alto): Desbalance en la cuota de co-autoría.**  
> *Descripción:* JuacHomeroC12 concentra el 91.5% de los commits del proyecto. Jhojan Melo registra 6.4% y Juan Diego Oteca registra 2.1%.  
> *Impacto:* **A partir de la Fase 5, cada aprendiz debe demostrar entre el 25% y 30% del volumen del proyecto para no reprobar individualmente.**

---

## 🎯 1. Plan de Nivelación Inmediato: Asignación de Documentos y PDFs

Para subsanar esta observación ante el instructor Carlos Julio Cadena y asegurar que las cuentas de GitHub de **Juaco** y **Melo** suban drásticamente su porcentaje de participación, se establece la siguiente asignación de maquetación y subida de PDFs:

| Fase | Documento Markdown | Responsable Asignado | Tarea Específica | Rama Git a Crear |
|---|---|---|---|---|
| **Fase 4** *(URGENTE)* | `docs/fase4_base_de_datos.md` | **Juan Diego Oteca ("Juaco")** | Maquetar en Word con portada SENA e índice, exportar a `docs/pdf/Fase4_Base_de_Datos_Sistema_Biblioteca_Digital.pdf` y hacer push. | `docs/fase4-pdf-oteca` |
| **Fase 1** | `docs/fase1_historias_usuario.md` | **Juan Diego Oteca ("Juaco")** | Homologar y actualizar la versión en PDF con la nueva portada e índice estándar. | `docs/fase1-pdf-oteca` |
| **Fase 2** | `docs/fase2_especificacion_requerimientos_ieee830.md` | **Jhojan Javier Melo ("Melo")** | Homologar y maquetar en Word la especificación IEEE 830, exportar a PDF y hacer push. | `docs/fase2-pdf-melo` |
| **Fase 3** | `docs/fase3_diseno_uml.md` | **Jhojan Javier Melo ("Melo")** | Exportar diagramas UML en alta definición, generar PDF con portada estándar y hacer push. | `docs/fase3-pdf-melo` |
| **Fase 5** *(Futura)* | `docs/fase5_prototipo_interfaces.md` | **Todo el equipo** | Desarrollo colaborativo: Vistas HTML/Figma (Juaco y Melo) + Integración y Documento técnico (Juan David). | `feat/fase5-prototipo-...` |

---

## 📊 2. Meta de Participación por Integrante

Al completar la subida de los PDFs y arrancar la Fase 5, la distribución de commits en GitHub (`Insights -> Contributors`) debe quedar equilibrada de la siguiente manera:

```text
┌────────────────────────────────────────────────────────┐
│ META DE CO-AUTORÍA EVALUABLE SENA                      │
├────────────────────────────────┬───────────────────────┤
│ Juan David Romero Calderón     │ 35% - 40% del total   │
│ Juan Diego Oteca Pedreros      │ 30% - 35% del total   │
│ Jhojan Javier Melo Avella      │ 30% - 35% del total   │
└────────────────────────────────┴───────────────────────┘
```

---

## 📝 3. Compromiso de Trabajo Individual

Para que los commits se contabilicen a favor de cada persona:
1. **Cada aprendiz debe trabajar desde su propia máquina y terminal**.
2. **No compartir una sola computadora para hacer todos los commits**.
3. **No subir archivos directamente por la página web de GitHub**. Siempre usar la terminal con `git add`, `git commit` y `git push`.
4. Seguir al pie de la letra las instrucciones de `01_guia_commits_y_git/README.md`.

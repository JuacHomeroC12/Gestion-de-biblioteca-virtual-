# 📤 EXPORTACIÓN A PDF Y CONVENCIÓN DE NOMBRES
## Módulo 02 — Guardado y Control de Entregables

Una vez maquetado y revisado el documento en Microsoft Word, el paso final es generar el archivo PDF oficial que se subirá al repositorio en la carpeta `docs/pdf/`.

---

## 💾 1. Cómo Exportar a PDF desde Microsoft Word

Para asegurar que el PDF mantenga la calidad de los diagramas, la nitidez de las fuentes y el índice interactivo con hipervínculos:

1. En Word, haz clic en **Archivo** (esquina superior izquierda).
2. Selecciona **Guardar como** (o *Exportar*).
3. Haz clic en **Examinar** y dirígete a la carpeta del proyecto:  
   `C:\Gestion-de-biblioteca-virtual-\docs\pdf\`
4. En el campo **Tipo**, despliega la lista y selecciona:  
   **PDF (*.pdf)**.
5. En la sección **Optimizar para**, asegúrate de que esté marcada la opción:  
   🔘 **Estándar (publicación en línea e impresión)**.
6. Haz clic en el botón **Opciones...** y verifica:
   - ☑️ Crear marcadores usando: **Títulos de Word**.
   - ☑️ Propiedades del documento.
7. Haz clic en **Guardar**.

---

## 📋 2. Matriz Oficial de Nombres de Archivo

El nombre de cada PDF debe coincidir exactamente con el estándar del proyecto. **No cambies mayúsculas, minúsculas ni guiones bajos**:

| Fase | Archivo Fuente en Markdown | Nombre Oficial del PDF en `docs/pdf/` |
|---|---|---|
| **Fase 1** | `docs/fase1_historias_usuario.md` | `Fase1_Historias_Usuario.pdf` |
| **Fase 2** | `docs/fase2_especificacion_requerimientos_ieee830.md` | `Fase2_Requerimientos_Sistema_Biblioteca_Digital.pdf` |
| **Fase 3** | `docs/fase3_diseno_uml.md` | `Fase3_Sistema_Biblioteca_Digital.pdf` |
| **Fase 4** | `docs/fase4_base_de_datos.md` | `Fase4_Base_de_Datos_Sistema_Biblioteca_Digital.pdf` *(URGENTE)* |
| **Fase 5** | `docs/fase5_prototipo_interfaces.md` | `Fase5_Prototipo_Interfaces_Usuario.pdf` *(Próxima Fase)* |

---

## ✅ 3. Lista de Verificación (Checklist) antes de Subir a Git

Antes de ejecutar los comandos `git add` y `git commit`, abre el PDF generado y revisa:

- [ ] **Portada Completa:** Tiene los nombres de los 3 integrantes, Ficha 3239188, CIES Neiva y el nombre del Instructor Carlos Julio Cadena.
- [ ] **Sin número en la portada:** La primera página no tiene el número "1" visible.
- [ ] **Índice interactivo:** La tabla de contenido muestra las páginas correctas y actualizadas.
- [ ] **Diagramas legibles:** Las imágenes y diagramas Mermaid tienen fondo blanco y se leen todos los textos sin pixelarse.
- [ ] **Tablas completas:** Ninguna tabla tiene columnas apretadas o texto cortado por la mitad.
- [ ] **Ubicación exacta:** El archivo quedó guardado dentro de la carpeta `docs/pdf/` del repositorio.
